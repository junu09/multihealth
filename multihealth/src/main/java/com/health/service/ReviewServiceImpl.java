package com.health.service;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import org.bouncycastle.crypto.io.MacOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.health.BoardPager;
import com.health.dao.AdminDAO;
import com.health.dao.ReviewDAO;
import com.health.dto.AdminDTO;
import com.health.dto.AnnounceDTO;
import com.health.dto.OrderDTO;
import com.health.dto.ProductDTO;
import com.health.dto.ReviewDTO;

@Service("reviewservice")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	@Qualifier("reviewdao")
	ReviewDAO rdao;
	
	int oldgetpage = 0;
	int cnt = 0;
	@Override
	public List<ReviewDTO> reviewlist() {
		return rdao.reviewlist();
	}

	
	@Override
	public int execute(Model model,String pagenum, String contentnum, String categorynum) {
		
		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);

        //dto 고쳐야함
        List<ReviewDTO> testList = null;
       
        List<ProductDTO> prodList = new ArrayList<ProductDTO>();
        
        System.out.println(categorynum);
        if(categorynum.equals("0"))
        	categorynum = "category_num";
        
        if(categorynum.equals("category_num")) {
        	categorynum = "0";
            pagemaker.setTotalcount(rdao.testcount()); // mapper 전체 게시글 개수를 지정한다
            pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
            pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
            pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
            pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
            System.out.println(pagemaker.getTotalcount());
            pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
            pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
            pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        	
            if(ccontentnum == 9){//선택 게시글 수
            	//testList = adao.testlist(pagemaker.getPagenum()*9,pagemaker.getContentnum());
            	testList = rdao.reviewlist();

            	for(int i = 0; i < testList.size(); i++) {
            		prodList.add(new ProductDTO(rdao.product(Integer.parseInt(testList.get(i).getProd_num()))));
            	}
            }else if(ccontentnum == 18){
            	//testList = rdao.testlist(pagemaker.getPagenum()*18,pagemaker.getContentnum());
            }else if(ccontentnum ==27){ 
            	//testList = rdao.testlist(pagemaker.getPagenum()*27,pagemaker.getContentnum());
            }
        }
        else {
        	int ccategorynum = Integer.parseInt(categorynum);
        	
            pagemaker.setTotalcount(rdao.testcount2(ccategorynum)); // mapper 전체 게시글 개수를 지정한다
            pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
            pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
            pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
            pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

            pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
            pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
            pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        	
        	
            if(ccontentnum == 9){//선택 게시글 수
            	//testList = rdao.testlist2(pagemaker.getPagenum()*9,pagemaker.getContentnum(), ccategorynum);
            }else if(ccontentnum == 18){
            	//testList = rdao.testlist2(pagemaker.getPagenum()*18,pagemaker.getContentnum(), ccategorynum);
            }else if(ccontentnum ==27){ 
            	//testList = rdao.testlist2(pagemaker.getPagenum()*27,pagemaker.getContentnum(), ccategorynum);
            }
        }
        
