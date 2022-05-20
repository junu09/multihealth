package com.health.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.health.dao.ProductDAO;
import com.health.BoardPager;
import com.health.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO dao;
	
	// 페이지 처리 , 상품 리스트 출력
	
	@Override
	public int execute(Model model,String pagenum, String contentnum, String categorynum) throws Exception {
		
		if(categorynum.equals("0"))
        	categorynum = "category_num";

		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);
        
        List<ProductDTO> testList = null;

        if(categorynum.equals("category_num")) {
        	categorynum="0";
        pagemaker.setTotalcount(dao.testcount()); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        
        if(ccontentnum == 9){//선택 게시글 수
        	testList = dao.testlist(pagemaker.getPagenum()*9,pagemaker.getContentnum());
        }else if(ccontentnum == 18){
        	testList = dao.testlist(pagemaker.getPagenum()*18,pagemaker.getContentnum());
        }else if(ccontentnum == 27){
        	testList = dao.testlist(pagemaker.getPagenum()*27,pagemaker.getContentnum());
        }
        }
        else {
        	int ccategorynum = Integer.parseInt(categorynum);
        	pagemaker.setTotalcount(dao.testcount2(ccategorynum)); // mapper 전체 게시글 개수를 지정한다
            pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
            pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
            pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
            System.out.println(dao.testcount2(ccategorynum));
            pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

            pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
            pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
            pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        	
        	
            if(ccontentnum == 9){//선택 게시글 수
            	testList = dao.testlist2(pagemaker.getPagenum()*9,pagemaker.getContentnum(), ccategorynum);
            }else if(ccontentnum == 18){
            	testList = dao.testlist2(pagemaker.getPagenum()*18,pagemaker.getContentnum(), ccategorynum);
            }else if(ccontentnum ==27){ 
            	testList = dao.testlist2(pagemaker.getPagenum()*27,pagemaker.getContentnum(), ccategorynum);
            }
        }
        
		
		model.addAttribute("productlist",testList);
		model.addAttribute("category", categorynum);
        model.addAttribute("page",pagemaker);
		return 0;
	}
	
	// 상품 상세정보 조회 

	@Override
	public ProductDTO getproduct(int prod_num) throws Exception {
		ProductDTO prod = dao.product(prod_num);
		return prod;
	}
     
	// 상품 카테고리별로 조회 
	
	@Override
	public int search(Model model, String pagenum, String contentnum, String categorynum, String search)
			throws Exception {
		System.out.println("service impl : search : " + search);
		if(categorynum.equals("0"))
        	categorynum = "category_num";

		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);
        
        List<ProductDTO> testList = null;

        if(categorynum.equals("category_num"))
        	categorynum="0";
        
        int ccategorynum = Integer.parseInt(categorynum);
        
        pagemaker.setTotalcount(dao.testcount3(search)); // 검색된 아이템 개수 
        System.out.println("getTotalcount " + pagemaker.getTotalcount());
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        
        if(ccontentnum == 9){//선택 게시글 수
        	testList = dao.searchlist(pagemaker.getPagenum()*9,pagemaker.getContentnum(), ccategorynum, search);
        }else if(ccontentnum == 18){
        	testList = dao.searchlist(pagemaker.getPagenum()*9,pagemaker.getContentnum(), ccategorynum, search);
        }else if(ccontentnum == 27){
        	testList = dao.searchlist(pagemaker.getPagenum()*9,pagemaker.getContentnum(), ccategorynum, search);
        }
  
		
		model.addAttribute("productlist",testList);
		model.addAttribute("category", categorynum);
        model.addAttribute("page",pagemaker);
		return 0;
	}

	@Override
	public int execute(Model model, String pagenum, String contentnum) throws Exception {
		return 0;
	}

	@Override
	public List<ProductDTO> selectList(String search_text) throws Exception {
		return null;
	}

	@Override
	public int selectPrice(int prod_num) throws Exception {
		return dao.selectPrice(prod_num);
	}


}
