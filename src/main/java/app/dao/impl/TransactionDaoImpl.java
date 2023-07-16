package app.dao.impl;

import app.dao.AbstractDao;
import app.dao.TransactionDao;
import app.model.Transaction;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class TransactionDaoImpl extends AbstractDao<Transaction> implements TransactionDao {
    public TransactionDaoImpl(SessionFactory factory) {
        super(factory, Transaction.class);
    }

    @Override
    public List<Transaction> getByAccount(Long accountId) {
        try (Session session = factory.openSession()) {
            Query<Transaction> query = session.createQuery(
                    "SELECT t FROM Transaction t "
                            + "join fetch t.account a "
                            + "join fetch a.user "
                            + "WHERE a.id = :accountId", Transaction.class);
            query.setParameter("accountId", accountId);
            return query.getResultList();
        }
    }
}
