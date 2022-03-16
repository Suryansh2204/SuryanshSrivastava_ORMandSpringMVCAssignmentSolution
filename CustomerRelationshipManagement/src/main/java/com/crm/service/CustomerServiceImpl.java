package com.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.crm.entity.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService
{
	SessionFactory sessionFactory;
	Session session;
	
	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory)
	{
		try {
			this.session=sessionFactory.getCurrentSession();
			
		}
		catch(HibernateException e)
		{
			this.session=sessionFactory.openSession();
		}
	}
	
	@Override
	public List<Customer> findAll() 
	{
		List<Customer> customers=session.createQuery("from Customer").list(); 
		return customers;
	}

	@Override
	@Transactional
	public Customer findById(int id) {
		Transaction tx=session.beginTransaction();
		Customer customer=session.get(Customer.class, id);
		tx.commit();
		return customer;
	}

	@Override
	@Transactional
	public void save(Customer customer) 
	{
		Transaction tx=session.beginTransaction();
		session.saveOrUpdate(customer);
		tx.commit();
	}

	@Override
	@Transactional
	public void deleteById(int id) {
		Transaction tx=session.beginTransaction();
		Customer customer=session.get(Customer.class,id);
		session.delete(customer);
		tx.commit();
	}

}
