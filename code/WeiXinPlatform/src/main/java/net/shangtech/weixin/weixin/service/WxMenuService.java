package net.shangtech.weixin.weixin.service;

import java.util.List;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.weixin.weixin.dao.WxMenuDao;
import net.shangtech.weixin.weixin.entity.WxMenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WxMenuService extends BaseService<WxMenu> {
	
	@Autowired private WxMenuDao dao;
	
	/**
	 * 查找用户账户的菜单
	 * @param sysUserId
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<WxMenu> findBySysUser(int sysUserId){
		List<WxMenu> list = dao.find("where sysUserId=? and parentId=0 order by sort", sysUserId);
		for(WxMenu menu : list){
			List<WxMenu> children = dao.find("where parentId=? order by sort", menu.getId());
			menu.setChildren(children);
			if(children != null && !children.isEmpty())
				menu.setHasChildren(true);
		}
		return list;
	}
	
	/**
	 * 计算某个用户某一级菜单有几个了，主要是排序用的，新添加的时候排序值默认加一就好了
	 * @param sysUserId
	 * @param parentId
	 * @return
	 */
	@Transactional(readOnly = true)
	public int countByUserAndParent(int sysUserId, int parentId){
		return dao.count("where sysUserId=? and parentId=?", sysUserId, parentId);
	}
	
	/**
	 * 批量更新
	 * @param list
	 */
	public void update(List<WxMenu> list){
		for(WxMenu menu : list){
			dao.update(menu);
		}
	}

	@Override
	protected BaseDao<WxMenu> dao() {
		return dao;
	}
	
	
}
