package com.java.hibcri;
import java.sql.SQLException;
import java.util.List;
public interface AppointmentDAO {

	String addAppointment(Appointment app) throws ClassNotFoundException, SQLException;
	List<Appointment> showAppointments();
	
}
