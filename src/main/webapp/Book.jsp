<%--
  Created by IntelliJ IDEA.
  User: winph
  Date: 8/7/2021
  Time: 4:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book</title>
    <style><%@include file="webjars/bootstrap/4.0.0/css/bootstrap.min.css"%></style>
    <script><%@include file="webjars/jquery/3.6.0/jquery.min.js"%></script>
    <script>
        $(document).ready(function () {
            grid()
        });
        function grid() {

            $.ajax({
                url: '/rest/grid/',
                type: 'GET',
                data: JSON.stringify(),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {


                    for (i = 0; i < data.length; i++) {
                        // myFunction(data[i].id, data[i].name, data[i].family, data.length);
                        var id = data[i].id;
                        var name = data[i].name;
                        var family =  data[i].family;
                        // showGrid(id,name,family);
                        combo(name);

                    }



                }
            });
        }
        function showGrid(id,name,family){
            console.log(id,name,family);
            combo("show grid       "+name);
        }
        function combo(name)
        {
            console.log("combo       "+name);
            var option = document.createElement("option");
            option.innerHTML = name;
            document.getElementById("combo").appendChild(option);
        }
    </script>
</head>
<body>
<button onclick="grid();">Grid</button>
<button onclick="combo(name)">Combo</button>
<select id="combo">

</select>
</body>
</html>
