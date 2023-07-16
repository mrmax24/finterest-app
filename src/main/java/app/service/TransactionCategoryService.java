package app.service;

import app.model.TransactionCategory;
import java.util.List;
import java.util.Optional;

public interface TransactionCategoryService {

    TransactionCategory add(TransactionCategory category);

    List<TransactionCategory> getAll();

    TransactionCategory getByName(String category);

    Optional<TransactionCategory> get(Long id);
}
