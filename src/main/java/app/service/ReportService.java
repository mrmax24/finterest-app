package app.service;

import java.util.List;

public interface ReportService {
    List<Object[]> getGeneralReport(Long userId);
}
