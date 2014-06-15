package net.shangtech.weixin.weixin.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "WX_MENU")
public class WxMenu extends IBaseEntity {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "SYS_USER_ID")
	private Integer sysUserId;
	
	@Column(name = "PARENT_ID")
	private Integer parentId;
	
	@Column(name = "MENU_NAME")
	private String menuName;
	
	@Column(name = "MENU_TYPE")
	private Integer menuType;
	
	@Column(name = "MENU_URL")
	private String menuUrl;
	
	@Column(name = "MENU_KEY")
	private String menuKey;
	
	@Column(name = "SORT")
	private Integer sort;
	
	@Column(name = "REPLY_TYPE")
	private Integer replyType;
	
	@Column(name = "REPLY_CONTENT")
	private String replyContent;
	
	@Transient
	private List<WxMenu> children;
	
	@Transient
	private boolean hasChildren = false;

	public Integer getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	public Integer getParentId() {
		if(parentId == null)
			parentId = 0;
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getMenuType() {
		return menuType;
	}

	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuKey() {
		return menuKey;
	}

	public void setMenuKey(String menuKey) {
		this.menuKey = menuKey;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public List<WxMenu> getChildren() {
		return children;
	}

	public void setChildren(List<WxMenu> children) {
		this.children = children;
	}

	public boolean getHasChildren() {
		return hasChildren;
	}

	public void setHasChildren(boolean hasChildren) {
		this.hasChildren = hasChildren;
	}

	public Integer getReplyType() {
		return replyType;
	}

	public void setReplyType(Integer replyType) {
		this.replyType = replyType;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
}
