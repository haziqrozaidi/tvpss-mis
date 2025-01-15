package com.example.tvpssmis.repository;

import com.example.tvpssmis.entity.Content;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContentRepository extends JpaRepository<Content, Long> {
    // Additional query methods can be defined here if needed
}
