package com.model2.mvc.web.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
		///setter method for DI
		public void setPurchaseService(PurchaseService purchaseService) {
			this.purchaseService = purchaseService;
		}
		
		public void setProductService(ProductService productService) {
			this.productService = productService;
		}
	



	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	///Constructor
	public PurchaseController() {
		System.out.println(this.getClass());
	}

	///RequestMethod
	@RequestMapping("addPurchase")
	public ModelAndView addPurchase(@ModelAttribute("purchase")Purchase purchase,
									@RequestParam("prodNo") int prodNo,
									@RequestParam("quantity") int quantity,
									HttpSession session) throws Exception {
		Product product = productService.getProduct(prodNo);
		product.setStock(product.getStock()-quantity);
		productService.updateProduct(product);
		
		purchase.setPurchaseProd(product);
		purchase.setBuyer((User)session.getAttribute("user"));
		
		purchaseService.addPurchase(purchase);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("forward:/purchase/addPurchase.jsp");
		return modelAndView;
	}
	
	@RequestMapping("addPurchaseView")
	public ModelAndView addPurchaseView(@RequestParam("prodNo") int prodNo) throws Exception {
		
		Product product = productService.getProduct(prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("product", product);
		modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");
		return modelAndView;
	}
	
	@RequestMapping("getPurchase")
	public ModelAndView addPurchase(@RequestParam("tranNo") int tranNo) throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("forward:/purchase/getPurchase.jsp");
		return modelAndView;

	}
	
	@RequestMapping("listPurchase")
	public ModelAndView listPurchase(@ModelAttribute("search") Search search ,
			  @RequestParam(value="searchOrderType", defaultValue = "orderByDateDESC") String searchOrderType,
			  HttpSession session) throws Exception {
		
		
		search.setSearchOrderType(searchOrderType);
		
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = purchaseService.getPurchaseList(search, ((User)session.getAttribute("user")).getUserId());
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
		
		return modelAndView;

	}
	
	@RequestMapping("updatePurchaseView")
	public ModelAndView updatePurchaseView(@RequestParam("tranNo") int tranNo) throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		Product product = purchase.getPurchaseProd();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.addObject("product", product);
		modelAndView.setViewName("forward:/purchase/updatePurchaseView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("updatePurchase")
	public ModelAndView updatePurchase(@ModelAttribute("purchase")Purchase purchase,
									   @RequestParam("prodNo") int prodNo,
									   @RequestParam("quantity") int quantity,
									   @RequestParam("originalPurchaseQuantity") int originalPurchaseQuantity) throws Exception {
					
		purchaseService.updatePurchase(purchase);
		
		Product product = productService.getProduct(prodNo);
		product.setStock(product.getStock()-(quantity-originalPurchaseQuantity));
		productService.updateProduct(product);
		
		purchase = purchaseService.getPurchase(purchase.getTranNo());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("forward:/purchase/getPurchase.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("updateTranCode")
	public ModelAndView updatePurchase(@ModelAttribute("purchase")Purchase purchase,
									   @RequestParam("page") String currentPage) throws Exception {
		
		
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/listPurchase.do?&currentPage="+currentPage);
		return modelAndView;
	}
	
	@RequestMapping("listCart")
	public ModelAndView listCart(@ModelAttribute("search")Search search,
								 HttpSession session) throws Exception {
		
		int cartTranNo=1;
		
		if((purchaseService.checkCart(((User)session.getAttribute("user")).getUserId())) != null) {
			cartTranNo = purchaseService.checkCart(((User)session.getAttribute("user")).getUserId());
		}
		
		search.setCartTranNo(cartTranNo);
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(100);
		
		Map<String,Object> map = productService.getProductList(search);
		
	
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/purchase/listCart.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("addCart")
	public ModelAndView addCart(@RequestParam("prodNo") int prodNo,
								@RequestParam("quantity") int quantity,
								HttpSession session) throws Exception {
		int cartTranNo=0;
		
		if((purchaseService.checkCart(((User)session.getAttribute("user")).getUserId())) != null) {
			cartTranNo = purchaseService.checkCart(((User)session.getAttribute("user")).getUserId());
		}
		
		if (cartTranNo == 0) {
			Purchase purchase = new Purchase();
			
			purchase.setBuyer((User)session.getAttribute("user"));
			Product product = new Product();
			product.setProdNo(prodNo);
			purchase.setPurchaseProd(product);
			purchase.setTranCode("9");
			purchaseService.addPurchase(purchase);
			cartTranNo = purchaseService.checkCart(((User)session.getAttribute("user")).getUserId());
			
		}
		
			Map<String,Integer> map = new HashMap<String,Integer>();
			
			map.put("cartTranNo", cartTranNo);
			map.put("prodNo", prodNo);
			map.put("quantity", quantity);
			purchaseService.addCart(map);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/addCartResultView.jsp");
		return modelAndView;
	}
}
