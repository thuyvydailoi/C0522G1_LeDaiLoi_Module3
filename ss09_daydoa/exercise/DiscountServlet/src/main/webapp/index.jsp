<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/23/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Phiếu bán hàng</h1>
<form action="/display-discount" method="post">
    <input name="product" placeholder="Tên sản phẩm"> <br> <br>
    <input name="listPrice" placeholder="Lượng chiết khấu"> <br> <br>
    <input name="discountPercent" placeholder="Giá chiết khấu"> <br>
    <button type="submit">Submit</button>
</form>
</body>
</html>
