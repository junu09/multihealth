package com.health.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.health.dto.CartDTO;
import com.health.dto.ExercisetypeDTO;
import com.health.dto.MemberDTO;
import com.health.dto.ProductDTO;
import com.health.service.CartService;
import com.health.service.ExercisetypeService;
import com.health.service.MemberService;
import com.health.service.ProductService;
		
@Controller	
@RequestMapping(value = "/cart")
public class CartController {

	@Autowired
	HttpSession session;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
		
	@GetMapping("/payment")    // 유저 정보 가져오기
	public String pay(Model model) {
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		try {
			List<CartDTO> cartList = cartService.cartQueryById(m_num);
			model.addAttribute("cartList", cartList);

			List<ProductDTO> prodList = new ArrayList<ProductDTO>();
			int totalPrice = 0; 
			
			for (int i = 0; i < cartList.size(); i++) {
				int prod_num = cartList.get(i).getProd_num();
				ProductDTO prod= cartService.prodQueryByProdNum(prod_num);
				prodList.add(i, prod);
				totalPrice += cartList.get(i).getProduct_count() * prod.getProd_price();
			}
			model.addAttribute("prodList", prodList);
			
			MemberDTO user = memberService.queryUser(m_num);
			model.addAttribute("user", user);
			model.addAttribute("totalPrice", totalPrice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "payment";
	}
	
	
	
	@GetMapping("")
	public String cartMain(Model model) {
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		System.out.println(m_num);
		try {
			List<CartDTO> cartList = cartService.cartQueryById(m_num);
			model.addAttribute("cartList", cartList);
			
			
			List<ProductDTO> prodList = new ArrayList<ProductDTO>();
			for (int i = 0; i < cartList.size(); i++) {
				int prod_num = cartList.get(i).getProd_num();
				ProductDTO prod= cartService.prodQueryByProdNum(prod_num);
				prodList.add(i, prod);
			}
			model.addAttribute("prodList", prodList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return "cart";
	}
	
	// 수량에 따른 총 금액 계산
		@ResponseBody
		@PostMapping("/gettotal")
		public int GetTotal(@RequestParam("objParams") String objParams,Model model) {
			MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int m_num = principal.getM_num();
			System.out.println(objParams);
			System.out.println("진입");
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObj = jsonParser.parse(objParams).getAsJsonObject();
			JsonArray jsonNumArr = jsonObj.getAsJsonArray("numList");
			JsonArray jsonQuanArr = jsonObj.getAsJsonArray("quanList");
			
			Gson gson = new Gson();
			ArrayList numList= gson.fromJson(jsonNumArr, ArrayList.class);	
			ArrayList quanList= gson.fromJson(jsonQuanArr, ArrayList.class);
			int total = 0;
			ArrayList priceList= new ArrayList();
			
			try {
				// 상품 번호를 통해 가격을 조회
				for(int i=0;numList.size()>i;i++) {
					int prod_num = (int) Integer.parseInt((String) numList.get(i));
					int price = productService.selectPrice(prod_num);
					priceList.add(price);
					
					int quantity = (int) Integer.parseInt((String) quanList.get(i));
					System.out.println(quantity);
				}
				for(int j=0;priceList.size()>j;j++) {
					int a=  (int) priceList.get(j);
					int b =(int) Integer.parseInt((String) quanList.get(j));
					total += a * b;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 상품 수량을 조회
			return total; 
		}
		
		@ResponseBody    // 목록에서 상품 삭제
		@PostMapping("/deletecart")
		public String DeleteCart(@RequestParam("prod_id") String prod_id) {
			int prod_num = (int) Integer.parseInt(prod_id);
			MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int m_num = principal.getM_num();
			try {
				cartService.deleteCart(prod_num, m_num);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "선택하신 제품이 삭제되었습니다.";
			
		}
	
	@ResponseBody
	@PostMapping("/insertcart")  //스토어에서 장바구니로 상품 담기
	public String InsertCart
	(@RequestParam("prod_num") int prod_num, @RequestParam(value="product_count") int product_count) { // , @RequestParam("product_count") int product_count
		// prod_num : 장바구니에 담을 제품 번호
		// cart_num : 장바구니에 담을 제품 수량
		System.out.println(prod_num);
		System.out.println(product_count);
		
		
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		System.out.println(m_num);
		// m_num : 로그인된 유저 번호 
		try {
			List<CartDTO> cartList=cartService.cartQueryById(m_num); //list 안담기는걸 수정 하고  
			for(CartDTO cart:cartList) {
				// 내가 장바구니에 담아 놓은 상품 정보들
				if (cart.getProd_num() == prod_num) {
					System.out.println("장바구니에 담을 제품  :" + product_count);
					System.out.println("지금 장바구니에 있는 제품 :" + cart.getProduct_count());
					product_count += cart.getProduct_count();
					System.out.println("이 제품 수량으로 업데이트 됩니다 :" + product_count);
					cartService.updateCart(prod_num, product_count, m_num);
					return "이미 장바구니 담겨 있는 상품입니다. 장바구니에 선택하신 수량이 더해집니다";
				}
			}
			cartService.insertCart(prod_num, product_count, m_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "장바구니에 담겼습니다.";
		
	}
	
	
}