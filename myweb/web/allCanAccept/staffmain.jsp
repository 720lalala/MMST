<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/16
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<html lang="en">
<%@ page contentType="text/html;charset=GB18030" language="java" import="cn.edu.lingnan.servlet.*" pageEncoding="GB18030"%>
<%@ page import="cn.edu.lingnan.dto.StaffDTO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        function one(userid,staffid,staffname){
            document.getElementById("useridF").value=userid;
            var authority="<%=session.getAttribute("authority")%>";
            form1.useridF.readOnly=true;
            form1.staffidF.readOnly=true;
            document.getElementById("staffidF").value=staffid;
            document.getElementById("staffnameF").value=staffname;
            document.getElementById('light').style.display='block';

        }
        function two(){
            document.getElementById('light').style.display='none';
            document.getElementById('Insertdiv').style.display='none';

        }
        function four() {
            var userid="<%=session.getAttribute("userid")%>";
            var authority="<%=session.getAttribute("authority")%>";
            if(authority=="pu")
            {
                formInsert.useridI.value=userid;
                formInsert.useridI.readOnly=true;

            }

            document.getElementById('Insertdiv').style.display='block';
        }
        function check() {
            Console.log(form1.usernameF.toString())
            var regml=/^(\w){6,20}$/;
            var regm=/[0-9]+$/;

            if(form1.staffnameF.value==""){
                alert("Ա����Ϊ��...");
                form1.staffnameF.focus();
                return false;
            }
            if(form1.staffnameF.value.length>10)
            {
                console.log(form1.staffnameF.value.length);
                alert("Ա�������ܳ���10���ַ�...");
                form1.staffnameF.focus();
                return false;
            }
            if(form1.useridF.value==""){
                alert("��������id����Ϊ��...");
                form1.useridF.focus();
                return false;
            }
            if((form1.useridF.value.length!=4)||(!form1.useridF.value.match(regm))){
                alert("��������idΪ�ĸ�����...");
                form1.useridF.focus();
                return false;
            }
            return true;

        }
        function check2() {

            var regml=/^(\w){6,20}$/;
            var regm=/[0-9]+$/;
            if(formInsert.staffidI.value=="")
            {
                alert("Ա��id����Ϊ��...");
                formInsert.staffidI.focus();
                return false;
            }
            if((formInsert.staffidI.value.length!=3)||(!formInsert.staffidI.value.match(regm)))
            {
                alert("Ա��idΪ��������...");
                formInsert.staffidI.focus();
                return false;
            }
            if(formInsert.staffnameI.value==""){
                alert("Ա��������Ϊ��...");
                formInsert.staffnameI.focus();
                return false;
            }
            if(formInsert.staffnameI.value.length>10)
            {
                console.log(formInsert.staffnameI.value.length);
                alert("Ա�������ܳ���10���ַ�...");
                formInsert.staffnameI.focus();
                return false;
            }
            if(formInsert.useridI.value==""){
                alert("��������id����Ϊ��...");
                formInsert.useridI.focus();
                return false;
            }
            if((formInsert.useridI.value.length!=4)||(!formInsert.useridI.value.match(regm))){
                alert("�û�idΪ�ĸ�����...");
                formInsert.useridI.focus();
                return false;
            }
            return true;
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
                            �޸���Ϣ
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
                            <!--Ȩ��-->
                            <span class="text-secondary text-small">
                <%
                    boolean status = true;
                    if(session.getAttribute("authority").toString().equals("su"))
                    {
                %>
                <c:out value="����Ա"></c:out>
                <%
                }
                else{
                    status=false;
                %>
                <c:out value="��ͨ�û�"></c:out>
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
                        <span class="menu-title">�û�����</span>
                        <i class="mdi mdi-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"  href="../admin/ALLApplyuserServlet" >
                        <span class="menu-title">�������</span>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../allCanAccept/allStaffServlet">
                        <span class="menu-title">Ա������</span>
                        <i class="mdi mdi-account-multiple menu-icon"></i>
                    </a>
                </li>
                    <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/AllClothiingServlet">
                        <span class="menu-title">�·�����</span>
                        <i class="mdi mdi-hanger menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="AllDepotServlet">
                        <span class="menu-title">�ֿ����</span>
                        <i class="mdi mdi-tshirt-crew menu-icon"></i>
                    </a>
                </li>
                    <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/AllFlowsheetServlet">
                        <span class="menu-title">��ˮ���鿴</span>
                        <i class="mdi mdi-table-large menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/allSalesServlet" >
                        <span class="menu-title">����</span>
                        <i class="mdi mdi-cart menu-icon"></i>
                    </a>
                </li>
                    <%
                    }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="salesServlet" >
                        <span class="menu-title">����</span>
                        <i class="mdi mdi-cart menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                    %>
                <li class="nav-item">
                    <a class="nav-link" href="checkAllSalesServlet" >
                        <span class="menu-title">Ӫҵͳ��</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>

                    <%
                    if(status){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../admin/countsuServlet" >
                        <span class="menu-title">����ͳ��</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>
                    <%
                    }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="countpuServlet" >
                        <span class="menu-title">����ͳ��</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>
                    <%
                    }
                %>
        </nav>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title">
                        Ա������
                    </h3>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form accept-charset="GB18030" name="formS" action="searchStaffServlet" method="get">
                                    <label>Ѱ��</label>
                                    <input type="text" style="border-top-right-radius: 5px;border-top-left-radius: 5px;
                                        border-bottom-right-radius:5px;
                                        border-bottom-left-radius:5px;"
                                           id="SearchTemp"   name="SearchTemp">
                                    <input type="submit" class="btn btn-outline-success btn-sm" value="ȷ��">
                                    <label style="width:10px;">     </label>
                                    <button type="button" class="btn btn-inverse-success btn-sm">
                                        <a  href="allStaffServlet">ȫ��Ѱ��</a>
                                    </button>
                                    <div style="float:right">
                                        <input type="button" onclick="four()" class="btn btn-gradient-success btn-sm" value="���Ա��"/>
                                    </div>
                                </form>

                                <div style="height:20px; "></div>
                                <table class="table table-bordered" border="5">
                                    <tr class="table-info"><td>���</td><td>����</td><td>��������</td><td>����</td></tr>
                                    <%
                                        if(session.getAttribute("authority")!=null){

                                            Vector<StaffDTO> v= (Vector<StaffDTO>)session.getAttribute("Allstaff");
                                            System.out.println(v.size());
                                            Iterator<StaffDTO> it=v.iterator();
                                            StaffDTO u=new StaffDTO();
                                            while (it.hasNext())
                                            {
                                                u=it.next();
                                    %>
                                    <tr class="table-danger">
                                        <td><%=u.getStaffid().substring(4)%></td><td><%=u.getStaffname()%></td>
                                        <td><%=u.getUserid()%></td>
                                        <td style="width: 204px;" >
                                            <input type="button"  class="btn btn-outline-primary btn-sm" onclick='one("<%=u.getUserid()%>","<%=u.getStaffid().substring(4)%>","<%=u.getStaffname()%>") 'value="�޸�">
                                            <a href="javascript:void(0)"  ></a>
                                            </input>
                                            <label style="width: 10px;"></label>
                                            <button class="btn btn-outline-dark  btn-sm">
                                                <a href="deleteStaffServlet?staffid=<%=u.getStaffid()%>">ɾ��</a>
                                            </button>
                                        </td>
                                    </tr>
                                    <%
                                            }}
                                    %>
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
            Copyright �0�8 2018 <a href="#" target="_blank">Bootstrap Dash</a> MMST </span>

                </div>
            </footer>
            <!-- partial -->
        </div>

        <!-- main-panel ends -->
    </div>
    <div id="light" class="white_content">
        <div class="card-body">
            <form class="forms-sample" accept-charset="GB18030" name="form1" action="modifyStaffServlet" method="post">
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="staffidF">Ա��id</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="staffidF"  readonly="readonly" name="staffidF"  />
                </div>
                <div class="form-group" style="margin-top:5px; margin-bottom: 5px;">
                    <label for="staffnameF">Ա����</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="staffnameF" name="staffnameF"  />
                </div>
                <div class="form-group" style="margin-top:5px; margin-bottom: 5px;">
                    <label for="useridF">��������id</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="useridF" name="useridF"  />
                </div>
                <div style="height: 10px;"></div>
                <div class="form-group" style="margin-top:5px; margin-bottom: 5px;"  align="center">
                    <input type="submit" class="btn btn-gradient-primary btn-icon-text btn-sm" onclick="return check();" value="ȷ��">
                    <label style="width: 30px;"></label>
                    <input type="button" class="btn btn-gradient-dark btn-icon-text btn-sm" onclick="two()" value="ȡ��">
                </div>

            </form>
        </div>
    </div>

    <div id="Insertdiv" class="white_content">
        <div class="card-body">
            <form class="forms-sample" accept-charset="GB18030" name="formInsert" action="insertStaffServlet" method="post">
                <div class="form-group" style="margin-bottom: 0px;">
                    <div class="form-group" style="margin-bottom: 0px;">
                        <label for="staffidI">Ա��id</label>
                        <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="staffidI" name="staffidI"  />
                    </div>
                    <div class="form-group" style="margin-bottom: 0px;">
                        <label for="staffnameI">Ա����</label>
                        <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="staffnameI" name="staffnameI"  />
                    </div>
                    <div class="form-group" style="margin-bottom: 0px;">
                        <label for="useridI">��������</label>
                        <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="useridI" name="useridI"  />
                    </div>
                 </div>
                <div style="height: 10px;"></div>
                <div class="form-group" style="margin-top:5px; margin-bottom: 5px;"  align="center">
                    <input type="submit" class="btn btn-gradient-primary btn-icon-text btn-sm" onclick="return check2();" value="ȷ��">
                    <label style="width: 30px;"></label>
                    <input type="button" class="btn btn-gradient-dark btn-icon-text btn-sm" onclick="two()" value="ȡ��">
                </div>
            </form>
        </div>
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
