<%--
  Created by IntelliJ IDEA.
  User: winph
  Date: 8/7/2021
  Time: 4:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>--%>

<html>
<head>
    <title>Test Code</title>

    <style><%@include file="webjars/bootstrap/4.0.0/css/bootstrap.min.css"%></style>
    <script><%@include file="webjars/jquery/3.6.0/jquery.min.js"%></script>
    <script>
        // $('#button').on('click', function() {
        //     $('#file-input').trigger('click');
        // });
        // var file = $("#file-input").val();
        // if (file != null || file != ""){
        //     fillFile();
        // }

        function fillFile(){
            var file = $("#file-input").val();
            var dl =  $("#filelink");
            var text = $("#txt");
            text.val(file);
            dl.attr("download",file);
            console.log(dl.attr("href"));

        }

    </script>
</head>
<body>
<div class="container-fluid">
<%--    <button id="button" onclick="choosFile();">Open</button>--%>
    <input id="file-input" type="file" name="name" />
    <br>
    <button onclick="choosFile();">fill it</button>
    <br>
    <a onclick="fillFile();" href="" id="filelink" download="">DownloadFile</a>
    <input id="txt" type="text">


</div>
</body>
</html>
