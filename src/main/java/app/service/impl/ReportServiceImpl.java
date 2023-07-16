package app.service.impl;

import app.dao.ReportDao;
import app.service.ReportService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
    private final ReportDao reportDao;

    public ReportServiceImpl(ReportDao reportDao) {
        this.reportDao = reportDao;
    }

    @Override
    public List<Object[]> getExpensesByCategoryAndMonthAndCategory(
            Long userId, List<Long> accountIds, Long categoryId, String selectedDate) {
        return reportDao.getExpensesByCategoryAndMonthAndCategory(
                userId, accountIds, categoryId, selectedDate);
    }
}
