package app.dao;

import java.util.List;

public interface ReportDao {
    List<Object[]> getGeneralReport(Long userId);

}
