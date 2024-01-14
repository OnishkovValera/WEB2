<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <form id="feedBack" action="${pageContext.request.contextPath}/Controller" method="post" name="form">
            <table id="mainTable" class="mainTable">
                <tr>
                    <th>Введите X:</th>
                    <td>
                        <label for="X"></label>
                        <select id="X" name="X" class="select">
                            <option value="-4">-4</option>
                            <option value="-3">-3</option>
                            <option value="-2">-2</option>
                            <option value="-1">-1</option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
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
                                    <input type="radio" id="1" name="radius" value="1" checked/>
                                    <label for="1">1.0</label>
                                </td>
                                <td>
                                    <input type="radio" id="1.5" name="radius" value="1.5"/>
                                    <label for="1.5">1.5</label>
                                </td>
                                <td>
                                    <input type="radio" id="2" name="radius" value="2"/>
                                    <label for="2">2.0</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="2.5" name="radius" value="2.5"/>
                                    <label for="2.5">2.5</label>
                                </td>
                                <td>
                                    <input type="radio" id="3" name="radius" value="3"/>
                                    <label for="3">3.0</label>
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
        <canvas id="canvas" class="canvas">This canvas does not support graphics</canvas>
    </div>
</main>

<script src="JS/CanvasPrinter.js" type="text/javascript"></script>
<script src="JS/Validator.js" type="text/javascript"></script>
</body>

</html>

<style>
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