package net.rytong.dao;
import java.util.List;
import java.util.Map;

import net.rytong.utils.PagingEnumerator;
import net.rytong.entity.LotteryBuyNumber;

public interface ILotteryBuyNumberDAO {

	public void save(LotteryBuyNumber entity);

	/**
	 * Delete a persistent Event entity. This operation must be performed within
	 * the a database transaction context for the entity's data to be
	 * permanently deleted from the persistence store, i.e., database. This
	 * method uses the {@link javax.persistence.EntityManager#remove(Object)
	 * EntityManager#delete} operation.
	 * 
	 * <pre>
	 * EntityManagerHelper.beginTransaction();
	 * IEventDAO.delete(entity);
	 * EntityManagerHelper.commit();
	 * entity = null;
	 * </pre>
	 * 
	 * @param entity
	 *            Event entity to delete
	 * @throws RuntimeException
	 *             when the operation fails
	 */
	public void delete(LotteryBuyNumber entity);

	/**
	 * Persist a previously saved Event entity and return it or a copy of it to
	 * the sender. A copy of the Event entity parameter is returned when the JPA
	 * persistence mechanism has not previously been tracking the updated
	 * entity. This operation must be performed within the a database
	 * transaction context for the entity's data to be permanently saved to the
	 * persistence store, i.e., database. This method uses the
	 * {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge}
	 * operation.
	 * 
	 * <pre>
	 * EntityManagerHelper.beginTransaction();
	 * entity = IEventDAO.update(entity);
	 * EntityManagerHelper.commit();
	 * </pre>
	 * 
	 * @param entity
	 *            Event entity to update
	 * @return Event the persisted Event entity instance, may not be the same
	 * @throws RuntimeException
	 *             if the operation fails
	 */
	public LotteryBuyNumber update(LotteryBuyNumber entity);

	public LotteryBuyNumber findById(Long id);

	/**
	 * Find all Event entities with a specific property value.
	 * 
	 * @param propertyName
	 *            the name of the Event property to query
	 * @param value
	 *            the property value to match
	 * @param rowStartIdxAndCount
	 *            Optional int varargs. rowStartIdxAndCount[0] specifies the the
	 *            row index in the query result-set to begin collecting the
	 *            results. rowStartIdxAndCount[1] specifies the the maximum
	 *            count of results to return.
	 * @return List<Event> found by query
	 */
	public List<LotteryBuyNumber> findByProperty(String propertyName, Object value,
			int... rowStartIdxAndCount);

	/**
	 * Find all Event entities.
	 * 
	 * @param rowStartIdxAndCount
	 *            Optional int varargs. rowStartIdxAndCount[0] specifies the the
	 *            row index in the query result-set to begin collecting the
	 *            results. rowStartIdxAndCount[1] specifies the the maximum
	 *            count of results to return.
	 * @return List<Event> all Event entities
	 */
	public List<LotteryBuyNumber> findAll(int... rowStartIdxAndCount);
	
	public PagingEnumerator<LotteryBuyNumber> pageList(Map<String, Object> filterMap,
			int pageNo, int pageSize);
}