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
            // $("#alert").hide(0);
            setInterval(motherRefresh, 60000);
            clearInput();
            grid();
        });
        function motherRefresh() {
            $(document).ready(function () {
                // $("#alert").hide(0);
                clearInput();
                clearTbl();
                grid();



            });
        }

        function beforSave()
        {
            var id = $('#id').val();
            var name = $('#fname').val();
            var family = $('#lname').val();
            if (name == null || name == "" || family == null || family == "")
            {
                alert("Fill Name And Family");
            }else if (name != null || name != "" || family != null || family != "")
            {
               save(id,name,family);
               alert("Successful Saved");
            }
        }
        function save(id,name,family)
        {




            // var id = $('#id').val();
            // var name = $('#fname').val();
            // var family = $('#lname').val();
            const allStudents = {"id":id,"name":name,"family":family};
            $.ajax({
                url:  '/rest/save/',
                type: 'POST',
                data: JSON.stringify(allStudents),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json'
            });
            // $("#alert").delay(500).fadeIn(700).fadeOut(500);
            // clearTbl();
            motherRefresh();
            // clearTbl();
            // grid();


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

        }
        function myFunction(id,name,family) {
            var table = document.getElementById("tbody");
            var row = table.insertRow(0);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            // row.ondblclick = function load(){
            //     updateById(id);
            //     // console.log(id);
            //     //    combo(id);
            //
            // }
            console.log(id);
            cell1.innerHTML = id;
            cell2.innerHTML = name;
            cell3.innerHTML = family;
            cell4.innerHTML = '<button class="btn btn-danger" value='+id+' onclick="beforDelete(value)">DELETE</button>';
            cell5.innerHTML = '<button class="btn btn-success" value='+id+' onclick="updateById(value)">UPDATE</button>';
            combo(name);
            // combo(name);

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
            $("#file-input").val('');
        }
        function beforDelete(id)
        {
            if (confirm("Are You Sure ?") == true)
            {
                deleteById(id);
                alert("Deleted")
            }else {
                return false;
            }
        }
        function deleteById(id)
        {

            $.ajax({
                url:  '/rest/deleteById/' + id,
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',

            });
            motherRefresh();
            // clearTbl();
            // grid();

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
        // function combo(name)  Infiniti Loop
        // {
        //   console.log(name);
        //     for (i = 0;i<name.length;i++)
        //     {
        //         var cmbo = document.createElement("option");
        //         cmbo.innerText = id;
        //         document.getElementById("cars").appendChild(cmbo);
        //
        //     }
        // }

        function bootalert()
        {
          // var alert = document.getElementById("alert");
          // alert.style.visibility = "visible";
          //   $("#alert").delay(5000).fadeIn(500);
            $("#alert").delay(0).fadeIn(200);
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
<p>hello world</p>

<div class="container">
<%--<div style="margin: auto;text-align: center;"><button onclick="BookPage();">Book</button></div>--%>
    <div class="row ">
<input class="form-control my-2 col-sm-12" type="text" id="id" placeholder="Record Id" disabled>
    </div>
    <div class="row">
<input class="form-control my-2 col-sm-12" type="text" id="fname" placeholder="Please Enter Name">
</div>
    <div class="row">
<input class="form-control my-2 col-sm-12" type="text" id="lname" placeholder="Please Enter Family">
    </div>
    <div class="row">
    <select class="form-control my-2 col-sm-12 combo-box" id="combo">
    </select>
    </div>
    <div class="row">
        <input class="form-control my-2 col-sm-12" id="file-input" type="file" name="name" />
    </div>
<button class="btn btn-success" style="cursor: pointer" onclick="beforSave();">Save</button>
<button class="btn btn-info" onclick="clearTbl();">Clear Grid</button>
<button class="btn btn-danger" style="cursor: pointer"  onclick="clearInput();">Clear Input</button>
    <button class="btn btn-primary" onclick="repet();">
        Reapet
    </button>
    <button onclick="bootalert();">show Alert</button>

<%--    <div  id="alert" class="alert alert-success">--%>
<%--        <strong>Success!</strong> this is alert-success--%>
<%--    </div>--%>
    <div id="auto"></div>
<table class="table table-bordered table-striped table-hover">
    <thead>
    <tr>
        <td>Row</td>
        <td>Name</td>
        <td>Family</td>
        <td>Action</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>
</div>

</body>
</html>
