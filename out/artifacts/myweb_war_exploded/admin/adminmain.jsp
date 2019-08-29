<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=GB18030" language="java" import="cn.edu.lingnan.servlet.*" pageEncoding="GB18030"%>
<%@ page import="cn.edu.lingnan.dto.UserDTO" %>
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
    .white_content { display: none;position: fixed; top: 25%; left: 35%; width: 40%; height: 50%; padding: 16px; border: 16px solid #bfdef7; background-color: #a8b2b9; z-index:1002; overflow: auto; }

  </style>
  <script>

      function one(userid,username,password){
          console.log(userid);
          document.getElementById("useridL").value=userid;
          document.getElementById("usernameF").value=username;
          document.getElementById("passwordF").value=password;
          document.getElementById('light').style.display='block';
      }

      function two(){
          document.getElementById('light').style.display='none';
          document.getElementById('Insertdiv').style.display='none';
          document.getElementById('fade').style.display='none'

      }
      function check() {
          Console.log(form1.usernameF.toString())
          var regml=/^(\w){6,20}$/;
          var regm=/[0-9]+$/;

          if(form1.usernameF.value==""){
              alert("�û���Ϊ��...");
              form1.usernameF.focus();
              return false;
          }
          if(form1.usernameF.value.length>10)
          {
              console.log(form1.usernameF.value.length);
              alert("�û������ܳ���10���ַ�...");
              form1.usernameF.focus();
              return false;
          }

          if(form1.passwordF.value==""){
              alert("���벻��Ϊ��...");
              form1.passwordF.focus();
              return false;
          }

          if(!form1.passwordF.value.match(regml))
          {
              alert("����ֻ������6-20����ĸ�����֡��»���");
              form1.passwordF.value="";
              form1.passwordF.focus();
              return false;
          }

      }
      function three(userid) {
          var massage=confirm("ȷ��ɾ����")
          if(massage)
          {
              document.getElementById("useridDelete").value=userid;
              formD.submit();

          }

      }
      function four() {
          document.getElementById('Insertdiv').style.display='block';
      }
      function check2() {

          var regml=/^(\w){6,20}$/;
          var regm=/[0-9]+$/;

          if(formInsert.usernameI.value==""){
              alert("�û���Ϊ��...");
              formInsert.usernameI.focus();
              return false;
          }
          if(formInsert.usernameI.value.length>10)
          {
              console.log(formInsert.usernameI.value.length);
              alert("�û������ܳ���10���ַ�...");
              formInsert.usernameI.focus();
              return false;
          }
          if((formInsert.useridI.value.length!=4)||(!formInsert.useridI.value.match(regm))){
              alert("�û�idΪ�ĸ�����...");
              formInsert.useridI.focus();
              return false;
          }
          if(formInsert.passwordI.value==""){
              alert("���벻��Ϊ��...");
              formInsert.passwordI.focus();
              return false;
          }

          if(!formInsert.passwordI.value.match(regml))
          {
              alert("����ֻ������6-20����ĸ�����֡��»���");
              formInsert.passwordI.value="";
              formInsert.passwordI.focus();
              return false;
          }
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
        <li class="nav-item">
          <a class="nav-link" href="AllUserServlet">
            <span class="menu-title">�û�����</span>
            <i class="mdi mdi-home menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="ALLApplyuserServlet" >
            <span class="menu-title">�������</span>
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../allCanAccept/allStaffServlet">
            <span class="menu-title">Ա������</span>
            <i class="mdi mdi-account-multiple menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AllClothiingServlet">
            <span class="menu-title">�·�����</span>
            <i class="mdi mdi-hanger menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../allCanAccept/AllDepotServlet">
            <span class="menu-title">�ֿ����</span>
            <i class="mdi mdi-tshirt-crew menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AllFlowsheetServlet">
            <span class="menu-title">��ˮ���鿴</span>
            <i class="mdi mdi-table-large menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="allSalesServlet" >
            <span class="menu-title">����</span>
            <i class="mdi mdi-cart menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../allCanAccept/checkAllSalesServlet" >
            <span class="menu-title">Ӫҵͳ��</span>
            <i class="mdi mdi-chart-bar menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="countsuServlet" >
            <span class="menu-title">����ͳ��</span>
            <i class="mdi mdi-chart-bar menu-icon"></i>
          </a>
        </li>
      </ul>
    </nav>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h3 class="page-title">
            �û�����
          </h3>
        </div>
        <div class="row">
          <div class="col-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <form accept-charset="GB18030" name="formS" action="searchUserServlet" method="get">
                  <label>Ѱ��</label>
                  <input type="text" style="border-top-right-radius: 5px;border-top-left-radius: 5px;
          border-bottom-right-radius:5px;
          border-bottom-left-radius:5px;" id="SearchTemp" name="SearchTemp">
                  <button type="submit" class="btn btn-outline-success btn-sm">ȷ��</button>
                  <label style="width:10px;">     </label>
                  <button type="button" class="btn btn-inverse-success btn-sm"><a href="AllUserServlet">ȫ��Ѱ��</a></button>
                  <div style="float:right">
                    <input type="button" onclick="four()" class="btn btn-gradient-success btn-sm" value="�����û�"/>
                  </div>
                </form>
                <div style="height:20px; "></div>
                <table class="table table-bordered" border="5">
                  <tr class="table-info"><td>���</td><td>����</td><td>����</td><td>����</td></tr>
                  <%
                    if(session.getAttribute("authority")!=null){

                      Vector<UserDTO> v= (Vector<UserDTO>)session.getAttribute("AllUser");
                      System.out.println(v.size());
                      Iterator<UserDTO> it=v.iterator();
                      UserDTO u=new UserDTO();
                      while (it.hasNext())
                      {
                        u=it.next();
                  %>
                  <tr class="table-danger">
                    <td><%=u.getUserid()%></td><td><%=u.getUsername()%></td>
                    <td><%=u.getPassword()%></td>
                    <td style="width: 204px;" >
                      <input type="button"  class="btn btn-outline-primary btn-sm" onclick='one("<%=u.getUserid()%>","<%=u.getUsername()%>","<%=u.getPassword()%>") 'value="�޸�">
                        <a href="javascript:void(0)"  ></a>
                      </input>
                      <label style="width: 10px;"></label>
                      <button class="btn btn-outline-dark  btn-sm">
                        <a href="javascript:void(0)" onclick='three("<%=u.getUserid()%>") '>ɾ��</a>

                      </button>
                    </td>
                  </tr>
                  <%
                      }}
                  %>
                </table>

                </div>


                <form name="formD" action="deleteUserServlet">
                  <input type="hidden" id="useridDelete" name="useridDelete">
                </form>

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
      <form class="forms-sample" accept-charset="GB18030" name="form1" action="modifyUserServlet" method="post">
        <div class="form-group" style="margin-bottom: 0px;">
          <label for="useridL">�û�id</label>
          <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="useridL"  readonly="readonly" name="useridL"  />
        </div>
        <div class="form-group" style="margin-top:5px; margin-bottom: 5px;">
          <label for="usernameF">�û���</label>
          <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="usernameF" name="usernameF"  />
        </div>
        <div class="form-group" style="margin-top:5px; margin-bottom: 5px;">
          <label for="passwordF">����</label>
          <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="passwordF" name="passwordF"  />
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
      <form class="forms-sample" accept-charset="GB18030" name="formInsert" action="insertUserServlet" method="post">
        <div class="form-group" style="margin-bottom: 0px;">
          <label for="useridI">�û�id</label>
          <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="useridI" name="useridI"  />
        </div>
        <div class="form-group" style="margin-top:5px; margin-bottom: 5px;">
          <label for="usernameI">�û���</label>
          <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="usernameI" name="usernameI"  />
        </div>
        <div class="form-group" style="margin-top:5px; margin-bottom: 5px;">
           <label for="passwordI">����</label>
          <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="passwordI" name="passwordI"  />
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
  <div id="fade" class="black_overlay">

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