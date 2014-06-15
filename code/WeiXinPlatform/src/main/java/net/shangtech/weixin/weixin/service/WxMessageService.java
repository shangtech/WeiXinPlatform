package net.shangtech.weixin.weixin.service;

import java.util.List;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.ssh.core.base.Page;
import net.shangtech.weixin.weixin.dao.WxMessageDao;
import net.shangtech.weixin.weixin.entity.WxMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WxMessageService extends BaseService<WxMessage> {
	
	@Autowired private WxMessageDao dao;
	
	public Page<WxMessage> findMessageByPage(int pageNo, int pageSize, int sysUserId){
		Page<WxMessage> page = new Page<WxMessage>(pageSize);
		page.setPageNo(pageNo);
		page.setQuery("where sysUserId=? order by id desc", sysUserId);
		page = super.find(page);
		return page;
	}
	
	public void saveMessages(List<WxMessage> list){
		
	}

	@Override
	protected BaseDao<WxMessage> dao() {
		return dao;
	}
}
