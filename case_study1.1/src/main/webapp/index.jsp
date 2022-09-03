<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/31/2022
  Time: 8:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Home</title>
    <style>
        body {
            background-color: powderblue;
        }

        .myCSS {
            background-color: lightgray;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container-fluid bg-gray-500 d-flex myCSS" style="height: 100px">
    <img class="h-100 p-4"
         src="https://phuongviethcm.com/wp-content/uploads/2019/07/FURAMA.png"
         style="width:30% ; height: 20%" alt="">
    <img class="ms-5 ps-5" src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
         alt="">

    <div class="container-fluid text-end my-4 me-4">
        <span class="badge text-bg-warning mt-3">Le Dai Loi</span>
    </div>
</div>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid mx-5">
        <a class="navbar-brand" href="/">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Employee</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Employee list</a></li>
                        <li><a class="dropdown-item" href="#">Add new Employee</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Customer</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/customer">Customer list</a></li>
                        <li><a class="dropdown-item" href="/customer?action=create">Add new Customer</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Service</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Facility list</a></li>
                        <li><a class="dropdown-item" href="#">Add new Facility</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown ms-3">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Contract</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Contract list</a></li>
                        <li><a class="dropdown-item" href="#">Add new Contract</a></li>
                    </ul>
                </li>
            </ul>

            <form class="d-flex my-2" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid" style="height: 520px">
    <div class="row mx-3">
        <div class="col-2">
            <p class="ms-3 mt-3">Item One</p>
            <p class="ms-3 mt-3">Item Two</p>
            <p class="ms-3 mt-3">Item Three</p>
        </div>

        <div class="col-10">
            <img class="img-fluid"
                 src="https://pix10.agoda.net/hotelImages/6249859/0/fe5bb5bfb7658a11f652cba9543aeb83.jpg?ca=10&ce=1&s=1024x768"
                 alt="">
        </div>
    </div>
</div>

<div class="container-fluid text-center bg-secondary">
    <p class="text-light p-3">&copy;FURAMA - officially operated in 1997.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>