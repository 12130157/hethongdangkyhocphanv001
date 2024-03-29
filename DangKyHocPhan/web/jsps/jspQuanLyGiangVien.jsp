<%-- 
    Document   : jspQuanLyGiangVien
    Created on : 19-05-2011, 22:13:30
    Author     : ngloc_it
--%>

<%@page import="system.dto.clsLecturer"%>
<%@include file="jspmenu.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    ArrayList<clsLecturer> leclist = (ArrayList<clsLecturer>) session.getAttribute("leclist");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý giảng viên</title>
        <style media="all" type="text/css">
            #tablelistlecturer{
                margin-left: 10px;
                margin-top: 20px;
                margin-bottom: 20px;
                width: 740px;
                border: 3px solid #73726E;
                -moz-border-radius:5px 5px 5px 5px;
                text-align: center;
            }
            #tablelistlecturer th{
                height: 32px;
                font-weight: bold;
                background: url("../imgs/opaque_10.png") repeat scroll 0 0 transparent;
            }
            #tablelistlecturer td{
                background: url("../imgs/opaque_10.png") repeat scroll 0 0 transparent;
                padding: 2 5 2 5;
            }
            #formsearch{
                margin-top: 10px;
                margin-left: 20px;
                padding: 5 10 5 10;
                border: 3px solid #73726E;
                -moz-border-radius:5px 5px 5px 5px;
                background: url("../imgs/opaque_10.png") repeat scroll 0 0 transparent;
                width: 320px;
            }
        </style>
    </head>
    <body>
        <!--Div Wrapper-->
        <div id="wrapper">
            <div id="mainNav"><!--Main Navigation-->
                <%@include file="jspMainNav.jsp" %>
            </div><!--End Navigation-->
            <div id="content"><!--Main Contents-->
                <br>
                <u>Tìm kiếm giảng viên:</u>
                <br/>
                <form id = "formsearch" name="formsearch" action="../ManageLecturer?searchengine=true" method="post">
                    <table>
                        <tr>
                            <td><input type="radio" name="radiooption" id="rsubject" checked="true" onclick="selectAll()" ></td>
                            <td>All</td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="radiooption" id="rsubject" onclick="selectId()"></td>
                            <td><input type="text" name="txtId"> Tìm theo mã GV</td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="radiooption" id="rlecturer" onclick="selectName()"></td>
                            <td><input type="text" name="txtName"> Tìm theo tên GV</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="button" onclick="search()" value="Tìm Kiếm"></td>
                        </tr>
                    </table>
                </form>
                <p align="right"><a href="../servLecturerManager?action=add"><b>Thêm giảng viên</b></a></p>
                <hr/><hr/>
                <u><b>Danh sách các giảng viên khoa công nghệ phần mềm:</b></u>
                <form id="classlist">
                    <table id="tablelistlecturer" name="tablelistlecturer">
                        <tr>
                            <th>STT</th><th>Mã GV</th><th>Họ Tên</th><th>Ngày Sinh</th><th>Giới tính</th><th>Học hàm</th><th>Học vị</th><th>Sửa</th><th>Xóa</th>
                        </tr>
                        <%for (int i = 0; i < leclist.size(); i++) {%>
                        <tr>
                            <td><%=i + 1%></td>
                            <td><a href="../servLecturerManager?action=detail&code=<%=leclist.get(i).getLecturerCode()%>"><%=leclist.get(i).getLecturerCode()%></a></td>
                            <td><%=leclist.get(i).getFullname()%></td>
                            <td><%=leclist.get(i).getBirthDay()%></td>
                            <td><%=leclist.get(i).getGender()%></td>
                            <td><%=leclist.get(i).getHocHam()%></td>
                            <td><%=leclist.get(i).getHocVi()%></td>
                            <td><a href="../servLecturerManager?code=<%=leclist.get(i).getLecturerCode()%>&action=edit">Sửa</a></td>
                            <td><a href="../servLecturerManager?code=<%=leclist.get(i).getLecturerCode()%>&action=predelete">Xóa</a></td>
                        </tr>
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
    <script src="../javascripts/jsGiangVien.js"></script>
    <script type="text/javascript">
        typesearch="All";
        name="";
        action="search";
        var http = createRequestObject();
        function search(){
            //if(http){
            if(typesearch=="name"){
                name=document.formsearch.txtName.value;
            }
            else{
                name=document.formsearch.txtId.value;
            }
            ajaxfunction("../servLecturerManager?action="+action+"&type="+typesearch+"&name="+name);
           
        }
        function selectName(){
            typesearch="name";
        }
        function selectId(){
            typesearch="id";
        }
        function selectAll(){
            typesearch="All";
        }
    </script>
</html>
