

package system.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import system.bo.clsBOAccount;
import system.bo.clsBODetailSubject;
import system.dto.clsDetailSubject;

@WebServlet(name="servDetailSubject", urlPatterns={"/servDetailSubject"})
public class servDetailSubject extends HttpServlet {
   
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        clsBOAccount BOA=new clsBOAccount();
        try {
             String user=(String) session.getAttribute("username");
             if(user==null){
                session.setAttribute("mes", "Để xem trang này bạn phải đăng nhập!");
                 String path = "./jsps/jspThongBao.jsp";
                response.sendRedirect(path);
            }
            else{
                String action=request.getParameter("action");
                if(action.equalsIgnoreCase("view")){
                    if(BOA.getAccountType(user)==0)
                 GetListSubDetail(response, session);
                    else {
                        session.setAttribute("mes", "Để xem trang này bạn phải đăng nhập bằng tài khoản sinh viên!");
                 String path = "./jsps/jspThongBao.jsp";
                response.sendRedirect(path);
                    }
                 }
                else if(action.equalsIgnoreCase("viewQL")){
                  if(BOA.getAccountType(user)==1)
                 GetListSubDetail(response, session);
                    else {
                        session.setAttribute("mes", "Để xem trang này bạn phải đăng nhập bằng tài khoản quản lý!");
                 String path = "./jsps/jspThongBao.jsp";
                response.sendRedirect(path);
                    }
                }
            }
        } finally { 
            out.close();
        }
    }
    private void GetListSubDetail(HttpServletResponse resp, HttpSession session) throws Exception{
        clsBODetailSubject BOD=new clsBODetailSubject();
        ArrayList<clsDetailSubject> list=BOD.getListDetailSub();
        session.setAttribute("list", list);
        String path = "./jsps/jspMonHocTienQuyet.jsp";
        resp.sendRedirect(path);
    }
   /**
    *
    * @param request
    * @param response
    * @throws ServletException
    * @throws IOException
    */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servDetailSubject.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servDetailSubject.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @return
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
