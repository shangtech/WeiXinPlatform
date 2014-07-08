package net.shangtech.weixin.property.service;

import java.util.Date;
import java.util.List;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.weixin.property.dao.HouseInfoDao;
import net.shangtech.weixin.property.dao.HousePanoramaDao;
import net.shangtech.weixin.property.dao.PanoramaDao;
import net.shangtech.weixin.property.dao.ProjectImageDao;
import net.shangtech.weixin.property.dao.ProjectTypeDao;
import net.shangtech.weixin.property.dao.SubProjectDao;
import net.shangtech.weixin.property.entity.HouseInfo;
import net.shangtech.weixin.property.entity.HousePanorama;
import net.shangtech.weixin.property.entity.Panorama;
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
	@Autowired private HouseInfoDao houseDao;
	@Autowired private PanoramaDao panoramaDao;
	@Autowired private HousePanoramaDao housePanoramaDao;
	
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
			o.setCustom1(project.getCustom1());
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
			o.setNameEn(type.getNameEn());
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
	
	/**
	 * 保存楼盘户型
	 * @author songxh
	 * @createtime 2014-7-5下午01:18:29
	 * @param house
	 */
	public void saveHouse(HouseInfo house){
		if(house.getId() != null){
			HouseInfo o = houseDao.find(house.getId());
			o.setDescription(house.getDescription());
			o.setFloorNum(house.getFloorNum());
			o.setHallNum(house.getHallNum());
			o.setHouseArea(house.getHouseArea());
			o.setHouseName(house.getHouseName());
			if(house.getImage() != null)
				o.setImage(house.getImage());
			o.setRoomNum(house.getRoomNum());
			o.setSort(house.getSort());
			houseDao.update(o);
		}else{
			house.setCreateTime(new Date());
			houseDao.insert(house);
		}
	}
	
	/**
	 * 根据楼盘ID获取户型列表
	 * @author songxh
	 * @createtime 2014-7-5下午01:19:43
	 * @param projectId
	 * @return
	 */
	public List<HouseInfo> findHousesByProject(int projectId){
		return houseDao.find("where projectId=? order by sort", projectId);
	}
	
	/**
	 * 根据楼盘分类查询楼盘列表
	 * @author songxh
	 * @createtime 2014-7-5上午12:05:30
	 * @param type
	 * @return
	 */
	public List<SubProject> findByProjectType(int type){
		return dao.find("where type=?", type);
	}
	
	/**
	 * 保存户型3D全景图
	 * @author songxh
	 * @createtime 2014-7-5下午04:03:23
	 * @param panorama
	 * @param houseParonama
	 */
	public void savePanorama(Panorama panorama, HousePanorama housePanorama){
		panoramaDao.insert(panorama);
		housePanorama.setPanoramaId(panorama.getId());
		housePanoramaDao.insert(housePanorama);
	}
	
	/**
	 * 查找楼盘图片
	 * @author songxh
	 * @createtime 2014-7-5下午10:25:37
	 * @param projectId
	 * @return
	 */
	public List<ProjectImage> findImagesByProject(int projectId){
		return imageDao.find("where projectId=?", projectId);
	}
	
	public List<HousePanorama> findParoamasByHouse(int houseId){
		List<HousePanorama> list = housePanoramaDao.find("where houseId=?", houseId);
		for(HousePanorama panorama : list){
			panorama.setPanorama(panoramaDao.find(panorama.getPanoramaId()));
		}
		return list;
	}
	
	@Override
	protected BaseDao<SubProject> dao() {
		return dao;
	}

}
