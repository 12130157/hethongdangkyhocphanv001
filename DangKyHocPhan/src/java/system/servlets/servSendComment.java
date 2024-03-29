/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package system.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import system.access.mapper.clsMapperComment;
import system.bo.clsBOAccount;
import system.bo.clsBOComment;
import system.dto.clsComment;

@WebServlet(name = "servSendComment", urlPatterns = {"/servSendComment"})
public class servSendComment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String guest = request.getParameter("guest");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        clsBOAccount BOA = new clsBOAccount();
        try {
            if (guest.equalsIgnoreCase("true")) {//khách liên hệ
                sendCommentByGuest(request, response);
            } else if (guest.equalsIgnoreCase("false")) {//sinh viên liên hệ
                sendCommentByStudent(request, response, session);
            } else if (guest.equalsIgnoreCase("notlogin")) {
                String login = (String) session.getAttribute("username");
                if (login == null || BOA.getAccountType(login) != 0) {
                    session.setAttribute("mes", "Để xem trang này bạn phải đăng nhập với tài khoản sinh viên!");
                    String path = "./jsps/jspThongBao.jsp";
                    response.sendRedirect(path);
                } else {
                    String path = "./jsps/jspGuiYeuCau.jsp";
                    response.sendRedirect(path);
                }
            }
        } finally {
            out.close();
        }
    }

    private void sendCommentByGuest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        clsMapperComment mpc = new clsMapperComment();
        int id = mpc.getMaxId() + 1;
        String content = request.getParameter("txtContent");
        String author = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String MSSV = "visiter";
        Date todayD = new Date(System.currentTimeMillis());
        SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy/MM/dd");
        String date = dayFormat.format(todayD.getTime());
        clsComment cls = new clsComment(id, content, author, email, date, MSSV);
        clsBOComment clsBo = new clsBOComment();
        clsBo.CommnetInsert(cls);
        session.setAttribute("mes", "Ý kiến của bạn đã được gửi tới quản, xin cảm ơn!");
        String path = "./jsps/jspThongBao.jsp";
        response.sendRedirect(path);
    }

    private void sendCommentByStudent(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        clsMapperComment mpc = new clsMapperComment();
        int id = mpc.getMaxId() + 1;
        String content = request.getParameter("txtContent");
        String author = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String MSSV = request.getParameter("txtMSSV");
        Date todayD = new Date(System.currentTimeMillis());
        SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy/MM/dd");
        String date = dayFormat.format(todayD.getTime());
        clsComment cls = new clsComment(id, content, author, email, date, MSSV);
        clsBOComment clsBo = new clsBOComment();
        clsBo.CommnetInsert(cls);
        session.setAttribute("mes", "Ý kiến của bạn đã được gửi tới quản lý, xin cảm ơn!");
        String path = "./jsps/jspThongBao.jsp";
        response.sendRedirect(path);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servSendComment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servSendComment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
