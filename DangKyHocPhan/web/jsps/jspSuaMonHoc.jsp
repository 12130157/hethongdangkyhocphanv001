<%--
    Document   : jspTaoLopHoc
    Created on : Apr 23, 2011, 4:30:16 PM
    Author     : ngloc_it
--%>

<%@page import="system.dto.clsSubject"%>
<%@include file="jspmenu.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    clsSubject sub = (clsSubject) session.getAttribute("sub");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật môn học</title>
        <style media="all" type="text/css">

        </style>
    </head>
    <body>
        <!--Div Wrapper-->
        <div id="wrapper">
            <div id="mainNav"><!--Main Navigation-->
                <%@include file="jspMainNav.jsp" %>
            </div><!--End Navigation-->
            <div id="content"><!--Main Contents-->
                <u><b>Sửa môn học mới :</b></u><br/>
                <form id="frmInfo" action="../servSubject?action=update" method="post" name="frmInfo">
                    <u>Thông tin môn học.</u><br/>
                    <table id="tableinfo">
                        <tr>
                            <td>Môn học</td>
                            <td>
                                <input type="text" readonly name="txtsubname" id="txtsubname" value="<%=sub.getSubName()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>Mã môn</td>
                            <td>
                                <input type="text" readonly name="txtsuncode" id="txtsuncode" value="<%=sub.getSubCode()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>Số Tín chỉ</td>
                            <td>
                                <select name="snumTC" id="snumTC" onchange="numtcchange()">
                                    <%for (int i = 1; i < 11; i++) {%>

                                    <option value="<%=i%>"><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Số tín chỉ lý thuyết</td>
                            <td>
                                <select name="snumTCLT" id="snumTCLT" onchange="numtcltchange()">
                                    <%for (int i = 0; i < 11; i++) {%>

                                    <option value="<%=i%>"><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Số tín chỉ thực hành</td>
                            <td>
                                <input type="text" name="txtTCTH" id="txtTCTH" readonly>
                            </td>
                        </tr>

                    </table>
                    <br/>
                    <input type="button" value="cập nhật môn học" onclick="updatesub()">
                </form>
            </div><!--End Contents-->

            <div id="footer"><!--Footer-->
                <%@include file="jspFooter.jsp" %>
            </div><!--End footer-->
        </div>
        <!--End Wrapper-->
    </body>
    <script  type = "text/javascript" >
        function numtcchange(){
            TC=document.getElementById("snumTC").value;
            TCLT=document.getElementById("snumTCLT").value;
            document.getElementById("txtTCTH").value=TC-TCLT;
        }
        function numtcltchange(){
            TC=document.getElementById("snumTC").value;
            TCLT=document.getElementById("snumTCLT").value;
            if(TCLT-TC>0){
                document.getElementById("snumTCLT").value=0;
                document.getElementById("txtTCTH").value=TC;
            }
            numtcchange();

        }
        function updatesub(){
            document.forms["frmInfo"].submit();
        }
    </script>
</html>
