package app.dao.impl;

import app.dao.AbstractDao;
import app.dao.TransactionCategoryDao;
import app.model.TransactionCategory;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class TransactionCategoryDaoImpl extends AbstractDao<TransactionCategory>
        implements TransactionCategoryDao {
    public TransactionCategoryDaoImpl(SessionFactory factory) {
        super(factory, TransactionCategory.class);
    }

    @Override
    public TransactionCategory getByName(String category) {
        return null;
    }

}
