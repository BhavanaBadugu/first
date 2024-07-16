package com.java.hibcri;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class AppointmentDAOImpl implements AppointmentDAO{

	SessionFactory factory;
	Session s;

	@Override
	public String addAppointment(Appointment app) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		factory=SessionHelper.getSession();
		s=factory.openSession();
		Transaction trn=s.beginTransaction();
		Criteria cr = s.createCriteria(Appointment.class);
		cr.add(Restrictions.eq("doctorName",app.getDoctorName()));
		Appointment appoint = (Appointment)cr.uniqueResult();
		if(appoint.getDoctorName()==null) {
			Criteria crtime = s.createCriteria(Appointment.class);
			cr.add(Restrictions.eq("appointtime",app.getAppointTime()));
			cr.add(Restrictions.eq("appointmentdate",app.getAppointmentDate()));
			Appointment appointime = (Appointment)cr.uniqueResult();
			if(appointime==null) {
				s.save(app);
				trn.commit();
				return "Hospital data saved";
			}
			else{
				return "this time already one appointment is there exact 30 s after";
			}
		}
		else{
			return "Doctor already one pasent is there";
		}
	}
	@Override
	public List<Appointment> showAppointments() {
		
		factory=SessionHelper.getSession();
		s = factory.openSession();
		Criteria c = s.createCriteria(Appointment.class);
		return c.list();
		
	}
}
