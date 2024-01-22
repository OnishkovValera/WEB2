<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="Beans.ArrayPoints"%>
<%@ page import="Beans.Point"%>

<%
    ArrayPoints points;
    points = (session.getAttribute("array") == null)
            ? new ArrayPoints()
            : (ArrayPoints) session.getAttribute("array");
%>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Результаты</title>

</head>
<body class="next_page">
<table class="answerTable">
    <tr>
        <td>X</td>
        <td>Y</td>
        <td>R</td>
        <td>Результат</td>
        <td>Время</td>
        <td>Время выполнения(миллисекунды)</td>
    </tr>
    <%for(Point point: points.getPoints()){%>
    <tr>
        <td><%=point.getX()%></td>
        <td><%=point.getY()%></td>
        <td><%=point.getR()%></td>
        <td><%=point.getStatus().toString()%></td>
        <td><%=point.getTime()%></td>
        <td><%=point.getScriptTime()%></td>
    </tr>
    <%}%>
</table>
<a href="${pageContext.request.contextPath}/index.jsp" class="previous">Вернуться на главную страницу</a>
</body>
</html>
<style>
    .previous{
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
    .previous:hover{
        background-color: #2b8500;
    }
    .previous:active{
        box-shadow: inset 0 0 5px rgba(0, 0, 0, .5);
    }
    .answerTable {
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 0.9em;
        font-family: sans-serif;
        min-width: 400px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }
    .answerTable thead tr {
        background-color: #009879;
        color: #ffffff;
        text-align: left;
    }
    .answerTable th,
    .answerTable td {
        padding: 12px 15px;
    }
    .answerTable tbody tr {
        border-bottom: 1px solid #dddddd;
    }

    .answerTable tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    .answerTable tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
    }

</style>

