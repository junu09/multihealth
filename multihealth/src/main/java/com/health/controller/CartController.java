package com.health.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.health.dto.CartDTO;
import com.health.dto.MemberDTO;
import com.health.dto.OrderDTO;
import com.health.dto.ProductDTO;
import com.health.service.CartService;
import com.health.service.MemberService;
import com.health.service.OrderService;
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
	
	@Autowired
	OrderService orderService;
	
	
	@GetMapping("/")
	public String orderComplete(Model model) {
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		try {
			List<OrderDTO> orderList = orderService.orderDetail(m_num);
			model.addAttribute("orderList", orderList);
			
			List<CartDTO> cartList = cartService.cartQueryById(m_num);
			MemberDTO user = memberService.queryUser(m_num);
			for (int i = 0; i < cartList.size(); i++) {
				int prod_num = cartList.get(i).getProd_num();
				ProductDTO prod= cartService.prodQueryByProdNum(prod_num);
				OrderDTO order = new OrderDTO(prod.getProd_num(),m_num, cartList.get(i).getProduct_count());
				orderService.insertCartList(order);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/";
	}
	
		
	@GetMapping("/payment")    // ?????? ?????? ????????????
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
	
	// ????????? ?????? ??? ?????? ??????
		@ResponseBody
		@PostMapping("/gettotal")
		public int GetTotal(@RequestParam("objParams") String objParams,Model model) {
			MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int m_num = principal.getM_num();
			System.out.println(objParams);
			System.out.println("??????");
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
				// ?????? ????????? ?????? ????????? ??????
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
			
			// ?????? ????????? ??????
			return total; 
		}
		
		@ResponseBody    // ???????????? ?????? ??????
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
			return "???????????? ????????? ?????????????????????.";
			
		}
	
	@ResponseBody
	@PostMapping("/insertcart")  //??????????????? ??????????????? ?????? ??????
	public String InsertCart
	(@RequestParam("prod_num") int prod_num, @RequestParam(value="product_count") int product_count) {
		// prod_num : ??????????????? ?????? ?????? ??????
		// cart_num : ??????????????? ?????? ?????? ??????
		System.out.println(prod_num);
		System.out.println(product_count);
		
		
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		System.out.println(m_num);
		// m_num : ???????????? ?????? ?????? 
		try {
			List<CartDTO> cartList=cartService.cartQueryById(m_num); 
			for(CartDTO cart:cartList) {
				// ?????? ??????????????? ?????? ?????? ?????? ?????????
				if (cart.getProd_num() == prod_num) {
					System.out.println("??????????????? ?????? ??????  :" + product_count);
					System.out.println("?????? ??????????????? ?????? ?????? :" + cart.getProduct_count());
					product_count += cart.getProduct_count();
					System.out.println("??? ?????? ???????????? ???????????? ????????? :" + product_count);
					cartService.updateCart(prod_num, product_count, m_num);
					return "?????? ???????????? ?????? ?????? ???????????????. ??????????????? ???????????? ????????? ???????????????";
				}
			}
			cartService.insertCart(prod_num, product_count, m_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "??????????????? ???????????????.";
		
	}
	
	@PostMapping("") //?????? ??? ???????????? ?????? ?????????
	public ModelAndView cartPayment() {
		
	
		ModelAndView mv = new ModelAndView("redirect/user/info");
		MemberDTO principal = (MemberDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int m_num = principal.getM_num();
		try {
			List<CartDTO> cartList = cartService.cartQueryById(m_num);
			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
			for(CartDTO cart:cartList) {
				OrderDTO order = new OrderDTO();
				order.setProd_num(cart.getProd_num());
				order.setO_num(cart.getCart_num());
				order.setM_num(m_num);
				orderList.add(order);
			}
			for(OrderDTO order: orderList) {
				orderService.insertCartList(order);
			}
			cartService.deleteCartAll(m_num);
		}
			catch (Exception e) {
				e.printStackTrace();
			}
		return mv; 
		}
	}


		
	
