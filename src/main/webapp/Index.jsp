<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcom</title>


    <style><%@include file="webjars/bootstrap/4.0.0/css/bootstrap.min.css"%></style>
    <script><%@include file="webjars/jquery/3.6.0/jquery.min.js"%></script>



    <script>
        function BookPage()
        {
            window.location = '/pages/book';
        }

        $(document).ready(function () {
            clearInput();
            grid();
        });

        function save()
        {

            var id = $('#id').val();
            var name = $('#fname').val();
            var family = $('#lname').val();
            const allStudents = {"id":id,"name":name,"family":family};
            $.ajax({
                url:  '/rest/save/',
                type: 'POST',
                data: JSON.stringify(allStudents),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json'
            });
            clearTbl();
            grid();

        }
        function grid(){
            clearTbl();
            $.ajax({
                url:  '/rest/grid/',
                type: 'GET',
                data: JSON.stringify(),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success:function (data){

                    clearInput();
                    for (i = 0; i < data.length; i++) {
                        myFunction(data[i].id,data[i].name,data[i].family,data.length);
                    }


                }
            });

            function myFunction(id,name,family) {
                var table = document.getElementById("tbody");
                var row = table.insertRow(0);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                cell1.innerHTML = id;
                cell2.innerHTML = name;
                cell3.innerHTML = family;
                cell4.innerHTML = '<button value='+id+' onclick="deleteById(value)">DELETE</button>';
                cell5.innerHTML = '<button value='+id+' onclick="updateById(value)">UPDATE</button>';

            }

        }
        function clearTbl()
        {
            $("#tbody tr").remove();
        }
        function clearInput()
        {
            $("#id").val('');
            $("#fname").val('');
            $("#lname").val('');
        }
        function deleteById(id)
        {

            $.ajax({
                url:  '/rest/deleteById/' + id,
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',

            });
            clearTbl();
            grid();

        }
        function updateById(id)
        {
            console.log("yes");

            $.ajax({
                url:  '/rest/updateById/'+id,
                type: 'GET',
                data: JSON.stringify(),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success:function (data){
                        $('#id').val(data.id);
                        $('#fname').val(data.name);
                        $('#lname').val(data.family);


                }
            });


        }
      function hey()
      {
          console.log("hey");
      }
        function repet()
        {
            for (i = 0;i<5;i++){
                // var btn = document.createElement("BUTTON");
                var btn = document.createElement("BUTTON");
                btn.onclick = function hh(){
                   hey();
                };
                btn.innerText = "hello";
                btn.style.height="40px";
                btn.className="btn btn-info";
                document.getElementById("auto").appendChild(btn);

            }


        }
        function combo()
        {
            for (i = 0;i<5;i++)
            {
                var cmbo = document.createElement("option");
                cmbo.innerText = "bmw";
                document.getElementById("cars").appendChild(cmbo);

            }
        }

    </script>
</head>
<body>
<div class="container">
<div style="margin: auto;text-align: center;"><button onclick="BookPage();">Book</button></div>
<input type="text" id="id" disabled>
<input type="text" id="fname">
<input type="text" id="lname">

<button class="aaa" style="cursor: pointer" onclick="save();">s.a.v.e</button>
<button style="cursor: pointer"  onclick="clearTbl();">clear grid</button>
<button class="aaa" style="cursor: pointer"  onclick="clearInput();">clear Input</button>
<button class="aaa" style="cursor: pointer"  onclick="aer();">cleasadasdsadsadr Input</button>
<button style="cursor: pointer" onclick="grid();">grid</button>
    <button onclick="repet();">
        Reapet
    </button>
    <button onclick="combo();">
        fill combo
    </button>
    <div id="auto"></div>
    <select id="cars">

    </select>
<table class="table table-hover">
    <thead>
    <tr>
        <td>id</td>
        <td>name</td>
        <td>family</td>
        <td>action</td>
    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>
</div>

</body>
</html>
