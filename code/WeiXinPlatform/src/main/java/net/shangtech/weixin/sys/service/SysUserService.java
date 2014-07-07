package net.shangtech.weixin.sys.service;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.weixin.sys.dao.SysUserDao;
import net.shangtech.weixin.sys.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysUserService extends BaseService<SysUser> {
	@Autowired private SysUserDao dao;
	
	/**
	 * 根据微信openid查找用户
	 * @author songxh
	 * @createtime 2014-7-5下午09:28:14
	 * @param openid
	 * @return
	 */
	public SysUser findByOpenid(String openid){
		return dao.findUnique("where openid=?", openid);
	}
	
	public SysUser findByAppid(String appid){
		return dao.findUnique("where appid=?", appid);
	}
	
	/**
	 * 根据token查找用户
	 * @author songxh
	 * @createtime 2014-7-5下午09:29:00
	 * @param token
	 * @return
	 */
	public SysUser findByToken(String token){
		return dao.findUnique("where token=?", token);
	}
	
	public SysUser findByUsername(String username){
		return dao.findUnique("where username=?", username);
	}
	
	public void saveBasic(SysUser user){
		SysUser o = dao.find(user.getId());
		o.setAppid(user.getAppid());
		o.setAppkey(user.getAppkey());
		o.setSiteLogo(user.getSiteLogo());
		o.setSiteTel(user.getSiteTel());
		o.setWxName(user.getWxName());
		o.setWxNumber(user.getWxNumber());
		dao.update(o);
	}
	
	@Override
	protected BaseDao<SysUser> dao() {
		return dao;
	}

}
