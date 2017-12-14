<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="../css/style.css">

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
                <li><a href="/">Главная <span class="sr-only">(current)</span></a></li>
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
    <div class="panel panel-default">
        <div class="container">
            <div class="project-detail">
                <div class="field">
                    <div class="name">${project.name}</div>
                    <div class="description">${project.description}</div>
                    <section class="stages-block add">
                        <ul class="list" data-id="${project.id}">

                        </ul>
                        <div class="add-field btn btn-default">Добавить ещё</div>
                        <div class="delete-field btn btn-default">Удалить последнюю форму</div>
                        <div class="submit btn btn-default">Добавить</div>
                    </section>
                    <section class="stages-block read">
                        <div class="list table table-striped">
                            <div class="title">Этапы</div>
                            <c:forEach items="${project.stages}" var="stage">
                                <div class="item" data-project-id="${project.id}"
                                     data-stage-id="${stage.id}">
                                    <div class="title"></div>
                                    <div class="update" style="display: none" data-stage-id="${stage.id}">update</div>
                                    <div class="delete" data-delete-id="${stage.id}">delete</div>
                                    <div class="content">
                                        <div class="field" data-key="name" data-value="${stage.name}">
                                            <div class="value">${stage.name}</div>
                                        </div>
                                        <div class="field" data-key="description" data-value="${stage.description}">
                                            <div class="label">Описание</div>
                                            <div class="value">${stage.description}</div>
                                        </div>
                                        <div class="field" data-key="pessimisticAssessment"
                                             data-value="${stage.pessimisticAssessment}">
                                            <div class="label">Пессимистическая оценка</div>
                                            <div class="value">${stage.pessimisticAssessment}</div>
                                        </div>
                                        <div class="field" data-key="probableAssessment"
                                             data-value="${stage.probableAssessment}">
                                            <div class="label">Вероятная оценка</div>
                                            <div class="value">${stage.probableAssessment}</div>
                                        </div>
                                        <div class="field" data-key="optimisticAssessment"
                                             data-value="${stage.optimisticAssessment}">
                                            <div class="label">Оптимистическая оценка</div>
                                            <div class="value">${stage.optimisticAssessment}</div>
                                        </div>
                                        <div class="field">
                                            <div class="label">Вычисленная оценка</div>
                                            <div class="value">${stage.badProbability}</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="update-popup" style="display: none;">
                            <div class="form"></div>
                            <div class="submit" style="display: none">Update</div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.js"></script>

<script type="text/javascript" src="../js/main.js"></script>
</body>
</html>
