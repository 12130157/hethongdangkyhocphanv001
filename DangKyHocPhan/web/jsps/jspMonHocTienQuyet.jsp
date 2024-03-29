<%--
    Document   : jspXemDSLop
    Created on : Apr 23, 2011, 4:29:09 PM
    Author     : ngloc_it
--%>
<%@page import="system.dto.*;"%>
<%@page import="java.util.ArrayList" %>
<%@include file="jspmenu.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    ArrayList<clsDetailSubject> list = (ArrayList<clsDetailSubject>) session.getAttribute("list");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Môn học tiên quyết</title>
        <style media="all" type="text/css">
            #subjectlist{
                margin-left: 10px;
                margin-top: 20px;
                margin-bottom: 20px;
                width: 740px;
                border-left: 2px solid;
                border-right: 2px solid;
                text-align: center;
            }
            #subjectlist th{
                height: 22px;
                font-weight: bold;
                background-color: #F9B7FF;
            }
            #subjectlist td{
               background: url("../imgs/opaque_10.png") repeat scroll 0 0 transparent;
                padding: 2 5 2 5;
            }

        </style>
    </head>
    <body>
        <!--Get data from controller-->

        <!--Div Wrapper-->
        <div id="wrapper">
            <div id="mainNav"><!--Main Navigation-->
                <%@include file="jspMainNav.jsp" %>
            </div><!--End Navigation-->
            <div id="content"><!--Main Contents-->

                <h3>Quản lý danh mục môn học tiên quyết :</h3><br>
                <p align="right"><a href="../servDetailSubject?action=create">Tạo mới môn học tiên quyết</a></p>
                <hr><hr><br>
                <u>Danh sách môn học tiên quyết:</u>
                <form id="sublist">
                    <table id="subjectlist" name="subjectlist">
                        <tr>
                            <th>Môn học</th><th>Môn học tiên quyết</th><th>Xóa</th>
                        </tr>
                        <%for (int i = 0; i < list.size(); i++) {%>
                        <%if (i == 0) {%>
                        <tr>
                            <td><b><%=list.get(i).getSubName()%></b></td>
                            <td><%=list.get(i).getPreSubName()%></td>
                            <td><a href="../servDetailSubject?action=delete&subcode=<%=list.get(i).getSubjectCode()%>&presub=<%=list.get(i).getPreSubjectCode()%>">Xóa</a></td>
                        </tr>
                        <%} else {
                            if (list.get(i).getSubName().equalsIgnoreCase(list.get(i - 1).getSubName())) {%>
                        <tr>
                            <td></td>
                            <td><%=list.get(i).getPreSubName()%></td>
                            <td><a href="../servDetailSubject?action=delete&subcode=<%=list.get(i).getSubjectCode()%>presub=<%=list.get(i).getPreSubjectCode()%>">Xóa</a></td>
                        </tr>
                        <%} else {%>
                        <tr>
                            <td><b><%=list.get(i).getSubName()%></b></td>
                            <td><%=list.get(i).getPreSubName()%></td>
                            <td><a href="../servDetailSubject?action=delete&subcode=<%=list.get(i).getSubjectCode()%>&presub=<%=list.get(i).getPreSubjectCode()%>">Xóa</a></td>
                        </tr>
                        <%}%>
                        <%}%>
                        <%}%>
                        
                    </table>
                </form>
            </div><!--End Contents-->

            <div id="footer"><!--Footer-->
                <%@include file="jspFooter.jsp" %>
            </div><!--End footer-->
        </div>
        <!--End Wrapper-->
    </body>

</html>
