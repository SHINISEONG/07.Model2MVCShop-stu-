package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {
	public void addProduct(Product product) throws Exception;
	public Product getProduct(int prodNo) throws Exception;
	public Map<String, Object> getProductList(Search search) throws Exception;
	public void updateProduct(Product product) throws Exception;
	//TODO 모델링 기술서랑 다르게 void?? UserService update method역시 모델링 문서에는 UserVO를
	//리턴하도록 돼 있지만 void로 수행하고 있음 체크할 것
}
