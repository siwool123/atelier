package com.edu.springboot.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;
import com.edu.springboot.restboard.ProductDTO;


@Controller
public class adminPayCon {
	
	@Autowired
	IBoardService dao;
	
	@Autowired
	Imember2Service daao;

	@RequestMapping("/admin/adminPay")
	public String selectAdminPay( Model model) {
		
		List<AdminPayDTO> adpayList = new ArrayList<>();
		
		List<OrderDTO> olist11 = dao.olist11();
		for(int i=0; i<olist11.size(); i++) {
			
			AdminPayDTO adminPayDTO = new AdminPayDTO();
			///   주문번호
			adminPayDTO.setOidx(olist11.get(i).getOidx());
			/// 구분
			adminPayDTO.setAuction(Integer.toString(olist11.get(i).getAuction()));
			List<Order2DTO> o2list = dao.o2list((olist11.get(i).getOidx()));
			/// pidx, sfile, a_name, title, price
			List<ProductDTO> product = new ArrayList<>();
			for(int j=0; j<o2list.size(); j++ ) {
				ProductDTO pList = dao.pview(o2list.get(j).getPidx());
				product.add(pList);
			}
//			List<String> pidx = new ArrayList<>();
//			List<String> sfile = new ArrayList<>();
//			List<String> title = new ArrayList<>();
//			List<String> a_name = new ArrayList<>();
//			List<String> price = new ArrayList<>();
			
//			adminPayDTO.setPidx(pidx);
//			adminPayDTO.setSfile(sfile);
//			adminPayDTO.setTitle(title);
//			adminPayDTO.setA_name(a_name);
//			adminPayDTO.setPrice(price);
			
			//// 구매자명
			Member2DTO  member2dto = daao.seletMember("midx",  Integer.toString(olist11.get(i).getMidx())).get(0);
			String m_name = member2dto.getM_name();
			adminPayDTO.setM_name(m_name);
			
			// 결제 완료일
			if(olist11.get(i).getPaydate() != null) {
				
				adminPayDTO.setPaydate(olist11.get(i).getPaydate().toString());
			}
			if(olist11.get(i).getShipdate() != null) {
				adminPayDTO.setState(olist11.get(i).getShipdate().toString());				
			}
			if(olist11.get(i).getT_num() != null) {
				
			adminPayDTO.setT_num(olist11.get(i).getApinum());    
			}
			
			adminPayDTO.setState(Integer.toString(olist11.get(i).getCancel()));
			
			
			for(ProductDTO pd : product) {
				AdminPayDTO newAdminPayDTO = new AdminPayDTO();
			
				newAdminPayDTO.setOidx(adminPayDTO.getOidx());
				newAdminPayDTO.setAuction(adminPayDTO.getAuction());
				newAdminPayDTO.setM_name(adminPayDTO.getM_name());
				newAdminPayDTO.setPaydate(adminPayDTO.getPaydate());
				newAdminPayDTO.setState(adminPayDTO.getState());
				newAdminPayDTO.setT_num(adminPayDTO.getT_num());

				// Product 정보 추가
				newAdminPayDTO.setPidx(Integer.toString(pd.getPidx()));
				
				newAdminPayDTO.setSfile(pd.getSfile());
				newAdminPayDTO.setTitle(pd.getTitle());
				newAdminPayDTO.setA_name(pd.getM_name());
				newAdminPayDTO.setPrice(Integer.toString(pd.getPrice()));

				adpayList.add(newAdminPayDTO);
//				pidx.add(Integer.toString(pd.getMidx()) );
//				sfile.add(pd.getSfile());
//				title.add(pd.getTitle());
//				a_name.add(pd.getM_name());
//				price.add(Integer.toString(pd.getPrice()));
//				adpayList.add(adminPayDTO);
			}
		}
		
		model.addAttribute("adpayList", adpayList) ;
		return "admin/adminPay";
//		adminPayDTO.setOidx(olist11.);
	}
	
	@RequestMapping("/admin/proupdate")
	public void proupdate(String pidx) {
		daao.updatePro(pidx);
	}
}
