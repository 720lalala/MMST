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

public class insertUserServlet extends HttpServlet {
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
        String userid=request.getParameter("useridI");
        String password=request.getParameter("passwordI");
        String username=request.getParameter("usernameI");
        //System.out.println(userid+"0000");
        //System.out.println(username+"1111");
        UserDTO tempuser=new UserDTO();
        tempuser.setUserid(userid);
        tempuser.setPassword(password);
        tempuser.setAuthority("pu");
        tempuser.setUsername(username);
        boolean bool= UserDAO.insertUser(tempuser);
        if(bool){

            Vector<UserDTO> AllUser=UserDAO.findAllUser();
            //System.out.println(AllUser.size());
            HttpSession session = request.getSession();
            session.setAttribute("AllUser",AllUser);
            response.sendRedirect(request.getContextPath()+"adminmain.jsp");
        }
        else{
            response.getWriter().print( "<script>alert(\"请确认该员工存在!\");window.location.href='adminmain.jsp'</script>");

        }

    }

}

