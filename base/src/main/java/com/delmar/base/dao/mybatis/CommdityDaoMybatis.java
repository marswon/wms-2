/******************************************************************************
 * 德玛国际物流有限公司  2013-07-01												  *
 *	作者：刘大磊								                                              *
 * 电话：0532-66701118                                                                * 
 * email:liua@delmarchina.com						                               *
 *****************************************************************************/

package com.delmar.base.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.delmar.base.dao.CommdityDao;
import com.delmar.base.model.Commdity;
import com.delmar.core.dao.mybatis.CoreDaoMyBatis;

/**
 * @author 刘大磊 2014-12-22 13:26:54
 */
@Repository("commdityDao") 
public class CommdityDaoMybatis extends CoreDaoMyBatis<Commdity> implements CommdityDao {

	/* (non-Javadoc)
	 * @see com.delmar.core.dao.mybatis.CoreDaoMyBatis#getSqlName()
	 */
	@Override
	protected String getSqlName() {
		
		return "com.delmar.base.mybatis.sql.CommdityMapper";
	}



}
