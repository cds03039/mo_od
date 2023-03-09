package kr.co.mood.cate.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

@Service
public class CateServiceImpl implements CateService{

	@Autowired CateDAO catedao;
	
	public List<CateVO> selectCateList(int user_no) {
		return catedao.cateselect(user_no);
	}

	public CateVO check(CateVO vo) {
		return null;
	}

	public void addcate(CateVO cvo, UserVO uvo, ProVO pvo) {
		catedao.addcate(cvo, uvo, pvo);
	}
	
	public int modifyflashamount(CateVO cvo) {
		
		return catedao.modifyflashamount(cvo);
	}
	
	public int modifyminusamount(CateVO cvo) {
		
		return catedao.modifyminusamount(cvo);
	}

	public int dupcate(int pro_number, int user_no) {
		return catedao.dupcate(pro_number, user_no);
	}



}
