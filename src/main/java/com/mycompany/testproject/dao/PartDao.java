
package com.mycompany.testproject.dao;

import com.mycompany.testproject.model.Part;
import com.mycompany.testproject.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class PartDao {
    
    public List<Part> getPartAll() {
        List<Part> parts = new ArrayList<Part>();
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            parts = session.createQuery("from Part").list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }        
        return parts;
    }
    
    public List<Part> getPartSeacrch(String name, 
                                        String number, 
                                        String vendor, 
                                        Integer qty, 
                                        Date shipAfter,
                                        Date shipBefore, 
                                        Date recAfter, 
                                        Date recBefore) {
        
        List<Part> parts = new ArrayList<Part>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Part.class);
            if (name != null && name.trim() != "") {
                criteria.add(Restrictions.like("name", "%" + name + "%"));
            }
            if (number != null && number.trim() != "") {
                criteria.add(Restrictions.like("number", "%" + number + "%"));
            }
            if (vendor != null && vendor.trim() != "") {
                criteria.add(Restrictions.like("vendor", "%" + vendor + "%"));
            }
            if (qty != null) {
                criteria.add(Restrictions.ge("qty", qty));
            }
            if (shipAfter != null) {
                criteria.add(Restrictions.ge("shipped", shipAfter));
            }
            if (shipBefore != null) {
                criteria.add(Restrictions.le("shipped", shipBefore));
            }
            if (recAfter != null) {
                criteria.add(Restrictions.ge("receive", recAfter));
            }
            if (recBefore != null) {
                criteria.add(Restrictions.le("receive", recBefore));
            }
            
            parts = criteria.list();           
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return parts;        
    }
}
