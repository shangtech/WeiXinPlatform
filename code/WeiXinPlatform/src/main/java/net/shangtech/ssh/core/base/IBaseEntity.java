package net.shangtech.ssh.core.base;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * 文件名： IBaseEntity.java<br/>
 * 作者： 宋相恒<br/>
 * 版本： 2014-1-12 上午10:32:22 v1.0<br/>
 * 日期： 2014-1-12<br/>
 * 描述：主键类型为Integer的实体父类
 */
@MappedSuperclass
public class IBaseEntity implements Serializable {
	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么)
	 * @since v1.0
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}

  	