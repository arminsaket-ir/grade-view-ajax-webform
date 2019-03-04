<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="style/style.css" rel="stylesheet" />
    <script src="script/script.js"></script>
    <script src="script/jquery.js"></script>
    <title>Ajax BookShop GradeView</title>
    <script>
        window.onload = function () {


        }
       

        fo = [];
        v = "v1"

        function create_pager(psize) {

            $.ajax({
                url: "index.aspx/getSize",
                data: {},
                dataType: "json",
                contentType: "application/json",
                type: "post",
                success: function (res) {

                    wsize = res.d;
                    num = Math.ceil(wsize / psize);


                    r = $("<li>").addClass("right").html("<");
                    l = $("<li>").addClass("left").html(">");

                    $("#pager").empty();
                    $("#pager").append(r);

                    for (i = 0; i < num; i++) {

                        pa = $("<li>").html(i + 1);

                        pa.css({ opacity: 0, top: "-100px", position: "relative" })
                        $("#pager").append(pa);
                        pa.delay(i * 200).animate({ opacity: 1, top: "0px" }, 500)

                    }


                    $("#pager").append(l);
                    $("#pager > li:eq(1)").addClass("sel");

               



            },
                error: function (er) {

                alert(er.responseText)

                }


            });

        }


        function fill(start, count, vi) {

            $.ajax({
                url: "index.aspx/getAll",
                data: "{st:" + start + ",cu:" + count + "}",
                dataType: "json",
                contentType: "application/json",
                type: "post",
                success: function (res) {

                    fo = res.d;

                    grid.className = "grid " + vi;

                    $("#grid").empty();

                    for (i = 0; i < fo.length; i++) {

                        it = $("<div>").addClass("items");

                        im = $("<img>").attr({ src: "img/ketab/" + fo[i].pic, title: fo[i].describe });

                        mas = $("<div>").addClass("mask");
                        h = $("<h2>").html(fo[i].fname);
                        sp = $("<span>").addClass("star").css({ width: fo[i].star * 24 + "px" });
                        pr = $("<span>").addClass("price").html(fo[i].price + " ریال");
                        par = $("<p>").addClass("des").html(fo[i].describe);

                        mas.append(h).append(sp).append(pr).append(par);
                        it.append(im).append(mas)

                        it.css({ opacity: 0, top: "-100px", position: "relative" })
                        $("#grid").append(it);
                        it.delay(i * 200).animate({ opacity: 1, top: "100px" }, 500)
                    }

                },
                error: function () { }


            });

        }



        $(document).ready(function () {

            create_pager(4);
            fill(0, 8, "v1");
            $("#pager").on("click", "li", function () {


                $("#pager > li").removeClass("sel");
                $(this).addClass("sel");

                page = $(this).html();
                size = $("#capacity > option:selected").html();

                start = (page - 1) * size;
                count = size;


                $("#grid").html("<img src='img/load.gif' style='display:block;width:200px;height:200px;margin:160px auto;border-radius:100%' >");

                setTimeout("fill(start, count, v)", 1500);

            });

            $("#capacity").change(function () {

                size = $("#capacity > option:selected").html();

                create_pager(size);

                $("#grid").html("<img src='img/load.gif' style='display:block;width:200px;height:200px;margin:160px auto;border-radius:100%' >");

                setTimeout("fill(0, size, v)", 1500);

            });

            $("#menu > .gv").click(function () {

                $("#menu > item1").removeClass("item1");
                $(this).addClass("item1");

                i = $(this).index() + 1;

                v = "v" + i;

                $("#grid").removeClass().addClass("grid").addClass(v);
                


            });
           

                
        });


    



    </script>
</head>
<body>
    <div id="main">
        <div id="container">
            <div class="pager">

                <ul id="pager">
                    <li class="right">< </li>
                    <li class="sel">1 </li>
                    <li>2 </li>
                    <li>3 </li>
                    <li class="left">> </li>

                </ul>

            </div>
            <div id="grid" runat="server" class="grid v1">

                <%--                       <div class="items">
                    <img src="img/3.jpg">
                    <div class="mask">
                        <h2>کتاب سفری در زمان </h2>
                        <span class="star"></span>
                        <span class="price">2000000 ریال</span>
                        <p class="des">توضیحات بیشتر </p>
                    </div>
                </div>--%>
            </div>


            

        </div>
        <div id="menu">
            <div class="item1 gv"></div>
            <div class="item2 gv"></div>
            <div class="item4" onclick="light()"></div>
            <div class="item5" onclick="night()"></div>
            <div class="item3" onclick="window.open('https://telegram.me/share/url?url=http://arminsaket.ir/&text=Armin Saket - Web Designer And Android Developer','_newtab');"></div>
            <div class="set">
                <select id="capacity">
                    <option>4 </option>
                    <option selected>8 </option>
                    <option>16 </option>
                </select>

            </div>
        </div>
    </div>
    <script>


        window.onscroll = function () {

            if (window.pageYOffset > 100) {
                menu.className = "fix";
            }
            else {
                menu.className = "";

            }

        }

        function light() {
            document.body.style.backgroundColor = "#95a5a6";
        }
        function night() {
            document.body.style.backgroundColor = "#34495e";
        }


        $(function () {
            $('.dot').click(function () {
                $(".dot.current").removeClass("current");
                $(this).addClass("current");
            });
        });
    </script>
</body>
</html>
