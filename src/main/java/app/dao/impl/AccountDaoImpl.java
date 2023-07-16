package app.dao.impl;

import app.dao.AbstractDao;
import app.dao.AccountDao;
import app.exception.DataProcessingException;
import app.model.Account;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl extends AbstractDao<Account> implements AccountDao {
    public AccountDaoImpl(SessionFactory factory) {
        super(factory, Account.class);
    }

    @Override
    public Optional<Account> get(Long id, Long userId) {
        try (Session session = factory.openSession()) {
            Query<Account> query = session.createQuery("FROM Account a"
                    + " join fetch a.user u WHERE a.id = :id AND u.id = :userId", Account.class);
            query.setParameter("id", id);
            query.setParameter("userId", userId);
            return query.uniqueResultOptional();
        } catch (Exception e) {
            throw new DataProcessingException("Can't get account, id: " + id, e);
        }
    }

    @Override
    public List<Account> getAllByUser(Long userId) {
        try (Session session = factory.openSession()) {
            Query<Account> query = session.createQuery("FROM Account a"
                    + " join fetch a.user u WHERE u.id = :userId", Account.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } catch (Exception e) {
            throw new DataProcessingException("Can't get account, id: " + userId, e);
        }
    }

    public BigDecimal getTotalBalance(Long userId) {
        BigDecimal totalBalance = BigDecimal.ZERO;

        try {
            Session session = factory.openSession();
            Query<BigDecimal> query = session.createQuery("SELECT SUM(a.balance) "
                    + "FROM Account a"
                    + " join a.user u WHERE u.id = :userId", BigDecimal.class);
            query.setParameter("userId", userId);
            BigDecimal result = query.getSingleResult();

            if (result != null) {
                totalBalance = result;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return totalBalance;
    }
}
