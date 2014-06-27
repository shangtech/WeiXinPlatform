package net.shangtech.weixin.property.dao;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.weixin.property.entity.ProjectType;
import net.shangtech.weixin.property.entity.SubProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProjectService extends BaseService<SubProject> {
	
	@Autowired private SubProjectDao dao;
	@Autowired private ProjectTypeDao typeDao;
	
	public void saveType(ProjectType type){
		if(type.getId() != null){
			ProjectType o = typeDao.find(type.getId());
			o.setName(type.getName());
			typeDao.update(type);
		}else{
			typeDao.insert(type);
		}
	}
	
	public int countTypeByUser(Integer sysUserId){
		return typeDao.count("where sysUserId=?", sysUserId);
	}
	
	@Override
	protected BaseDao<SubProject> dao() {
		return dao;
	}

}
