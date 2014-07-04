package net.shangtech.weixin.property.service;

import java.util.Date;
import java.util.List;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.weixin.property.dao.ProjectImageDao;
import net.shangtech.weixin.property.dao.ProjectTypeDao;
import net.shangtech.weixin.property.dao.SubProjectDao;
import net.shangtech.weixin.property.entity.ProjectImage;
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
	@Autowired private ProjectImageDao imageDao;
	
	public void saveProject(SubProject project, List<ProjectImage> imageList){
		if(project.getId() != null){
			SubProject o = dao.find(project.getId());
			o.setDescription(project.getDescription());
			if(project.getImage() != null)
				o.setImage(project.getImage());
			if(project.getImageDescription() != null)
				o.setImageDescription(project.getImageDescription());
			if(project.getImagePeripheral() != null)
				o.setImagePeripheral(project.getImagePeripheral());
			if(project.getImageTraffic() != null)
				o.setImageTraffic(project.getImageTraffic());
			o.setLatitude(project.getLatitude());
			o.setLongitude(project.getLongitude());
			o.setNameEn(project.getNameEn());
			o.setPeripheral(project.getPeripheral());
			o.setPriceAvg(project.getPriceAvg());
			o.setProjectName(project.getProjectName());
			o.setTraffic(project.getTraffic());
			dao.update(o);
		}else{
			project.setCreateTime(new Date());
			dao.insert(project);
		}
		for(ProjectImage image : imageList){
			image.setProjectId(project.getId());
			imageDao.insert(image);
		}
	}
	
	public void saveType(ProjectType type){
		if(type.getId() != null){
			ProjectType o = typeDao.find(type.getId());
			o.setName(type.getName());
			typeDao.update(o);
		}else{
			typeDao.insert(type);
		}
	}
	
	/**
	 * 查找账户的楼盘类别
	 * @author songxh
	 * @createtime 2014-7-2下午09:18:45
	 * @param sysUserId
	 * @return
	 */
	public List<ProjectType> findProjectTypesByUser(int sysUserId){
		return typeDao.find("where sysUserId=? order by sort", sysUserId);
	}
	
	public void deleteProjectType(int id){
		typeDao.delete(id);
	}
	
	public int countTypeByUser(Integer sysUserId){
		return typeDao.count("where sysUserId=?", sysUserId);
	}
	
	@Override
	protected BaseDao<SubProject> dao() {
		return dao;
	}

}
