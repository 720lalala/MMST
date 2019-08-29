package cn.edu.lingnan.servlet.SALES;

import cn.edu.lingnan.dao.*;
import cn.edu.lingnan.dto.DepotDetailsDTO;
import cn.edu.lingnan.dto.FlowSheetDTO;
import cn.edu.lingnan.dto.SalesDTO;
import cn.edu.lingnan.dto.StaffDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class sumbitSalesServlet extends HttpServlet {
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
        String flowid=session.getAttribute("FutureFlowid").toString();
        float sumprice=Float.parseFloat(session.getAttribute("sumprice").toString());
        String payway=request.getParameter("zhifuF");
        payway = new String(payway.getBytes("iso-8859-1"),"GB18030");
        String userid=session.getAttribute("salesUserid").toString();
        Vector<DepotDetailsDTO> salesDetails=( Vector<DepotDetailsDTO>)session.getAttribute("salesDetails");
        FlowSheetDTO InsertFlowsheet=new FlowSheetDTO();
        String sales1=session.getAttribute("salesUserid").toString();
        String slaes2=session.getAttribute("userid").toString();
        InsertFlowsheet.setUserid(userid);
        Date date1 = new Date();
        SimpleDateFormat aaaaa = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date2 = aaaaa.format(date1);
        InsertFlowsheet.setTime(date2);
        InsertFlowsheet.setPricea(sumprice);
        InsertFlowsheet.setPayway(payway);
        InsertFlowsheet.setUserid(userid);
        InsertFlowsheet.setFlowid(flowid);
        boolean bool= FlowSheetDAO.InsertFlowSheetMessage(InsertFlowsheet);
        int i=0;
        if(bool){

            while (salesDetails.size()>i)
            {
                SalesDTO tempsales=new SalesDTO();
                tempsales.setClothingid(salesDetails.get(i).getClothingid());
                tempsales.setUserid(salesDetails.get(i).getUserid());
                tempsales.setStaffid(salesDetails.get(i).getStaffid());
                tempsales.setDisprice(salesDetails.get(i).getDiscount()*salesDetails.get(i).getPrice()*salesDetails.get(i).getNumbers());
                tempsales.setFlowid(flowid);
                tempsales.setNumbers(salesDetails.get(i).getNumbers());
                boolean bool1=SalesDAO.InsertSalesMessage(tempsales);
                boolean bool2= DepotDAO.ReduceInventory(tempsales);
                if((!bool1)||(!bool2))
                {
                    break;
                }
                i++;
            }
            if(i!=salesDetails.size())
            {
                //System.out.println("系统出错！");
                if(sales1.equals(slaes2))
                {
                    response.getWriter().print( "<script>alert(\"系统出错!\");window.location.href='/allCanAccept/sales.jsp'</script>");
                }
                else
                {
                    response.getWriter().print( "<script>alert(\"系统出错!\");window.location.href='/admin/allSalesmain.jsp'</script>");
                }
            }
            else {

                request.setCharacterEncoding("GB18030");

                Vector<DepotDetailsDTO> salesDetails2=new Vector<DepotDetailsDTO>();
                session.setAttribute("salesDetails",salesDetails2);
                if(sales1.equals(slaes2))
                {

                    flowid= FlowSheetDAO.searchFutureFlowid(userid);
                    session.setAttribute("FutureFlowid",flowid);
                    response.getWriter().print( "<script>alert(\"成功输入订单!\");window.location.href='/allCanAccept/sales.jsp'</script>");
                }
                else
                {
                    session.setAttribute("FutureFlowid","");
                    response.getWriter().print( "<script>alert(\"成功输入订单!\");window.location.href='/admin/allSalesmain.jsp'</script>");
                }
            }



        }


    }

}