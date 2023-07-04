package app.service.impl;

import app.model.Account;
import app.service.AccountService;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import app.dao.TransactionDao;
import app.model.Transaction;
import app.service.TransactionService;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class TransactionServiceImpl implements TransactionService {
    private final TransactionDao transactionDao;
    private final AccountService accountService;
    private final Logger logger;

    public TransactionServiceImpl(TransactionDao transactionDao,
                                  AccountService accountService, Logger logger) {
        this.transactionDao = transactionDao;
        this.accountService = accountService;
        this.logger = logger;
    }

    @Override
    public Transaction add(Transaction transaction) throws RuntimeException {
        logger.debug("Transaction was added: ", transaction);
        BigDecimal balance = transaction.getAccount().getBalance();
        if (balance.subtract(transaction.getAmount()).compareTo(BigDecimal.ZERO) >= 0) {
            Transaction addedTransaction = transactionDao.add(transaction);
            Account account = transaction.getAccount();
            BigDecimal expenseAmount = transaction.getAmount();
            accountService.updateBalanceWithExpenses(account, expenseAmount);
            return addedTransaction;
        } else {
            throw new RuntimeException("Account has insufficient funds");
        }
    }

    @Override
    public List<Transaction> getAll() {
        return transactionDao.getAll();
    }

    @Override
    public Optional<Transaction> get(Long id) {
        return transactionDao.get(id);
    }

    @Override
    public List<Transaction> getByAccount(Long accountId) {
        return transactionDao.getByAccount(accountId);
    }

    @Override
    public void delete(Long id) {
        transactionDao.delete(id);
    }

    @Override
    public Transaction update(Transaction transaction) {

        return transactionDao.update(transaction);
    }

    @Override
    public Transaction deleteWithUpdate(Long id) {
        Transaction deletedTransaction = transactionDao.deleteWithUpdate(id);
        Account account = deletedTransaction.getAccount();
        accountService.updateBalanceWithRefund(account, deletedTransaction.getAmount());
        return deletedTransaction;
    }
}
