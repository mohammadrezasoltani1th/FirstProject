<%--
  Created by IntelliJ IDEA.
  User: MohammadReza
  Date: 4/14/2022
  Time: 5:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload File To Java</title>
    <style><%@include file="webjars/bootstrap/4.0.0/css/bootstrap.min.css"%></style>
    <script><%@include file="webjars/jquery/3.6.0/jquery.min.js"%></script>
    <script>
        function getFile()
        {
           var a = $('#formFileSm').val();
            console.log(a);
        }
    </script>
</head>
<body>
<jsp:include page="Header.jsp"/>
<label for="formFileSm" class="form-label">Small file input example</label>
<input class="form-control form-control-sm" id="formFileSm" type="file" />
<button onclick="getFile()">send</button>
</body>
</html>
