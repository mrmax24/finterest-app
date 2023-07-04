package app.service.impl;

import app.dao.TransactionCategoryDao;
import app.model.TransactionCategory;
import app.service.TransactionCategoryService;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class TransactionCategoryServiceImpl implements TransactionCategoryService  {
     private TransactionCategoryDao transactionCategoryDao;

    public TransactionCategoryServiceImpl(TransactionCategoryDao transactionCategoryDao) {
        this.transactionCategoryDao = transactionCategoryDao;
    }

    @Override
    public TransactionCategory add(TransactionCategory category) {
        return transactionCategoryDao.add(category);
    }

    @Override
    public List<TransactionCategory> getAll() {
        return transactionCategoryDao.getAll();
    }

    @Override
    public TransactionCategory getByName(String roleName) {
        return null;
    }

    @Override
    public Optional<TransactionCategory> get(Long id) {
        return transactionCategoryDao.get(id);
    }
}