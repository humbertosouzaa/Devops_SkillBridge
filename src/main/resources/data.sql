------------------------------------------------------------
-- USUARIOS
------------------------------------------------------------
INSERT INTO usuarios (id, nome, email) VALUES (1, 'Ana Silva', 'ana.silva@skillbridge.ai');
INSERT INTO usuarios (id, nome, email) VALUES (2, 'Bruno Costa', 'bruno.costa@cloudfuture.dev');
INSERT INTO usuarios (id, nome, email) VALUES (3, 'Carla Mendes', 'carla.mendes@remotejobs.io');
INSERT INTO usuarios (id, nome, email) VALUES (4, 'Diego Rocha', 'diego.rocha@automationlab.tech');
INSERT INTO usuarios (id, nome, email) VALUES (5, 'Eduarda Lima', 'eduarda.lima@uxfuture.design');
INSERT INTO usuarios (id, nome, email) VALUES (6, 'Felipe Santos', 'felipe.santos@datapipeline.ai');
INSERT INTO usuarios (id, nome, email) VALUES (7, 'Gabriela Souza', 'gabriela.souza@hrfuture.work');
INSERT INTO usuarios (id, nome, email) VALUES (8, 'Henrique Alves', 'henrique.alves@fullstackfuture.dev');
INSERT INTO usuarios (id, nome, email) VALUES (9, 'Isabela Torres', 'isabela.torres@remotework.global');
INSERT INTO usuarios (id, nome, email) VALUES (10, 'João Pereira', 'joao.pereira@cybersec.future');

------------------------------------------------------------
-- SKILLS
------------------------------------------------------------
INSERT INTO skills (id, nome, descricao) VALUES (1, 'Python para Dados', 'Manipulação e análise de dados com Python.');
INSERT INTO skills (id, nome, descricao) VALUES (2, 'IA Generativa', 'Aplicação de modelos de IA generativa em cenários reais.');
INSERT INTO skills (id, nome, descricao) VALUES (3, 'Arquitetura Cloud', 'Desenho de soluções escaláveis em nuvem.');
INSERT INTO skills (id, nome, descricao) VALUES (4, 'MLOps', 'Automatização do ciclo de vida de modelos de Machine Learning.');
INSERT INTO skills (id, nome, descricao) VALUES (5, 'Automação com RPA', 'Automação de processos de negócio com RPA.');
INSERT INTO skills (id, nome, descricao) VALUES (6, 'UX/UI Design', 'Design de experiências e interfaces para produtos digitais.');
INSERT INTO skills (id, nome, descricao) VALUES (7, 'People Analytics', 'Uso de dados para gestão de pessoas.');
INSERT INTO skills (id, nome, descricao) VALUES (8, 'Segurança Cibernética', 'Proteção de ambientes, redes e dados.');
INSERT INTO skills (id, nome, descricao) VALUES (9, 'Desenvolvimento Fullstack', 'Desenvolvimento backend e frontend integrados.');
INSERT INTO skills (id, nome, descricao) VALUES (10, 'Conteúdo Digital com IA', 'Criação de conteúdo digital usando IA.');

------------------------------------------------------------
-- COURSES
------------------------------------------------------------
INSERT INTO courses (id, title, provider, url) VALUES (1, 'Fundamentos de Machine Learning', 'Coursera', 'https://coursera.org/ml-future');
INSERT INTO courses (id, title, provider, url) VALUES (2, 'Arquiteturas Cloud Nativas', 'Alura', 'https://alura.com.br/cloud-native');
INSERT INTO courses (id, title, provider, url) VALUES (3, 'MLOps na Prática', 'DIO', 'https://dio.me/mlops-pratico');
INSERT INTO courses (id, title, provider, url) VALUES (4, 'Automação de Processos com RPA', 'Udemy', 'https://udemy.com/rpa-automation');
INSERT INTO courses (id, title, provider, url) VALUES (5, 'UX/UI Design para Produtos Digitais', 'Alura', 'https://alura.com.br/ux-ui-produtos');
INSERT INTO courses (id, title, provider, url) VALUES (6, 'People Analytics e Cultura Data-Driven em RH', 'Coursera', 'https://coursera.org/people-analytics');
INSERT INTO courses (id, title, provider, url) VALUES (7, 'Fundamentos de Segurança Cibernética', 'Cisco Networking Academy', 'https://netacad.com/cybersecurity');
INSERT INTO courses (id, title, provider, url) VALUES (8, 'Desenvolvimento Fullstack com foco em Nuvem', 'DIO', 'https://dio.me/fullstack-cloud');
INSERT INTO courses (id, title, provider, url) VALUES (9, 'Criação de Conteúdo Digital com IA Generativa', 'Udemy', 'https://udemy.com/conteudo-ia');
INSERT INTO courses (id, title, provider, url) VALUES (10, 'Transição de Carreira para Tecnologia', 'DIO', 'https://dio.me/carreira-tech');

