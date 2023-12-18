package com.edu.springboot.member;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;
import com.edu.springboot.restboard.PointDTO;
import com.edu.springboot.restboard.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class PPPayController {

	@Autowired
	Imember2Service dao;
	
	@Autowired
	IBoardService daao;
	
	public Order11DTO order11Proc(Order11DTO order11dto, PointDTO pointDTO, HttpServletRequest req) {
		
		System.out.println("호날두");
		
		int resulto1 = 0, resPoint1 = 0, piresult = 0, setsold = 0, resultDelCart=0, resulto2=0;
    	
    	resulto1 = dao.insertOrder11(order11dto);
    	List<Order11DTO> opidx = dao.selectOrder11oidx(order11dto.getPidx().split(",")[0]);
    	String o2midx = opidx.get(0).getMidx();
    	String o2oidx = opidx.get(0).getOidx();
    	
    	for(int i=0; i< order11dto.getPidxList().size(); i++) {
    		dao.insertOrder12( o2oidx, order11dto.getPidxList().get(i), 
    				order11dto.getAidxList().get(i), order11dto.getPriceList().get(i), o2midx);
    		resulto2 ++;
    		daao.setsold(Integer.parseInt(order11dto.getPidxList().get(i)) );
    		setsold ++;
    		daao.delCart(Integer.parseInt(order11dto.getPidxList().get(i))); 
    		resultDelCart++;
    	}
    	resPoint1 = daao.minusPoint(Integer.parseInt(order11dto.getMinus_point()) ,Integer.parseInt(order11dto.getMidx()));
    	
    	pointDTO.setMidx(Integer.parseInt(order11dto.getMidx()) );
		pointDTO.setMinus_point(Integer.parseInt(order11dto.getMinus_point()));
		pointDTO.setOidx(daao.orderNum(Integer.parseInt(o2oidx)));
		pointDTO.setAdd_point(Integer.parseInt(order11dto.getAdd_point()));
		piresult = daao.pminsert(pointDTO);
		
		if(resulto1<=0 || resPoint1<=0 || piresult<=0 || 
				setsold<order11dto.getPidxList().size() || resultDelCart<order11dto.getPidxList().size()||
				resulto2 <order11dto.getPidxList().size()) {
			throw new RuntimeException("주문 처리 중 오류가 발생했습니다.");
		}
		
		return order11dto;
    	
			
	}
}
