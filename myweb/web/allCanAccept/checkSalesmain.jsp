<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/21
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/16
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<html lang="en">
<%@ page contentType="text/html;charset=GB18030" language="java" import="cn.edu.lingnan.servlet.*" pageEncoding="GB18030"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="cn.edu.lingnan.dto.SalesDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <!-- Required meta tags -->
    <meta charset="GB18030">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>MMST</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../../images/favicon.png" />
    <style>
        .white_content { display: none;
            position: fixed; top: 25%;
            left: 35%; width: 35%;
            height: 50%;
            border: 16px solid #bfdef7;
            background-color: #a8b2b9;
            z-index:1002;
            padding: 0;
        }


    </style>
    <script language="JavaScript">
        function dateStart()
        {
            //月份对应天数
            MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

            //给年下拉框赋内容
            var y  = new Date().getFullYear();
            for (var i = (y-50); i < (y+50); i++) //以今年为准，前50年，后50年
                document.date.year.options.add(new Option(" "+ i +" 年", i));

            //给月下拉框赋内容
            for (var i = 1; i < 13; i++)
                document.date.month.options.add(new Option(" " + i + " 月", i));

            document.date.year.value = y;
            document.date.month.value = new Date().getMonth() + 1;
            var n = MonHead[new Date().getMonth()];
            if (  new Date().getMonth() ==1 && IsPinYear(yearvalue)  )
                n++;
            writeDay(n); //赋日期下拉框
            document.date.day.value = new Date().getDate();
        }

        if(document.attachEvent)
            window.attachEvent("onload", dateStart);
        else
            window.addEventListener('load', dateStart, false);

        function selectYear(str) //年发生变化时日期发生变化(主要是判断闰平年)
        {
            var monthvalue = document.date.month.options[document.date.month.selectedIndex].value;
            if (monthvalue == "")
            {
                var e = document.date.day;
                optionsClear(e);
                return;
            }
            var n = MonHead[monthvalue - 1];
            if (  monthvalue ==2 && IsPinYear(str)  )
                n++;
            writeDay(n);
        }

        function selectMonth(str)   //月发生变化时日期联动
        {
            var yearvalue = document.date.year.options[document.date.year.selectedIndex].value;
            if (yearvalue == "")
            {
                var e = document.date.day;
                optionsClear(e);
                return;
            }
            var n = MonHead[str - 1];
            if (  str ==2 && IsPinYear(yearvalue)  )
                n++;
            writeDay(n);
        }

        function writeDay(n)   //据条件写日期的下拉框
        {
            var e = document.date.day; optionsClear(e);
            for (var i=1; i<(n+1); i++)
                e.options.add(new Option(" "+ i + " 日", i));
        }

        function IsPinYear(year)//判断是否闰平年
        {
            return(  0 == year%4 && ( year%100 !=0 || year%400 == 0 )  );
        }

        function optionsClear(e)
        {
            e.options.length = 1;
        }
        function optionsClear(e)
        {
            e.options.length = 1;
        }
    </script>

</head>

