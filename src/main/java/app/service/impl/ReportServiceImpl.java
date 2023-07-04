package app.service.impl;

import app.dao.ReportDao;
import app.service.ReportService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
    private ReportDao reportDao;

    public ReportServiceImpl(ReportDao reportDao) {
        this.reportDao = reportDao;
    }

    @Override
    public List<Object[]> getGeneralReport(Long userId) {
        return reportDao.getGeneralReport(userId);
    }
}
