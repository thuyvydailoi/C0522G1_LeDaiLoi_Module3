<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/24/2022
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Số báo danh</th>
        <th scope="col">Họ và tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Quê quán</th>
        <th scope="col">Ảnh đại diện</th>
    </tr>
    </thead>

    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.id}"/></td>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.dateOfBirth}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><img style="width: 40px; height: 40px" src="${customer.picture}"/></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
