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
        $(document).ready(function () {
            grid();
        });

        function fillFile(){
            var file = $("#file-input").val();
            var dl =  $("#filelink");
            var text = $("#txt");
            text.val(file);
            dl.attr("download",file);
            console.log(dl.attr("href"));

        }

        function saveFile(){
            // console.log($('#txt').val());
            var nfile =  $('#txt').val();
            const saveFiles = {"nfile":nfile};
            console.log(nfile);
            $.ajax({
                url: '/rest/savefile',
                type: 'POST',
                data: JSON.stringify(saveFiles),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json'
            });
        }
        function grid(){

            $.ajax({
                url:  '/rest/gridFile/',
                type: 'GET',
                data: JSON.stringify(),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success:function (data){

                    for (i = 0; i < data.length; i++) {
                        myFunction(data[i].id,data[i].nfile);

                    }


                }
            });

        }
        function myFunction(id,name) {
            var table = document.getElementById("tbody");
            var row = table.insertRow(0);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            cell1.innerHTML = id;
            cell2.innerHTML = name;
            cell3.innerHTML = '<button class="btn btn-success" value='+id+' onclick="updateById(value)">Download</button>';

        }

    </script>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="container">
    <input id="file-input" type="file" name="name" />
    <br>
    <button onclick="choosFile();">fillll it</button>
    <br>
    <a onclick="fillFile();" href="" id="filelink" download="">DownloadFile</a>
    <input id="txt" type="text">
    <button class="btn-danger" onclick="saveFile()">save</button>
    <table class="table table-bordered table-striped table-hover">
        <thead>
        <tr>
            <td>Row</td>
            <td>fileName</td>
            <td>Action</td>

        </tr>
        </thead>
        <tbody id="tbody">

        </tbody>
    </table>
</div>
</body>
</html>
