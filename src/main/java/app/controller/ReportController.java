package app.controller;
import app.model.User;
import app.service.ReportService;
import app.service.calculator.AccountExpensesInfo;
import app.service.session.SessionUserHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {
    private final ReportService reportService;
    private final SessionUserHolder sessionUserHolder;
    private final AccountExpensesInfo accountExpensesInfo;

    public ReportController(ReportService reportService,
                            SessionUserHolder sessionUserHolder,
                            AccountExpensesInfo accountExpensesInfo) {
        this.reportService = reportService;
        this.sessionUserHolder = sessionUserHolder;
        this.accountExpensesInfo = accountExpensesInfo;
    }

    @GetMapping
    public String getReports(Model model) {
        User userFromSession = sessionUserHolder.getUserFromSession();
        Long userId = userFromSession.getId();
        List<Object[]> generalReport = reportService.getGeneralReport(userId);
        model.addAttribute("categoryExpenses", generalReport);
        BigDecimal userExpenses = this.accountExpensesInfo.getAccountExpensesInfo();
        model.addAttribute("userExpenses", userExpenses);
        return "report";
    }
}
