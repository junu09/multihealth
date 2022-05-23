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
import com.health.dao.AnnounceDAO;
import com.health.dao.ReviewDAO;
import com.health.dto.AdminDTO;
import com.health.dto.AnnounceDTO;
import com.health.dto.ProductDTO;
import com.health.dto.ReviewDTO;

@Service("announceservice")
public class AnnounceServiceImpl implements AnnounceService {
	@Autowired
	@Qualifier("announcedao")
	AnnounceDAO adao;
	


	@Override
	public int execute(Model model, String pagenum, String contentnum) {
		BoardPager pagemaker = new BoardPager();

        int cpagenum = Integer.parseInt(pagenum);
        int ccontentnum = Integer.parseInt(contentnum);

        //dto 고쳐야함
        List<AnnounceDTO> testList = null;
       
        System.out.println("----execute------");
        System.out.println(ccontentnum);
        
        pagemaker.setTotalcount(adao.announcecount()); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
        System.out.println(pagemaker.getTotalcount());
        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
    	
        if(ccontentnum == 9){//선택 게시글 수
        	testList = adao.announcelist(pagemaker.getPagenum()*9,pagemaker.getContentnum());
        }else if(ccontentnum == 18){
        	testList = adao.announcelist(pagemaker.getPagenum()*18,pagemaker.getContentnum());
        }else if(ccontentnum ==27){ 
        	testList = adao.announcelist(pagemaker.getPagenum()*27,pagemaker.getContentnum());
        }
        
		model.addAttribute("announcelist",testList);
        model.addAttribute("page",pagemaker);
		return 0;
	}



	@Override
	public int detail(Model model, String anum) {
		int ianum = Integer.parseInt(anum);
		AnnounceDTO detail = adao.announcedetail(ianum);
		
		model.addAttribute("detail", detail);
		
		return 0;
	}



	@Override
	public int announceinsert(AnnounceDTO adto) {
		return adao.insertAnnounce(adto);
	}



	@Override
	public int announcedelete(String a_num) {
		int ianum = Integer.parseInt(a_num);
	
		return adao.announcedelete(ianum);
	}
	
	
	
}
