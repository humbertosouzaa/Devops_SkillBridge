package com.example.skill_bridge.service;

import org.springframework.stereotype.Service;
import com.example.skill_bridge.repository.RecommendationRepository;
import com.example.skill_bridge.entity.Recommendation;

import java.util.List;

@Service
public class RecommendationService {

    private final RecommendationRepository repo;

    public RecommendationService(RecommendationRepository repo) {
        this.repo = repo;
    }

    public List<Recommendation> getAll() {
        return repo.findAll();
    }

    public Recommendation getById(Long id) {
        return repo.findById(id)
                .orElseThrow(() -> new RuntimeException("Recommendation not found"));
    }

    public Recommendation create(Recommendation r) {
        return repo.save(r);
    }

    public Recommendation update(Long id, Recommendation r) {
        r.setId(id);
        return repo.save(r);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