------------------------------------------------------------
-- LEARNING PATHS
------------------------------------------------------------
INSERT INTO learning_paths (id, name) VALUES (1, 'Requalificação em IA para Dados');
INSERT INTO learning_paths (id, name) VALUES (2, 'Especialização em Cloud e MLOps');
INSERT INTO learning_paths (id, name) VALUES (3, 'Transição para Product Management Digital');
INSERT INTO learning_paths (id, name) VALUES (4, 'Automação Inteligente com IA e RPA');
INSERT INTO learning_paths (id, name) VALUES (5, 'UX/UI e Experiência do Usuário');
INSERT INTO learning_paths (id, name) VALUES (6, 'Engenharia de Dados e MLOps');
INSERT INTO learning_paths (id, name) VALUES (7, 'People Analytics e RH do Futuro');
INSERT INTO learning_paths (id, name) VALUES (8, 'Fullstack para Times de IA');
INSERT INTO learning_paths (id, name) VALUES (9, 'Conteúdo Digital e Educação Online');
INSERT INTO learning_paths (id, name) VALUES (10, 'Segurança Cibernética em Nuvem');

------------------------------------------------------------
-- LEARNINGPATH_COURSES (N:N)
------------------------------------------------------------
-- Path 1
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (1, 1);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (1, 3);

-- Path 2
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (2, 2);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (2, 3);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (2, 8);

-- Path 3
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (3, 5);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (3, 10);

-- Path 4
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (4, 4);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (4, 1);

-- Path 5
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (5, 5);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (5, 9);

-- Path 6
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (6, 1);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (6, 3);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (6, 2);

-- Path 7
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (7, 6);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (7, 9);

-- Path 8
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (8, 8);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (8, 2);

-- Path 9
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (9, 9);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (9, 10);

-- Path 10
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (10, 7);
INSERT INTO learningpath_courses (learningpath_id, course_id) VALUES (10, 2);

------------------------------------------------------------
-- USER_SKILLS
------------------------------------------------------------
-- Ana (1)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (1, 1, 1, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (2, 1, 2, 3);

-- Bruno (2)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (3, 2, 1, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (4, 2, 3, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (5, 2, 4, 3);

-- Carla (3)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (6, 3, 6, 2);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (7, 3, 10, 1);

-- Diego (4)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (8, 4, 5, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (9, 4, 2, 2);

-- Eduarda (5)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (10, 5, 6, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (11, 5, 2, 2);

-- Felipe (6)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (12, 6, 1, 3);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (13, 6, 4, 2);

-- Gabriela (7)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (14, 7, 7, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (15, 7, 2, 2);

-- Henrique (8)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (16, 8, 9, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (17, 8, 2, 3);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (18, 8, 3, 3);

-- Isabela (9)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (19, 9, 10, 4);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (20, 9, 2, 3);

-- João (10)
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (21, 10, 8, 3);
INSERT INTO user_skills (id, usuario_id, skill_id, level) VALUES (22, 10, 1, 2);

------------------------------------------------------------
-- WORKS
------------------------------------------------------------
INSERT INTO works (id, title, description) VALUES
(1, 'Migração para Arquitetura Cloud', 'Projeto de migração de workloads legados para arquitetura cloud nativa.');

INSERT INTO works (id, title, description) VALUES
(2, 'Automação de Processos com RPA', 'Implementação de robôs para automatizar processos repetitivos em backoffice.');

INSERT INTO works (id, title, description) VALUES
(3, 'Plataforma de Conteúdo com IA', 'Criação de trilhas de aprendizado personalizadas usando IA generativa.');

------------------------------------------------------------
-- RECOMMENDATIONS
------------------------------------------------------------
INSERT INTO recommendations (id, content) VALUES
(1, 'Recomenda-se focar em trilhas de dados e IA generativa para aumentar a empregabilidade nos próximos 2 anos.');

INSERT INTO recommendations (id, content) VALUES
(2, 'Para perfis de produto, combinar UX/UI com fundamentos de IA traz alta vantagem competitiva.');

INSERT INTO recommendations (id, content) VALUES
(3, 'Profissionais de infraestrutura devem fortalecer competências em segurança cibernética e arquiteturas cloud.');
