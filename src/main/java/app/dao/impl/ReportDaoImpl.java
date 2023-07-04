package app.dao.impl;

import app.dao.ReportDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReportDaoImpl implements ReportDao {
    private final SessionFactory sessionFactory;

    public ReportDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Object[]> getGeneralReport(Long userId) {
        try (Session session = sessionFactory.openSession()) {
            Query<Object[]> query = session.createQuery(
                    "SELECT t.transactionCategory.category, SUM(t.amount), " +
                            "ROUND(SUM(t.amount) / (SELECT SUM(t2.amount) " +
                            "FROM Transaction t2 WHERE t2.account.user.id = :userId) * 100, 0) " +
                            "FROM Transaction t " +
                            "WHERE t.account.user.id = :userId " +
                            "GROUP BY t.transactionCategory " +
                            "ORDER BY SUM(t.amount) DESC", Object[].class);
            query.setParameter("userId", userId);

            return query.getResultList();
        }
    }
}