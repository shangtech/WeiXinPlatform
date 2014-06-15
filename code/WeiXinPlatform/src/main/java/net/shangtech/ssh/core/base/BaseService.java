package net.shangtech.ssh.core.base;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

/**
 * 文件名： BaseService.java<br/>
 * 作者： 宋相恒<br/>
 * 版本： 2014-1-13 下午8:55:34 v1.0<br/>
 * 日期： 2014-1-13<br/>
 * 描述：
 */
public abstract class BaseService<T> {
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-13 下午8:59:30 v1.0<br/>
	 * 日期： 2014-1-13<br/>
	 * @param entity<br/>
	 * 描述：存储数据
	 */
	public void add(T entity){
		try{
			dao().insert(entity);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
			//throw new RuntimeException("保存对象" + entity + "时出错");
		}
	}
	
	public T find(int id){
		try{
			return dao().find(id);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
			//throw new RuntimeException("查询[ID="+id+"]的类型" + getEntityClass().getName() + "时出错");
		}
	}
	
	public void delete(int id){
		try{
			dao().delete(id);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
			//throw new RuntimeException("删除[ID="+id+"]的类型" + getEntityClass().getName() + "时出错");
		}
	}
	
	public void update(T entity){
		try{
			dao().update(entity);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-14 下午8:57:39 v1.0<br/>
	 * 日期： 2014-1-14<br/>
	 * @return<br/>
	 * 描述：查询全部记录
	 */
	public List<T> find(){
		try{
			return dao().findAll();
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public List<T> find(String hql, Object...values){
		try{
			return dao().find(hql, values);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-14 下午8:51:35 v1.0<br/>
	 * 日期： 2014-1-14<br/>
	 * @param page
	 * @return<br/>
	 * 描述：查找分页记录
	 * 		<p>如果查找全部记录只需要start+limit或者pageNo+limit</p>
	 * 		<p>如果使用查询语句查询需要设置page的hql+values</p>
	 */
	public Page<T> find(Page<T> page){
		try{
			if(StringUtils.isEmpty(page.getHql())){
				page.setTotalCount(dao().countAll());
				page.setResult(dao().findAll(page.getStart(), page.getLimit()));
			}else{
				String countHql = page.getHql();
				if(countHql.contains("order by")){
					countHql = countHql.substring(0, countHql.indexOf("order by"));
				}
				page.setTotalCount(dao().count(countHql, page.getValues()));
				page.setResult(dao().find(page.getStart(), page.getLimit(), page.getHql(), page.getValues()));
			}
			return page;
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-14 下午8:57:59 v1.0<br/>
	 * 日期： 2014-1-14<br/>
	 * @param orderBy
	 * @return<br/>
	 * 描述：查询全部记录并使用orderBy规则排序
	 */
	public List<T> find(String orderBy){
		try{
			return dao().findAll(orderBy);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-2-23 下午7:05:12 v1.0<br/>
	 * 日期： 2014-2-23<br/>
	 * @param hql
	 * @param start
	 * @param limit
	 * @param values
	 * @return<br/>
	 * 描述：
	 */
	public List<T> find(int start, int limit, String hql, Object...values){
		return dao().find(start, limit, hql, values);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-14 下午9:01:11 v1.0<br/>
	 * 日期： 2014-1-14<br/>
	 * @param page
	 * @param orderBy
	 * @return<br/>
	 * 描述：分页查询全部记录并使用orderBy规则排序,如果是用hql查询应该使用只有page参数的方法,这个方法只查全部记录
	 */
	public Page<T> find(Page<T> page, String orderBy){
		try{
			page.setTotalCount(dao().countAll());
			page.setResult(dao().findAll(page.getStart(), page.getLimit(), orderBy));
			return page;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	public T findUnique(String hql, Object...values){
		return dao().findUnique(hql, values);
	}
	
	public int count(String hql, Object...values){
		try{
			return dao().count(hql, values);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	public List<Object> executeSql(final String sql, final Object...values){
		return dao().executeSql(sql, values);
	}
	
	public Object gather(String queryString, Object...values){
		return dao().gather(queryString, values);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:31:51 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @return<br/>
	 * 描述：获取实体T的类型
	 */
	protected Class<?> getEntityClass() {
		Class<?> entityClass = (Class<?>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
		return entityClass;
	}
	protected abstract BaseDao<T> dao();
}

  	