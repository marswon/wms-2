/******************************************************************************
 * 德玛国际物流有限公司  2013-07-01												  *
 *	作者：刘大磊								                                              *
 * 电话：0532-66701118                                                                * 
 * email:liua@delmarchina.com						                               *
 *****************************************************************************/

package com.delmar.sys.dao.mybatis;

import org.springframework.stereotype.Repository;

import com.delmar.sys.dao.ScheduledLogDao;
import com.delmar.sys.model.ScheduledLog;
import com.delmar.core.dao.mybatis.CoreDaoMyBatis;

/**
 * @author 刘大磊 2015-08-24 16:48:41
 */
@Repository("scheduledLogDao") 
public class ScheduledLogDaoMybatis extends CoreDaoMyBatis<ScheduledLog> implements ScheduledLogDao {

	/* (non-Javadoc)
	 * @see com.delmar.core.dao.mybatis.CoreDaoMyBatis#getSqlName()
	 */
	@Override
	protected String getSqlName() {
		
		return "com.delmar.sys.mybatis.sql.ScheduledLogMapper";
	}



}