//		model.addAttribute("test",testList);
//        model.addAttribute("page",pagemaker);
		
		model.addAttribute("reviewlist",testList);
		model.addAttribute("prodlist",prodList);
		model.addAttribute("category", categorynum);
        model.addAttribute("page",pagemaker);
		return 0;
	}


	@Override
	public int ablereviewlist(Model model, String pagenum, String contentnum, int m_num) {
		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);
        
        //dto 고쳐야함
        List<OrderDTO> ableReviewList = null;
        List<ReviewDTO> reviewList = null;
        List<ProductDTO> productlist = new ArrayList<ProductDTO>();
        
        
        
        List<OrderDTO> ableAllList = null;
        ableAllList = rdao.ablealllist(m_num);
        
        reviewList = rdao.reviewlist2(m_num);
        int count = rdao.ablereviewcount(m_num) - reviewList.size();

        pagemaker.setTotalcount(count); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
    	
       
        System.out.println("cnt-----"+cnt);
        System.out.println("old------"+oldgetpage);
        System.out.println(pagemaker.getPagenum());
        if(ccontentnum == 9){//선택 게시글 수
        	if(oldgetpage >= pagemaker.getPagenum()) {
        		cnt = 0;
        		ableReviewList = rdao.ablereviewlist(pagemaker.getPagenum()*9, pagemaker.getContentnum(), m_num);
        		oldgetpage = pagemaker.getPagenum();
        		
        	}
        	else {
        		ableReviewList = rdao.ablereviewlist(pagemaker.getPagenum()*9 + cnt, pagemaker.getContentnum(), m_num);
        		cnt = 0;
        		oldgetpage = pagemaker.getPagenum();
        	}
        	int rcount = ableReviewList.size();
        	
        	 if(reviewList.size() != 0) {
             	for(int i = 0; i < reviewList.size(); i++) {
             		for(int j = 0; j < ableReviewList.size(); j++) {
             			if(Integer.parseInt(reviewList.get(i).getProd_num())== ableReviewList.get(j).getProd_num() ) {
             				ableReviewList.remove(j);
             				ableReviewList.add(ableAllList.get(rcount++));
             				cnt++;
             			}
             		}
             	}
             }
        	for(int i = 0; i < ableReviewList.size(); i++) {
        		productlist.add(new ProductDTO(rdao.product(ableReviewList.get(i).getProd_num())));
        	}
        }else if(ccontentnum == 18){
        	ableReviewList = rdao.ablereviewlist(pagemaker.getPagenum()*18, pagemaker.getContentnum(), m_num);
        }else if(ccontentnum ==27){ 
        	ableReviewList = rdao.ablereviewlist(pagemaker.getPagenum()*27, pagemaker.getContentnum(), m_num);
        }
        model.addAttribute("m_num", ableAllList.get(0).getM_num());
        model.addAttribute("ablereviewlist", ableReviewList);
		model.addAttribute("productlist", productlist);
        model.addAttribute("page",pagemaker);
		return 0;
	}


	@Override
	public int insertreviewform(Model model, String prod_num, int m_num) {
		ProductDTO product = rdao.product(Integer.parseInt(prod_num));
		
		model.addAttribute("m_num", m_num);
		model.addAttribute("product",product);
		return 0;
	}


	@Override
	public int insertreview(ReviewDTO rdto) {
		return rdao.insertreview(rdto);
	}


	@Override
	public int ablereviewmod(Model model, String pagenum, String contentnum, int m_num) {
		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);
        
        //dto 고쳐야함
        List<ReviewDTO> reviewList = null;
        List<ProductDTO> productlist = new ArrayList<ProductDTO>();
        

        pagemaker.setTotalcount(rdao.ablereviewcount(m_num)); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
    	
       
        if(ccontentnum == 9){//선택 게시글 수
        	reviewList = rdao.ablereviewmod(pagemaker.getPagenum()*9, pagemaker.getContentnum(), m_num);
        }else if(ccontentnum == 18){
        	reviewList = rdao.ablereviewmod(pagemaker.getPagenum()*18, pagemaker.getContentnum(), m_num);
        }else if(ccontentnum ==27){ 
        	reviewList = rdao.ablereviewmod(pagemaker.getPagenum()*27, pagemaker.getContentnum(), m_num);
        }
        
        model.addAttribute("ablereviewmod", reviewList);
		model.addAttribute("prodlist", productlist);
        model.addAttribute("page",pagemaker);
		return 0;
	}


	@Override
	public int ablereviewdel(Model model, String pagenum, String contentnum, int m_num) {
		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);
        
        //dto 고쳐야함
        List<ReviewDTO> reviewList = null;
        List<ProductDTO> productlist = new ArrayList<ProductDTO>();
        

        pagemaker.setTotalcount(rdao.ablereviewcount(m_num)); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
    	
       
        if(ccontentnum == 9){//선택 게시글 수
        	reviewList = rdao.ablereviewdel(pagemaker.getPagenum()*9, pagemaker.getContentnum(), m_num);
        }else if(ccontentnum == 18){
        	reviewList = rdao.ablereviewdel(pagemaker.getPagenum()*18, pagemaker.getContentnum(), m_num);
        }else if(ccontentnum ==27){ 
        	reviewList = rdao.ablereviewdel(pagemaker.getPagenum()*27, pagemaker.getContentnum(), m_num);
        }
        
        model.addAttribute("ablereviewdel", reviewList);
		model.addAttribute("prodlist", productlist);
        model.addAttribute("page",pagemaker);
		return 0;
	}


	@Override
	public int deletereview(ReviewDTO rdto) {
		return rdao.deletereview(rdto);
	}
	
	
}
