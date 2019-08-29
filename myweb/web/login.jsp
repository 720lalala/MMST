<%@ page contentType="text/html;charset=GB18030" language="java"  %>
<%@ taglib prefix="aa" uri="http://lingnan.edu.cn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<title>MMST</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript">
        function check() {
            var regm=/[0-9]+$/;

            if(form.userid.value.value="")
            {
                alert("用户id不能为空...");
                form.userid.focus();
                return false;
            }
            if(form.optionsRadios.value=="")
            {
                alert("权限选择不能为空")
                return false;
            }
            if(form.password.value==""){
                alert("密码不能为空...");
                form.password.focus();
                return false;
            }
        }
	</script>
</head>
<body class="templatemo-bg-gray" style="background:url(images/background1.jpg) no-repeat center;background-size:100% 100%;" >
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">MMST</h1>
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="loginServlet" method="get" name="form">
		        <div class="form-group">
		          <div class="col-xs-12">		            
		            <div class="control-wrapper">
		            	<label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
		            	<input type="text" class="form-control" name="userid" id="username" placeholder="用户id">
		            </div>		            	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            	<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
		            	<input type="password" class="form-control" name="password" id="password" placeholder="密码">
		            </div>
		          </div>
		        </div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<label class="radio-inline" style="text-align: center">
								<input type="radio" name="optionsRadios" id="optionsRadios1" value="pu"> <aa:puUser/>
							</label>
							<label class="radio-inline">
								<input type="radio" name="optionsRadios" id="optionsRadios2" value="su"><aa:suUser/>
							</label>
						</div>
					</div>
				</div>
		        <div class="form-group">
		          <div class="col-md-12">
	             	<div class="checkbox control-wrapper">
	                	<label>
	                  		<input type="checkbox"><aa:hello/>
                		</label>
	              	</div>
		          </div>
		        </div>

		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		          		<input type="submit" value="登录" class="btn btn-info" onclick="return check();">

		          	</div>
		          </div>
		        </div>
		        <hr>

		      </form>
		      <div class="text-center">
		      	<a href="register.jsp" class="templatemo-create-new">申请账户 <i class="fa fa-arrow-circle-o-right"></i></a>
		      </div>
		</div>
	</div>
</body>
</html>