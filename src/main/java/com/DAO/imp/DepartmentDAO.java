package com.DAO.imp;

import com.entity.Department;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DepartmentDAO {

    private SessionFactory sessionFactory;

    public DepartmentDAO() {
        try {
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            System.out.println("SessionFactory created successfully.");
        } catch (Exception e) {
            System.out.println("Failed to create SessionFactory.");
            e.printStackTrace();
        }
    }
    public void save(Department department) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.saveOrUpdate(department);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
