package cn.edu.lingnan.servlet.STAFF;

import cn.edu.lingnan.dao.StaffDAO;
import cn.edu.lingnan.dao.UserDAO;
import cn.edu.lingnan.dto.StaffDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

public class modifyStaffServlet extends HttpServlet {
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
    {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("GB18030");
        String userid=request.getParameter("useridF");
        String staffid=userid+request.getParameter("staffidF");
        String staffname=request.getParameter("staffnameF");
       // staffname = new String(staffname.getBytes("iso-8859-1"),"GB18030");

        String authority=session.getAttribute("authority").toString();
        //System.out.println(userid+"0000");
         //System.out.println(staffid+"1111");
        boolean bool= UserDAO.searchOneUser(userid);
        if(bool){
            bool= StaffDAO.ChangeStaffMessage(userid,staffid,staffname);
            if(bool)
            {
                Vector<StaffDTO> Allstaff= StaffDAO.findAllStaff(userid,authority);
                //System.out.println(Allstaff.size());
                request.setCharacterEncoding("GB18030");
                session.setAttribute("Allstaff",Allstaff);
                //System.out.println(request.getContextPath());
                response.sendRedirect(request.getContextPath()+"/allCanAccept/staffmain.jsp");
            }
            else{
                response.getWriter().print( "<script>alert(\"请确认输入的数据是否已经存在!\");window.location.href='/allCanAccept/staffmain.jsp'</script>");

            }

        }
        else{
            response.getWriter().print( "<script>alert(\"请确认输入的所属店铺是否存在!\");window.location.href='/allCanAccept/staffmain.jsp'</script>");

           // response.sendRedirect(request.getContextPath()+"/error/errorInput.html");
        }

    }

}
