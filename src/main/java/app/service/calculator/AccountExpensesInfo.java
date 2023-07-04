package app.service.calculator;

import app.model.Transaction;
import app.model.TransactionCategory;
import app.model.User;
import app.service.AccountService;
import app.service.ReportService;
import app.service.TransactionService;
import app.service.session.SessionUserHolder;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class AccountExpensesInfo {
    private final SessionUserHolder sessionUserHolder;
    private final AccountService accountService;
    private final TransactionService transactionService;
    private final ReportService reportService;

    public AccountExpensesInfo(SessionUserHolder sessionUserHolder,
                               AccountService accountService,
                               TransactionService transactionService,
                               ReportService reportService) {
        this.sessionUserHolder = sessionUserHolder;
        this.accountService = accountService;
        this.transactionService = transactionService;
        this.reportService = reportService;
    }

    public BigDecimal getAccountExpensesInfo() {
        BigDecimal userTransactions = BigDecimal.ZERO;
        Long userId = sessionUserHolder.getUserFromSession().getId();
        List<Transaction> allTransactions = transactionService.getAll();
        for (Transaction transaction : allTransactions) {
            if (transaction.getAccount().getUser().getId().equals(userId)) {
                userTransactions = userTransactions.add(transaction.getAmount());

            }
        }
        return userTransactions;
    }

    public Map<TransactionCategory.CategoryName, BigDecimal> getAccountExpensesPercentage() {
        BigDecimal totalExpenses = getAccountExpensesInfo();
        BigDecimal hundredPercent = BigDecimal.valueOf(100);

        User userFromSession = sessionUserHolder.getUserFromSession();
        Long userId = userFromSession.getId();
        List<Object[]> generalReport = reportService.getGeneralReport(userId);

        Map<TransactionCategory.CategoryName, BigDecimal> categoryPercentages = new HashMap<>();

        for (Object[] categoryExpense : generalReport) {
            TransactionCategory.CategoryName category = (TransactionCategory.CategoryName) categoryExpense[0];
            BigDecimal amount = (BigDecimal) categoryExpense[1];
            BigDecimal percentage = amount.divide(totalExpenses, 4, RoundingMode.HALF_UP)
                    .multiply(hundredPercent);
            categoryPercentages.put(category, percentage);
        }

        return categoryPercentages;
    }
}