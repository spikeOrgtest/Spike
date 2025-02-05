<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login History</title>
</head>
<body>
    <h1>로그인 기록</h1>
    <table>
        <thead>
            <tr>
                <th>Login Time</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="history" items="${loginHistoryList}">
                <tr>
                    <td>${history.allTime}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