<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">

            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                        <div class="nav-profile-img">
                            <img src="../../images/faces/face1.jpg" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black"><%=session.getAttribute("userid").toString()%></p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="../allCanAccept/changeIseridMessage">
                            <i class="mdi mdi-cached mr-2 text-success"></i>
                            修改信息
                        </a>

                    </div>
                </li>
                <li class="nav-item d-none d-lg-block full-screen-link">
                    <a class="nav-link">
                        <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
                    </a>
                </li>
                <li class="nav-item nav-logout d-none d-lg-block">
                    <a class="nav-link" href="../login.jsp">
                        <i class="mdi mdi-power"></i>
                    </a>
                </li>
                <li class="nav-item nav-settings d-none d-lg-block">
                    <a class="nav-link" href="#">
                        <i class="mdi mdi-format-line-spacing"></i>
                    </a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item nav-profile">
                    <a href="#" class="nav-link">
                        <div class="nav-profile-image">
                            <img src="../../images/faces/face1.jpg" alt="profile">
                            <span class="login-status online"></span> <!--change to offline or busy as needed-->
                        </div>
                        <div class="nav-profile-text d-flex flex-column">
                            <!--userid-->
                            <span class="font-weight-bold mb-2"><%=session.getAttribute("userid").toString()%></span>
                            <!--权限-->
                            <span class="text-secondary text-small">
                <%
                    boolean status = true;
                    if(session.getAttribute("authority").toString().equals("su"))
                    {
                %>
                <c:out value="管理员"></c:out>
                <%
                }
                else{
                    status=false;
                %>
                <c:out value="普通用户"></c:out>
                <%
                    }
                %>
              </span>
                        </div>
                        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                    </a>
                </li>
                    <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/AllUserServlet">
                        <span class="menu-title">用户管理</span>
                        <i class="mdi mdi-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"  href="../admin/ALLApplyuserServlet" >
                        <span class="menu-title">申请管理</span>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../allCanAccept/allStaffServlet">
                        <span class="menu-title">员工管理</span>
                        <i class="mdi mdi-account-multiple menu-icon"></i>
                    </a>
                </li>
                    <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/AllClothiingServlet">
                        <span class="menu-title">衣服管理</span>
                        <i class="mdi mdi-hanger menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="AllDepotServlet">
                        <span class="menu-title">仓库管理</span>
                        <i class="mdi mdi-tshirt-crew menu-icon"></i>
                    </a>
                </li>
                    <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/AllFlowsheetServlet">
                        <span class="menu-title">流水单查看</span>
                        <i class="mdi mdi-table-large menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/allSalesServlet" >
                        <span class="menu-title">销售</span>
                        <i class="mdi mdi-cart menu-icon"></i>
                    </a>
                </li>
                    <%
                    }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="salesServlet" >
                        <span class="menu-title">销售</span>
                        <i class="mdi mdi-cart menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                    %>
                <li class="nav-item">
                    <a class="nav-link" href="checkAllSalesServlet" >
                        <span class="menu-title">营业统计</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>

                <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/countsuServlet" >
                        <span class="menu-title">数据统计</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>
                    <%
                    }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="countpuServlet" >
                        <span class="menu-title">数据统计</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                %>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">

                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form name="date" action="searchSalesServlet" accept-charset="GB18030">
                                    <select name="year" onchange="selectYear(this.value)">
                                        <option value="">选择 年</option>
                                    </select>
                                    <select name="month" onchange="selectMonth(this.value)">
                                        <option value="">选择 月</option>
                                    </select>
                                    <select name="day">
                                        <option value="">选择 日</option>
                                    </select>
                                    <label style="height: 25px"></label>
                                    <label>员工id</label>
                                    <input type="text" name="staffidF" id="staffidF"
                                           style="border-top-right-radius: 5px;
                                           border-top-left-radius: 5px;
                                           border-bottom-right-radius:5px;
                                           border-bottom-left-radius:5px;" ><br>
                                    <button type="submit" class="btn btn-outline-success btn-sm">确定</button>

                                </form>
                                <div style="height:20px; "></div>
                                <table class="table table-bordered" border="5">
                                    <tr class="table-info"><td>流水单号</td><td>衣服id</td><td>件数</td><td>折后价</td><td>员工id</td><td>所属店铺</td></tr>
                                    <%
                                        float sumprice=0;
                                        if(session.getAttribute("authority")!=null){

                                            Vector<SalesDTO> v= (Vector<SalesDTO>)session.getAttribute("AllSalesD");
                                            System.out.println(v.size());
                                            Iterator<SalesDTO> it=v.iterator();
                                            SalesDTO u=new SalesDTO();
                                            while (it.hasNext())
                                            {
                                                u=it.next();
                                    %>
                                    <tr class="table-danger">
                                        <td><%=u.getFlowid()%></td>
                                        <td><%=u.getClothingid()%></td>
                                        <td><%=u.getNumbers()%></td>
                                        <td><%=u.getDisprice()%></td><%sumprice+=u.getDisprice();%>
                                        <td><%=u.getStaffid()%></td>
                                        <td><%=u.getUserid()%></td>

                                    </tr>

                                    <%
                                            }}
                                    %>
                                    <tr class="table-info"><td>总金额</td><td></td><td></td><td></td><td></td><td><fmt:formatNumber value="<%=sumprice%>" type="number" maxFractionDigits="2"/></td></tr>
                                </table>


                            </div>


                        </div>

                    </div>

                </div>

            </div>


            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
          <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">
            Copyright © 2018 <a href="#" target="_blank">Bootstrap Dash</a> MMST </span>

                </div>
            </footer>
            <!-- partial -->
        </div>

        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../vendors/js/vendor.bundle.addons.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="../../js/off-canvas.js"></script>
<script src="../../js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<!-- End custom js for this page-->
</body>

</html>
