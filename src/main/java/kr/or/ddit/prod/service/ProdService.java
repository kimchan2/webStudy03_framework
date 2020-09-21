package kr.or.ddit.prod.service;

import kr.or.ddit.prod.dao.IProdDAO;
import kr.or.ddit.prod.dao.ProdDAOImpl;
import kr.or.ddit.vo.ProdVO;

public class ProdService implements IProdService{
	IProdDAO prodDAO = new ProdDAOImpl();
	
	@Override
	public ProdVO retrieveProd(String prod_id) {
		return prodDAO.selectProd(prod_id);
	}

}
