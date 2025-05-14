<%-- 
    Document   : BankList
    Created on : 2 May 2024, 11:06:50 am
    Author     : husna
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mvc.bean.Bank" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bank List</title>
    </head>
    <body>
        <h1>Bank List</h1>
        <ul>
            <c:forEach items="${bankList.banks}" var="bank">
                <li>${bank.name}</li>
            </c:forEach>
        </ul>
    </body>
</html>