#!/bin/bash
set -euo pipefail

# ============================================
# Script de Infraestrutura - SkillBridge
# Cria:
#  - Resource Group
#  - Azure Container Registry (ACR)
#  - Azure Container Instances (API + SQL Server)
#
# Requisitos:
#  - Azure CLI instalado e logado (az login)
#  - ACR será usado pela pipeline de build para push da imagem da API
# ============================================

# -------------------------------
# Variáveis de ambiente do projeto
# -------------------------------
RESOURCE_GROUP="rg-skillbridge"
LOCATION="eastus"

ACR_NAME="acrskillbridge"
ACR_SKU="Basic"

# Imagem da API no ACR (pipeline de build deve gerar isso)
API_IMAGE_NAME="fiap/skillbridge-api"
API_IMAGE_TAG="${1:-latest}"   # permite passar a tag como parâmetro: ./script-infra-skillbridge.sh 16

# Nomes dos Container Instances
ACI_API_NAME="aci-skillbridge-api"
ACI_SQL_NAME="aci-sqlskillbridge"

# DNS público para cada ACI (precisa ser único por região)
API_DNS_LABEL="aci-skillbridge-api"
SQL_DNS_LABEL="aci-sqlskillbridge"

# Portas
API_PORT=8080
SQL_PORT=1433

# Senha do SA do SQL Server em container (trocar em produção!)
SQL_SA_PASSWORD="Fiap@Skillbridge2025"

echo "============================================"
echo "  SkillBridge - Script de Infraestrutura"
echo "  Resource Group : $RESOURCE_GROUP"
echo "  Location       : $LOCATION"
echo "  ACR            : $ACR_NAME"
echo "  ACI API        : $ACI_API_NAME"
echo "  ACI SQL        : $ACI_SQL_NAME"
echo "============================================"

# -------------------------------
# Resource Group
# -------------------------------
echo "▶ Criando Resource Group..."
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --output table

# -------------------------------
# Azure Container Registry (ACR)
# -------------------------------
echo "▶ Criando ACR..."
az acr create \
  --name "$ACR_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku "$ACR_SKU" \
  --admin-enabled true \
  --output table

ACR_LOGIN_SERVER=$(az acr show -n "$ACR_NAME" --query loginServer -o tsv)
ACR_USER=$(az acr credential show -n "$ACR_NAME" --query username -o tsv)
ACR_PASS=$(az acr credential show -n "$ACR_NAME" --query "passwords[0].value" -o tsv)

echo "✅ ACR criado: $ACR_LOGIN_SERVER"

# -------------------------------
# Azure Container Instance - SQL Server
# -------------------------------
echo "▶ Removendo ACI SQL antigo (se existir)..."
az container delete \
  --name "$ACI_SQL_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --yes --only-show-errors || true

echo "▶ Criando ACI para SQL Server (container)..."
az container create \
  --name "$ACI_SQL_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --image mcr.microsoft.com/mssql/server:2022-latest \
  --cpu 2 \
  --memory 4 \
  --os-type Linux \
  --ports "$SQL_PORT" \
  --dns-name-label "$SQL_DNS_LABEL" \
  --environment-variables \
      "ACCEPT_EULA=Y" \
      "MSSQL_SA_PASSWORD=$SQL_SA_PASSWORD" \
      "MSSQL_PID=Developer" \
  --output table

SQL_FQDN="${SQL_DNS_LABEL}.${LOCATION}.azurecontainer.io"
echo "✅ SQL Server em container criado em: $SQL_FQDN:$SQL_PORT"
echo "   String JDBC (exemplo):"
echo "   jdbc:sqlserver://$SQL_FQDN:$SQL_PORT;databaseName=db_skillbridge;encrypt=true;trustServerCertificate=true;loginTimeout=30;"

# -------------------------------
# Azure Container Instance - API SkillBridge
# -------------------------------
echo "▶ Removendo ACI API antigo (se existir)..."
az container delete \
  --name "$ACI_API_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --yes --only-show-errors || true

echo "▶ Criando ACI para API SkillBridge..."
az container create \
  --name "$ACI_API_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --image "$ACR_LOGIN_SERVER/$API_IMAGE_NAME:$API_IMAGE_TAG" \
  --cpu 1 \
  --memory 1.5 \
  --os-type Linux \
  --ports "$API_PORT" \
  --dns-name-label "$API_DNS_LABEL" \
  --protocol TCP \
  --restart-policy Always \
  --registry-login-server "$ACR_LOGIN_SERVER" \
  --registry-username "$ACR_USER" \
  --registry-password "$ACR_PASS" \
  --output table

API_FQDN="${API_DNS_LABEL}.${LOCATION}.azurecontainer.io"

echo "============================================"
echo "✅ Infra SkillBridge criada com sucesso!"
echo ""
echo "API:"
echo "  URL:  http://${API_FQDN}:${API_PORT}"
echo ""
echo "Banco (SQL Server em ACI):"
echo "  Host: $SQL_FQDN"
echo "  Porta: $SQL_PORT"
echo "  Usuário: sa"
echo "  Senha:   $SQL_SA_PASSWORD"
echo "============================================"
