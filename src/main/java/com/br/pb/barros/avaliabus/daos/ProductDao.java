package com.br.pb.barros.avaliabus.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.br.pb.barros.avaliabus.models.Product;

@Repository
public interface ProductDao {

	public List<Product> all();

	public void save(Product product);

	public Product findById(Integer id);

	public void remove(Product product);

	public void update(Product product);

	public PaginatedList paginated(int page, int max);

}
