/******************************************************************************
 * 德玛国际物流有限公司  2013-07-01												  *
 *	作者：刘大磊								                                              *
 * 电话：0532-66701118                                                                * 
 * email:liua@delmarchina.com						                              *
 *****************************************************************************/
package com.delmar.core.web.action;

import java.util.Date;
import java.util.List;

import com.delmar.core.web.util.FacesUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.delmar.core.web.action.CoreEditPrivAction;

import com.delmar.core.model.Window;

import com.delmar.core.service.WindowService;


/**
 * @author 刘大磊 2016-08-25 11:11:32
 */
public class WindowAction extends CoreEditPrivAction {
	private Window  window;
	
	@Autowired
	private WindowService windowService;
	
	private void init()
	{

	}
	
	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#getModuleName()
	 */
	@Override
	public String getModuleName() {
		return "window";
	}

	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#delete()
	 */
	@Override
	public String delete() {
		windowService.deleteByPrimaryKey(window.getId());
		return list();
	}

	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#deleteList(java.lang.Integer[])
	 */
	@Override
	public void deleteList(Integer[] ids) {
		
		windowService.deleteWindowList(ids);

	}

	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#getModelId()
	 */
	@Override
	public Integer getModelId() {

		return window.getId();
	}

	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#editForm()
	 */
	@Override
	public void editForm() {
		 window= windowService.selectByPrimaryKey(id);

	}

	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#search()
	 */
	@Override
	public List search() {
		return windowService.selectByExample(null);
	}

	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#createForm()
	 */
	@Override
	public void createForm() {
		window=new Window();
	}
	
	/* (non-Javadoc)
	 * @see com.delmar.core.web.action.CoreEditPrivAction#saveForm()
	 */
	@Override
	public String saveForm() {
		Integer userId=getCurrentUser();
		Date now=new Date();
		if(window.isnew())
		{
			window.setCreatedby(userId);
			window.setCreated(now);
		}

		window.setUpdated(now);
		window.setUpdatedby(userId);
		windowService.save(window);
		return "edit";
	}
	/**
	 * @return the usergroup
	 */
	public Window getWindow() {
		return window;
	}

	/**
	 * @param window the usergroup to set
	 */
	public void setWindow(Window window) {
		this.window = window;
	}

}