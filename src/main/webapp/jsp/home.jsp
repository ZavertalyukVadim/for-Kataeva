<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Project</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <title>Home</title>
    <![endif]-->
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/" class="active">Главная <span class="sr-only">(current)</span></a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><span class="glyphicon glyphicon-menu-hamburger"></span></a>
                    <ul class="dropdown-menu">
                        <c:if test="${!role}">
                            <li><a href="/registration">Регистрация</a></li>
                            <li><a href="/login">Авторизация</a></li>
                        </c:if>
                        <c:if test="${role}">
                            <li><a href="/logout">Выход</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div>
        <div class="projects">
            <c:forEach items="${projects}" var="project">
                <div class="project-item" data-id="${project.id}">
                    <div class="field">
                        <div class="label">Title</div>
                        <div class="value"><a href="/project/${project.id}">${project.name}</a></div>
                    </div>
                    <div class="field">
                        <div class="label">Description</div>
                        <div class="value">${project.description}</div>
                    </div>
                    <div class="field">
                        <div class="label">Normal probability</div>
                        <div class="value">${project.normalProbability}</div>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </div>

    </div>

    <div class="container">
        <div class="project-form add">
            <div class="form-group"><input type="text" class="input form-control" name="name" placeholder="name"></div>
            <div class="form-group"><input type="text" class="input form-control" name="description"
                                           placeholder="Description"></div>
            <div class="form-group"><input type="submit" class="add-project btn btn-default" value="ok"></div>
        </div>
    </div>

    <div class="container">
        <div class="project-form update">
            <div class="form-group"><input type="hidden" class="input form-control" name="id" value="1"></div>
            <div class="form-group"><input type="text" class="input form-control" name="name" placeholder="name"></div>
            <div class="form-group"><input type="text" class="input form-control" name="description"
                                           placeholder="Description"></div>
            <div class="form-group"><input type="submit" class="update-project btn btn-default" value="ok"></div>
        </div>
    </div>
    <div class="container">
        <div class="project-form delete">
            <div class="form-group"><input type="text" class="input form-control" name="id"></div>
            <div class="form-group"><input type="submit" class="delete-project btn btn-default" value="ok"></div>
        </div>
    </div>

    <div class="container">
        <div class="project-form read">
            <div class="form-group"><input type="text" class="input form-control" name="id" placeholder="id"></div>
            <div class="form-group"><input type="submit" class="read-project btn btn-default" value="one"></div>
        </div>
    </div>
    <div class="project-form read-all" style="display: none">
        <input type="submit" class="read-all-project" value="all">
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.js"></script>

<script type="text/javascript" src="../js/main.js"></script>
</body>
</html>
