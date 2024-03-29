package cn.edu.lingnan.servlet.USER;

import cn.edu.lingnan.dao.UserDAO;
import cn.edu.lingnan.dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

public class modifyMyselfUserServlet  extends HttpServlet {
    @Override
    public void init()throws ServletException {}
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
        doGet(request,response);
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException
    { request.setCharacterEncoding("GB18030");
        HttpSession session = request.getSession();

        String userid=request.getParameter("useridL");
        String password=request.getParameter("passwordF");
        String username=request.getParameter("usernameF");
        String authority= session.getAttribute("authority").toString();
        //System.out.println(userid+"0000");
        // System.out.println(username+"1111");
        boolean bool= UserDAO.ChangeUserMessage(userid,password,username);
        if(bool){

            Vector<UserDTO> AllUser=UserDAO.findAllUser();
            //System.out.println(AllUser.size());
            session.setAttribute("AllUser",AllUser);

            if(authority.compareTo("su")==0)
            response.sendRedirect(request.getContextPath()+"../admin/adminmain.jsp");
            else response.sendRedirect(request.getContextPath()+"sales.jsp");
        }
        else{
            if(authority.compareTo("su")==0)
                response.getWriter().print( "<script>alert(\"输入的值 出现错误，请重新操作!\");window.location.href='../admin/adminmain.jsp'</script>");
            else response.getWriter().print( "<script>alert(\"输入的值 出现错误，请重新操作!\");window.location.href='sales.jsp'</script>");

        }

    }

}