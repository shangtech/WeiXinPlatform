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
	
	@Transactional(readOnly = true)
	public Page<WxMessage> findMessageByPage(int pageNo, int pageSize, int sysUserId){
		Page<WxMessage> page = new Page<WxMessage>(pageSize);
		page.setPageNo(pageNo);
		page.setQuery("where sysUserId=? order by id desc", sysUserId);
		page = super.find(page);
		return page;
	}
	
	public void saveMessages(List<WxMessage> list){
		for(WxMessage message : list){
			if(message.getId() == null){
				dao.insert(message);
				continue;
			}
			WxMessage old = dao.find(message.getId());
			if(old == null){
				dao.insert(message);
				continue;
			}
			old.setTitle(message.getTitle());
			old.setContent(message.getContent());
			old.setImage(message.getImage());
			old.setSummary(message.getSummary());
			old.setUrl(message.getUrl());
			dao.update(old);
		}
	}

	@Override
	protected BaseDao<WxMessage> dao() {
		return dao;
	}
}
