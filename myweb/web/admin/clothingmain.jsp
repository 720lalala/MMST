<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/18
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=GB18030" language="java" import="cn.edu.lingnan.servlet.*" pageEncoding="GB18030"%>
<%@ page import="cn.edu.lingnan.dto.ClothingDTO" %>
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
            position: fixed; top: 20%;
            left: 35%; width: 35%;
            height:70%;
            border: 16px solid #bfdef7;
            background-color: #a8b2b9;
            z-index:1002;
            padding: 0;
        }


    </style>
    <script>
        function one(clothingid) {
            console.log(clothingid);
            document.getElementById("clothingidFF").value=clothingid;
            formF.clothingidFF.readOnly=true;
            document.getElementById('light').style.display='block';


        }

        function two(){
            document.getElementById('Insertdiv').style.display='none';

        }

        function three() {
            document.getElementById("light").style.display='none';
        }

        function four() {
            document.getElementById('Insertdiv').style.display='block';
        }
        function check() {

            var regml=/^(\w){6,20}$/;
            var regm=/[0-9]+$/;


            if(formF.propertyFF.value==""){
                alert("属性还没有选择...");
                formF.propertyFF.focus();
                return false;
            }
            if(formF.priceFF.value=="")
            {
                alert("价格为空...");
                formF.priceFF.focus();
                return false;
            }
            if((formF.priceFF.value.length>4)||(!formF.priceFF.value.match(regm)))
            {
                alert("价格不能大于10000");
                formF.priceFF.focus();
                return false;
            }
            if (formF.discountFF.value == "") {
                alert("折扣为空...");
                formF.discountFF.focus();
                return false;
            }
            if (parseFloat(formF.discountFF.value) < 0 || parseFloat(formF.discountFF.value) > 1||(!formF.discountFF.value.match(regm))) {
                alert("折扣设置错误...");
                formF.discountFF.focus();
                return false;
            }
            return true;




        }
        function check2() {

            var regml=/^(\w){6,20}$/;
            var regm=/[0-9]+$/;

            if(formInsert.startF.value==""){
                alert("生产日期为空...");
                formInsert.startF.focus();
                return false;
            }
            if((formInsert.startF.value.length!=6)||(!formInsert.startF.value.match(regm))){
                alert("生产日期为六个数字...");
                formInsert.startF.focus();
                return false;
            }
            if(formInsert.bianhaoF.value==""){
                alert("编号为空...");
                formInsert.bianhaoF.focus();
                return false;
            }
            if((formInsert.bianhaoF.value.length!=4)||(!formInsert.bianhaoF.value.match(regm))){
                alert("编号为四个数字...");
                formInsert.bianhaoF.focus();
                return false;
            }
            if(formInsert.propertyF.value==""){
                alert("属性还没有选择...");
                formInsert.colorF.focus();
                return false;
            }
            if(formInsert.colorF.value==""){
                alert("颜色还没有选择...");
                formInsert.colorF.focus();
                return false;
            }
            if(formInsert.sizeF.value==""){
                alert("尺寸还没有选择...");
                formInsert.sizeF.focus();
                return false;
            }
            if(formInsert.priceF.value=="")
            {
                alert("价格为空...");
                formInsert.priceF.focus();
                return false;
            }
            if((formInsert.priceF.value.length>4)||(!formInsert.priceF.value.match(regm)))
            {
                alert("价格不能大于10000");
                formInsert.priceF.focus();
                return false;
            }
            if (formInsert.discountF.value == "") {
                alert("折扣为空...");
                formInsert.discountF.focus();
                return false;
            }
            if (parseFloat(formInsert.discountF.value) < 0 || parseFloat(formInsert.discountF.value) > 1||(!formInsert.discountF.value.match(regm))) {
                alert("折扣设置错误...");
                formInsert.discountF.focus();
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
                <li class="nav-item">
                    <a class="nav-link" href="AllUserServlet">
                        <span class="menu-title">用户管理</span>
                        <i class="mdi mdi-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"  href="ALLApplyuserServlet" >
                        <span class="menu-title">申请管理</span>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../allCanAccept/allStaffServlet">
                        <span class="menu-title">员工管理</span>
                        <i class="mdi mdi-account-multiple menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AllClothiingServlet">
                        <span class="menu-title">衣服管理</span>
                        <i class="mdi mdi-hanger menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../allCanAccept/AllDepotServlet">
                        <span class="menu-title">仓库管理</span>
                        <i class="mdi mdi-tshirt-crew menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AllFlowsheetServlet">
                        <span class="menu-title">流水单查看</span>
                        <i class="mdi mdi-table-large menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="allSalesServlet" >
                        <span class="menu-title">销售</span>
                        <i class="mdi mdi-cart menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../allCanAccept/checkAllSalesServlet" >
                        <span class="menu-title">营业统计</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="countsuServlet" >
                        <span class="menu-title">数据统计</span>
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
                        衣服管理
                    </h3>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form accept-charset="GB18030" name="formS" action="searchClothingServlet" method="get">
                                    <label>寻找</label>
                                    <input type="text" style="border-top-right-radius: 5px;border-top-left-radius: 5px;
          border-bottom-right-radius:5px;
          border-bottom-left-radius:5px;" id="SearchTemp" name="SearchTemp">
                                    <button type="submit" class="btn btn-outline-success btn-sm">确定</button>
                                    <label style="width:10px;">     </label>
                                    <button type="button" class="btn btn-inverse-success btn-sm"><a href="AllClothiingServlet">全部寻找</a></button>
                                    <div style="float:right">
                                        <input type="button" onclick="four()" class="btn btn-gradient-success btn-sm" value="添加衣服"/>
                                    </div>
                                </form>
                                <div style="height:20px; "></div>
                                <table class="table table-bordered" border="5">
                                    <tr class="table-info" ><td>衣服id</td><td>属性</td><td>颜色</td><td>码数</td><td>价钱</td><td>折扣</td><td>操作</td></tr>
                                    <%
                                        if(session.getAttribute("authority")!=null){

                                            Vector<ClothingDTO> v= (Vector<ClothingDTO>)session.getAttribute("AllClothing");
                                            System.out.println(v.size());
                                            Iterator<ClothingDTO> it=v.iterator();
                                            ClothingDTO u=new ClothingDTO();
                                            while (it.hasNext())
                                            {
                                                u=it.next();
                                    %>
                                    <tr class="table-danger">
                                        <td><%=u.getClothingid()%></td>
                                        <td><%=u.getProperty()%></td>
                                        <td><%=u.getColor()%></td>
                                        <td><%=u.getSize()%></td>
                                        <td><%=u.getPrice()%></td>
                                        <td><%=u.getDiscount()%></td>
                                        <td style="width: 204px;" >
                                            <input type="button"  class="btn btn-outline-primary btn-sm" onclick='one("<%=u.getClothingid()%>") 'value="修改">
                                            <a href="javascript:void(0)"  ></a>
                                            </input>
                                            <label style="width: 10px;"></label>
                                            <button class="btn btn-outline-dark  btn-sm">
                                                <a href="deleteClothingServlet?clothingid=<%=u.getClothingid()%>">删除</a>
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
            Copyright © 2018 <a href="#" target="_blank">Bootstrap Dash</a> MMST </span>

                </div>
            </footer>
            <!-- partial -->
        </div>

        <!-- main-panel ends -->
    </div>


    <div id="Insertdiv" class="white_content">
        <div class="card-body">
            <form class="forms-sample" accept-charset="GB18030" name="formInsert" action="insertClothingServlet" method="post">
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="startF">生产日期</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="startF" name="startF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="bianhaoF">编号</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="bianhaoF" name="bianhaoF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="propertyF">属性</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="propertyF" name="propertyF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="colorF">颜色</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" list="itemlist" type="label" id="colorF" name="colorF"  />
                    <datalist id="itemlist">
                        <option>011:红色</option>
                        <option>012:橙色</option>
                        <option>013:灰色</option>
                        <option>014:花色</option>
                        <option>015:绿色</option>
                        <option>016:蓝色</option>
                        <option>017:黄色</option>
                        <option>999:其他</option>
                    </datalist>
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="sizeFF">尺寸</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" list="sizeFF" type="label" id="sizeF" name="sizeF"  />
                    <datalist id="sizeFF">
                        <option>01:XS</option>
                        <option>02:S</option>
                        <option>03:M</option>
                        <option>04:L</option>
                        <option>05:XL</option>
                        <option>06:XXL</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        <option>13</option>
                        <option>14</option>
                        <option>15</option>
                        <option>16</option>
                        <option>17</option>
                    </datalist>
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="priceF">价格</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="priceF" name="priceF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="discountF">折扣</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="discountF" name="discountF"  />
                </div>
                <div style="height: 10px;"></div>
                <div class="form-group" style="margin-top:5px; margin-bottom: 5px;"  align="center">
                    <input type="submit" class="btn btn-gradient-primary btn-icon-text btn-sm" onclick="return check2();" value="确定">
                    <label style="width: 30px;"></label>
                    <input type="button" class="btn btn-gradient-dark btn-icon-text btn-sm" onclick="two()" value="取消">
                </div>

            </form>
        </div>
    </div>

    <div id="light" class="white_content" style="height:50%;">
        <div class="card-body">
            <form class="forms-sample" accept-charset="GB18030" name="formF" action="modifyClothingServlet" method="post">
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="clothingidFF">衣服id</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="clothingidFF" name="clothingidFF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="propertyFF">属性</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="propertyFF" name="propertyFF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="priceFF">价格</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="priceFF" name="priceFF"  />
                </div>
                <div class="form-group" style="margin-bottom: 0px;">
                    <label for="discountFF">折扣</label>
                    <input style="padding-top: 5px;padding-bottom: 5px;" class="form-control" type="label" id="discountFF" name="discountFF"  />
                </div>
                <div style="height: 10px;"></div>
                <div class="form-group" style="margin-top:5px; margin-bottom: 5px;"  align="center">
                    <input type="submit" class="btn btn-gradient-primary btn-icon-text btn-sm" onclick="return check();" value="确定">
                    <label style="width: 30px;"></label>
                    <input type="button" class="btn btn-gradient-dark btn-icon-text btn-sm" onclick="three()" value="取消">
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
