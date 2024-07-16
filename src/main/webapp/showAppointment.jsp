<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="AppointmentBeanDao" class="com.java.hibcri.AppointmentDAOImpl" />
<c:set var="list" value="${AppointmentBeanDao.showAppointments()}"/>

<table border="1" cellspacing="0" align="center">
<tr>
<th>AppointmentId</th>
<th> patientName</th>
<th>PatientEmail</th>
<th>PatientMobile</th>
<th>DoctorName</th>
<th>AppointmentDate</th>
<th>AppointTime</th>
<th>PatientDisease</th>
   
</tr>
<c:forEach var="appointment" items="${list}">
<tr>
		<td><c:out value="${appointment.appointmentId}"/></td>
		<td><c:out value="${appointment.patientName}"/></td>
		<td><c:out value="${appointment.patientEmail}"/></td>
		<td><c:out value="${appointment.patientMobile}"/></td>
		<td><c:out value="${appointment.doctorName}" /></td>
		<td><c:out value="${appointment.appointmentDate}" /></td>
		<td><c:out value="${appointment.appointTime}" /></td>
<td><c:out value="${appointment.patientDisease}" /></td>
		</tr>
</c:forEach>

</body>
</html>