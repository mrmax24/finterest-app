package app.controller;
import app.model.Account;
import app.model.TransactionCategory;
import app.service.AccountService;
import app.service.ReportService;
import app.service.TransactionCategoryService;
import app.service.TransactionService;
import app.service.session.SessionUserHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {
    private final ReportService reportService;
    private final SessionUserHolder sessionUserHolder;
    private final TransactionCategoryService transactionCategoryService;
    private final AccountService accountService;
    private final TransactionService transactionService;

    public ReportController(ReportService reportService,
                            SessionUserHolder sessionUserHolder,
                            TransactionCategoryService transactionCategoryService,
                            AccountService accountService,
                            TransactionService transactionService) {
        this.reportService = reportService;
        this.sessionUserHolder = sessionUserHolder;
        this.transactionCategoryService = transactionCategoryService;
        this.accountService = accountService;
        this.transactionService = transactionService;
    }

    @ModelAttribute("accounts")
    public List<Account> getAccounts() {
        Long userId = sessionUserHolder.getUserFromSession().getId();
        return accountService.getAllByUser(userId);
    }

    @ModelAttribute("categories")
    public List<TransactionCategory> getCategories() {
        return transactionCategoryService.getAll();
    }

    @GetMapping
    public String getExpensesByCategoryAndMonth(
            @RequestParam(value = "accountId", required = false) List<Long> accountIds,
            @RequestParam(value = "categoryId", required = false) Long categoryId,
            @RequestParam(name = "month", required = false) String selectedDate, Model model) {
        Long userId = sessionUserHolder.getUserFromSession().getId();
        BigDecimal totalExpense = BigDecimal.ZERO;

        List<Object[]> expenses = reportService.getExpensesByCategoryAndMonthAndCategory(
                userId, accountIds, categoryId, selectedDate);

        for (Object[] expense : expenses) {
            BigDecimal expenseAmount = (BigDecimal) expense[1];
            totalExpense = totalExpense.add(expenseAmount);
        }
        model.addAttribute("expenses", expenses);
        model.addAttribute("totalExpense", totalExpense);
        return "report";
    }
}
