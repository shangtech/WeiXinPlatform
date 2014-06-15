package net.shangtech.ssh.core.base;

import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 文件名： BaseDao.java<br/>
 * 作者： 宋相恒<br/>
 * 版本： 2014-1-12 上午10:59:15 v1.0<br/>
 * 日期： 2014-1-12<br/>
 * 描述：数据访问父类，所有操作都必须基于hibernateTemplate
 */
@SuppressWarnings("unchecked")
public class BaseDao<T> extends HibernateDaoSupport {
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:40:23 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param entity<br/>
	 * 描述：添加记录
	 */
	public void insert(T entity) {
		this.getHibernateTemplate().save(entity);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:40:44 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param id<br/>
	 * 描述：删除记录
	 */
	public void delete(int id) {
		this.getHibernateTemplate().delete(this.find(id));
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:40:55 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param entity<br/>
	 * 描述：更新记录
	 */
	public void update(T entity) {
		this.getHibernateTemplate().merge(entity);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:41:07 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param id<br/>
	 * @return<br/>
	 * 描述：根据主键查找记录
	 */
	public T find(int id) {
		T obj = null;
		obj = (T) this.getHibernateTemplate().get(getEntityClass(), id);
		return obj;
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:41:23 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param orderBy 排序规则,如"order by sort desc",如果不用排序应该使用findAll()方法<br/>
	 * @return<br/>
	 * 描述：查找所有记录,使用orderBy规则排序
	 */
	public List<T> findAll(String orderBy){
		String queryString = "from " + getEntityClass().getSimpleName();
		if (StringUtils.isNotBlank(orderBy)) {
			queryString += " order by " + orderBy;
		}
		return this.getHibernateTemplate().find(queryString);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:41:23 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @return<br/>
	 * 描述：查找所有记录
	 */
	public List<T> findAll(){
		return findAll(null);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 上午11:44:43 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param start 该页从第几条记录开始<br/>
	 * @param limit 该页最多几条记录<br/>
	 * @param orderBy	排序规则,如"order by sort desc"<br/>
	 * @return<br/>
	 * 描述：查找所有记录并分页显示
	 */
	public List<T> findAll(final int start, final int limit, String orderBy){
		String queryString = "from " + getEntityClass().getSimpleName();
		if (StringUtils.isNotBlank(orderBy)) {
			queryString += " order by " + orderBy;
		}
		final String hql = queryString;
		return super.getHibernateTemplate().executeFind(new HibernateCallback<List<T>>(){
			public List<T> doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery(hql);
				query.setFirstResult(start)
					.setMaxResults(limit);
				return query.list();
			}
		});
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:24:50 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param start 结果页从第几条记录开始<br/>
	 * @param limit 结果页最多几条记录<br/>
	 * @return<br/>
	 * 描述：
	 */
	public List<T> findAll(final int start, final int limit){
		return findAll(start, limit, null);
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:25:50 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param hql 查询字符串,where开头<br/>
	 * @param values 查询参数值<br/>
	 * @return<br/>
	 * 描述：
	 */
	public List<T> find(String hql, Object...values){
		String queryString = "from " + getEntityClass().getSimpleName() + " o " + hql;
		return super.getHibernateTemplate().find(queryString, values);
	}
	
	public T findUnique(String hql, Object...values){
		List<T> list = find(hql, values);
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:26:47 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param start 结果页从第几条记录开始<br/>
	 * @param limit 结果页中最多有几条记录<br/>
	 * @param hql 查询字符串,where开头<br/>
	 * @param values 查询参数值<br/>
	 * @return<br/>
	 * 描述：
	 */
	public List<T> find(final int start, final int limit, String hql, final Object...values){
		final String queryString = "select o from " + getEntityClass().getSimpleName() + " o " + hql;
		return super.getHibernateTemplate().execute(new HibernateCallback<List<T>>(){
			public List<T> doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(queryString);
				if(values != null && values.length > 0){
					for(int i = 0; i < values.length; i++){
						query.setParameter(i, values[i]);
					}
				}
				query.setFirstResult(start);
				query.setMaxResults(limit);
				return query.list();
			}
		});
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:27:49 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param queryString 完整的查询字符串<br/>
	 * @param values 查询参数值<br/>
	 * @return<br/>
	 * 描述：该查询为聚集查询,返回查询结果集第一条记录,查询字符串为完整的查询
	 */
	public Object gather(String queryString, Object...values){
		List<Object> list = super.getHibernateTemplate().find(queryString, values);
		if(list != null && !list.isEmpty())
			return list.get(0);
		return null;
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:30:06 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @return<br/>
	 * 描述：统计某张表总的记录数
	 */
	public int countAll(){
		String queryString = "select count(o) from " + getEntityClass().getSimpleName() + " o ";
		Object count = gather(queryString);
		if(count != null)
			return ((Long) count).intValue();
		return 0;
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:30:54 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param hql where开头的查询字符串<br/>
	 * @param values hql中的参数值<br/>
	 * @return<br/>
	 * 描述：查询满足条件的记录数量
	 */
	public int count(String hql, Object...values){
		String queryString = "select count(o) from " + getEntityClass().getSimpleName() + " o " + hql;
		Object count = gather(queryString, values);
		if(count != null)
			return ((Long) count).intValue();
		return 0;
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午5:43:01 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param queryString 完整的查询语句,如update o from Table o set o.xx=? where condition<br/>
	 * @param values<br/>
	 * 描述：执行指定语句,一般用来做批量操作
	 */
	public void execute(String queryString, Object...values){
		super.getHibernateTemplate().bulkUpdate(queryString, values);
	}
	
	
	public List<Object> executeSql(final String sql, final Object...values){
		return getHibernateTemplate().execute(new HibernateCallback<List<Object>>(){

			@Override
			public List<Object> doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				if(values != null && values.length > 0){
					for(int i = 0; i < values.length; i++){
						query.setParameter(i, values[i]);
					}
				}
				return query.list();
			}
			
		});
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:31:51 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @return<br/>
	 * 描述：获取实体T的类型
	 */
	private Class<?> getEntityClass() {
		Class<?> entityClass = (Class<?>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
		return entityClass;
	}
	
	/**
	 * 作者： 宋相恒<br/>
	 * 版本： 2014-1-12 下午2:32:14 v1.0<br/>
	 * 日期： 2014-1-12<br/>
	 * @param sessionFactory<br/>
	 * 描述：实现sessionFactory自动注入
	 */
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}

  	