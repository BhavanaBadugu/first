<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="AddAppointment.jsp">
<center>
Enter PatientName : 
<input type="text" name="patientName"/><br><br>
Enter patientEmail : 
<input type="text" name="patientEmail"/><br><br>
Enter patientMobile : 
<input type="text" name="patientMobile"/><br><br>
Enter doctorName : 
<input type="text" name="doctorName"/><br><br>
Enter appointmentDate : 
<input type="date" name="appointmentDate"/><br><br>
Enter appointTime format(hh:mm) : 
<input type="text" name="appointTime"/><br><br>
Enter patientDisease : 
<input type="text" name="patientDisease"/><br><br>

<input type="submit" value="Add Appointment"/><br><br>
</center>

</form>
<c:if test="${param.patientName!=null && param.doctorName!=null && param.appointmentDate!=null}">
<jsp:useBean id="DaoBean" class="com.java.hibcri.AppointmentDAOImpl"/>
<jsp:useBean id="AppointmentBean" class="com.java.hibcri.Appointment"/>
<jsp:setProperty property="patientName" name="AppointmentBean"/>
<jsp:setProperty property="patientEmail" name="AppointmentBean"/>
<jsp:setProperty property="patientMobile" name="AppointmentBean"/>
<jsp:setProperty property="doctorName" name="AppointmentBean"/>
<%

String s = request.getParameter("appointmentDate");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
java.util.Date parsedDate = sdf.parse(s);
java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
AppointmentBean.setAppointmentDate(sqlDate);

%>
<jsp:setProperty property="appointTime" name="AppointmentBean"/>
<jsp:setProperty property="patientDisease" name="AppointmentBean"/>
<c:out value="${DaoBean.addAppointment(AppointmentBean)}"/>
</c:if>


</body>
</html>