package com.example.tvpssmis.service.content;

import com.example.tvpssmis.entity.Content;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public class ContentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public Optional<Content> findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return Optional.ofNullable(currentSession.get(Content.class, id));
    }

    public void save(Content content) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(content);
    }

    public void evict(Content content) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(content);
    }

    public void update(int id, Content content) {
        Session currentSession = sessionFactory.getCurrentSession();
        Content existingContent = currentSession.get(Content.class, id);

        if (existingContent != null) {
            existingContent.setProgram(content.getProgram());
            existingContent.setContentName(content.getContentName());
            existingContent.setTitle(content.getTitle());
            existingContent.setDescription(content.getDescription());
            existingContent.setDate(content.getDate());
            existingContent.setCategory(content.getCategory());
            currentSession.merge(existingContent);
        }
    }

    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Content contentToDelete = currentSession.get(Content.class, id);

        if (contentToDelete != null) {
            currentSession.delete(contentToDelete);
        }
    }

    public List<Content> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Content", Content.class).getResultList();
    }

    public List<Content> findByProgramId(int programId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Content where program.program_id = :programId", Content.class)
                .setParameter("programId", programId)
                .getResultList();
    }

    public List<Content> findByCategory(String category) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Content where category = :category", Content.class)
                .setParameter("category", category)
                .getResultList();
    }

    public List<Content> findByUploadDate(Date uploadDate) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Content where upload_date = :uploadDate", Content.class)
                .setParameter("uploadDate", uploadDate)
                .getResultList();
    }

    public Optional<Content> findByTitle(String title) {
        Session currentSession = sessionFactory.getCurrentSession();
        return Optional.ofNullable(currentSession.createQuery("from Content where title = :title", Content.class)
                .setParameter("title", title)
                .uniqueResult());
    }

    public long countContent() {
        Session currentSession = sessionFactory.getCurrentSession();
        return (long) currentSession.createQuery("select count(c) from Content c").uniqueResult();
    }
}
