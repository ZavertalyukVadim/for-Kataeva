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
                            <li class="item active">
                                <div class="form">
                                    <div class="title"></div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="name" placeholder="name">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="description" placeholder="description">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="pessimisticAssessment"
                                               placeholder="pessimistic_assessment">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="probableAssessment"
                                               placeholder="probable_assessment">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="optimisticAssessment"
                                               placeholder="optimistic_assessment">
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="add-field">add stage</div>
                        <div class="submit">send</div>
                    </section>
                    <section class="stages-block read">
                        <div class="list table table-striped">

                            <div style="float:left;" class="item active">
                                <div style="float: left">
                                    <span>name</span>
                                    <span>description</span>
                                    <span>pessimistic_assessment</span>
                                    <span>probable_assessment</span>
                                    <span>optimistic_assessment</span>
                                    <span>bad_assessment</span>

                                </div>
                            </div>
                            <br>
                            <c:forEach items="${project.stages}" var="stage">
                                <br><div style="float:left;" class="item active" data-project-id="${project.id}"
                                    data-stage-id="${stage.id}">
                                        <%--<div class="title"></div>--%>
                                    <div class="update" style="display: none" data-stage-id="${stage.id}">update</div>
                                    <span class="delete" data-delete-id="${stage.id}">delete</span>
                                    <span class="content">
                                    <span class="field" data-key="name" data-value="${stage.name}">
                                        <span class="value">${stage.name}</span>
                                    </span>
                                    <span class="field" data-key="description" data-value="${stage.description}">
                                        <span class="value">${stage.description}</span>
                                    </span>
                                    <span class="field" data-key="pessimisticAssessment"
                                          data-value="${stage.pessimisticAssessment}">
                                        <span class="value">${stage.pessimisticAssessment}</span>
                                    </span>
                                    <span class="field" data-key="probableAssessment"
                                          data-value="${stage.probableAssessment}">
                                        <span class="value">${stage.probableAssessment}</span>
                                    </span>
                                    <span class="field" data-key="optimisticAssessment"
                                          data-value="${stage.optimisticAssessment}">
                                        <span class="value">${stage.optimisticAssessment}</span>
                                    </span>
                                </span>
                                    <span class="total">
                                    <span class="value">${stage.badProbability}</span>
                                </span>
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
