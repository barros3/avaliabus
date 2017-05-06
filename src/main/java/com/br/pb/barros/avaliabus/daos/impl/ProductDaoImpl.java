package com.br.pb.barros.avaliabus.daos.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.PaginatorQueryHelper;
import com.br.pb.barros.avaliabus.daos.ProductDao;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.br.pb.barros.avaliabus.models.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Product> all() {
		return manager.createQuery("select p from Product p", Product.class).getResultList();
	}

	public void save(Product product) {
		manager.persist(product);
	}

	public Product findById(Integer id) {
		return manager.find(Product.class, id);
	}

	public void remove(Product product) {
		manager.remove(product);
	}

	public void update(Product product) {
		manager.merge(product);
	}

	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Product.class, page, max);
	}

}
