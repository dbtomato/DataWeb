<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>
    <link href="<%=request.getContextPath()%>/scripts/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>


 <div class="container">

<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-4">
      <form class="form-signin" role="form" action="login.do" method="post">
        <h2 class="form-signin-heading">登陆</h2>
        <input type="text" class="form-control" placeholder="用户名" name="userName" required="" autofocus="">
        <input type="password" class="form-control" placeholder="密码" name="password" required="">
        <div class="checkbox">
          <label>

            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

  </div> <!-- col-md-4 -->
  <div class="col-md-4"></div>

</div>

</div> <!-- /container -->

    <script src="<%=request.getContextPath()%>/scripts/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
  </body>
</html>
