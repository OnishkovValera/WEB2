<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.ArrayPoints" %>
<%@ page import="Beans.Point"%>
<%@page import="com.google.gson.Gson" %>
<%
    ArrayPoints points;
    points = (session.getAttribute("array") == null)
            ? new ArrayPoints()
            : (ArrayPoints) session.getAttribute("array");
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>WEB.2</title>
</head>
<body>
<header>
    <table class="header" style="font-size: large">
        <tr>
            <td class="variant">Вариант 2489</td>
            <td class="labNumber">Лабораторная работа №2</td>
            <td class="name">Онишков Валерий Вячеславович</td>
        </tr>
    </table>
</header>
<main>
    <div class="container">
        <form id="feedBack" action="${pageContext.request.contextPath}//Controller" method="get" name="form">
            <table id="mainTable" class="mainTable">
                <tr>
                    <th>Введите X:</th>
                    <td>
                        <div class="radio-form">
                            <div class="radio-form-item item1">
                                <input type="radio" name="X" id="m3" value="-3" >
                                <label for="m3">-3</label>
                            </div>
                            <div class="radio-form-item item2">
                                <input type="radio" name="X" id="m2" value="-2">
                                <label for="m2">-2</label>
                            </div>
                            <div class="radio-form-item item3">
                                <input type="radio" name="X" id="m1" value="-1">
                                <label for="m1">-1</label>
                            </div>
                            <div class="radio-form-item item4">
                                <input type="radio" name="X" id="p0" value="0">
                                <label for="p0">0</label>
                            </div>
                            <div class="radio-form-item item5">
                                <input type="radio" name="X" id="p1" value="1">
                                <label for="p1">1</label>
                            </div>
                            <div class="radio-form-item item6">
                                <input type="radio" name="X" id="p2" value="2">
                                <label for="p2">2</label>
                            </div>
                            <div class="radio-form-item item7">
                                <input type="radio" name="X" id="p3" value="3">
                                <label for="p3">3</label>
                            </div>
                            <div class="radio-form-item item8">
                                <input type="radio" name="X" id="p4" value="4">
                                <label for="p4">4</label>
                            </div>
                            <div class="radio-form-item item9">
                                <input type="radio" name="X" id="p5"  value="5" checked>
                                <label for="p5">5</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>Введите Y:</th>
                    <td>
                        <input type="text" maxlength="10" class="select" name="Y" id="Y" placeholder="от -3 до 5" required>
                    </td>
                </tr>
                <tr>
                    <th>
                        Изменение R:
                    </th>
                    <td>
                        <table class="radioTable" name="radio">
                            <tr>
                                <td>
                                    <input type="radio" id="1" name="radius" value="1" />
                                    <label for="1">1</label>
                                </td>
                                <td>
                                    <input type="radio" id="2" name="radius" value="2"/>
                                    <label for="2">2</label>
                                </td>
                                <td>
                                    <input type="radio" id="3" name="radius" value="3"/>
                                    <label for="3">3</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="4" name="radius" value="4"/>
                                    <label for="4">4</label>
                                </td>
                                <td>
                                    <input type="radio" id="5" name="radius" value="5" checked/>
                                    <label for="5">5</label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button id="submitButton" class="buttons" type="submit">
                            Проверить
                        </button>
                    </td>
                </tr>
            </table>
        </form>
        <canvas id="canvas" class="canvas" width="400" height="400">This canvas does not support graphics</canvas>
    </div>
</main>
<script>
    let ArrayPoints = <%=points.convertToJSON()%>;
    path = "${pageContext.request.contextPath}";
</script>
<script src="JS/Main.js" type="text/javascript"></script>
<script src="JS/CanvasPrinter.js" type="text/javascript"></script>
<script src="JS/Validator.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>

</html>

<style>
    .radio-form {
        display: inline-block;
        overflow: hidden;
    }
    .radio-form-item {
        display: inline-block;
        float: left;
    }
    .radio-form  input[type=radio] {
        display: none;
    }
    .radio-form  label {
        display: inline-block;
        cursor: pointer;
        padding: 0px 15px;
        line-height: 34px;
        border: 1px solid #999;
        border-right: none;
        user-select: none;
    }

    .radio-form  .radio-form-item:first-child label {
        border-radius: 6px 0 0 6px;
    }
    .radio-form .item4 label{
        border-radius: 0 6px 6px 0;
        border-right: 1px solid #999;
    }
    .radio-form  .radio-form-item:last-child label {
        border-radius: 0 6px 6px 0;
        border-right: 1px solid #999;
    }
    .radio-form  .item5 label {
        border-radius: 6px 0 0 6px;
    }
    /* Checked */
    .radio-form input[type=radio]:checked + label {
        background: #ffe0a6;
    }

    /* Hover */
    .radio-form label:hover {
        color: #666;
    }

    /* Disabled */
    .radio-form input[type=radio]:disabled + label {
        background: #efefef;
        color: #666;
    }


    .radioTable{
        width: 100%;
    }
    .select{
        width: 100%;
        padding: 16px 20px;
        border: 3px solid black;
        border-radius: 4px;
        background-color: #f1f1f1;
    }
    .select:focus{
        border: 3px solid #4CAF50;
    }
    .radioTable td{
        margin-left: 100px;
    }
    .mainTable{
        text-align: center;
        margin-outside: 30px;
        font-family: monospace;
        font-size: 200%;
        width: 100%;
    }
    .buttons{
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 10px;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
    }
    .buttons:hover{
        background-color: #2b8500;
    }
    .buttons:active {
        box-shadow: inset 0 0 5px rgba(0, 0, 0, .5);
    }

    .container{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .header tr td{
        width: 33%;
        text-align: center;
    }

    .mainTable tr td{
        width: 230px;
        height: 33%;
        text-align: center;
    }
    #feedBack{
        margin-top: 9%;
        margin-left: 20%;
    }

    .canvas{
        margin-top: 9%;
        margin-right: 20%;
    }

    .header {
        text-align: center;
        width: 100%;
        background: black;
        color: white;
        padding: 4px 16px 4px;
        margin: 0;
        height: 60px;
        justify-content: space-between;
        font-family: monospace;
        font-size: large;
    }
    body{
        background-image: url("html/img.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-attachment: fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }

</style>