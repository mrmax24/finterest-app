package app.dao.impl;

import app.dao.AbstractDao;
import app.model.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import app.dao.TransactionDao;
import java.util.List;

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
