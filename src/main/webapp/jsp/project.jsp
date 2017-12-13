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
            <a class="navbar-brand" href="index.html">HUETA</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
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
                                        <input type="text" class="input" name="pessimisticAssessment" placeholder="pessimistic_assessment">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="probableAssessment" placeholder="probable_assessment">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input" name="optimisticAssessment" placeholder="optimistic_assessment">
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="add-field">add stage</div>
                        <div class="submit">send</div>
                    </section>
                    <section class="stages-block read">
                        <ul class="list">
                            <c:forEach items="${project.stages}" var="stage">
                            <li class="item active" data-project-id="${project.id}" data-stage-id="${stage.id}">
                                <div class="title"></div>
                                <div class="update" data-stage-id="${stage.id}">update</div>
                                <div class="delete" data-delete-id="${stage.id}">delete</div>
                                <div class="content">
                                    <div class="field" data-key="name" data-value="${stage.name}">
                                        <div class="label">name</div>
                                        <div class="value">${stage.name}</div>
                                    </div>
                                    <div class="field" data-key="description" data-value="${stage.description}">
                                        <div class="label">description</div>
                                        <div class="value">${stage.description}</div>
                                    </div>
                                    <div class="field" data-key="pessimisticAssessment" data-value="${stage.pessimisticAssessment}">
                                        <div class="label">pessimistic_assessment</div>
                                        <div class="value">${stage.pessimisticAssessment}</div>
                                    </div>
                                    <div class="field" data-key="probableAssessment" data-value="${stage.probableAssessment}">
                                        <div class="label">probable_assessment</div>
                                        <div class="value">${stage.probableAssessment}</div>
                                    </div>
                                    <div class="field" data-key="optimisticAssessment" data-value="${stage.optimisticAssessment}">
                                        <div class="label">optimistic_assessment</div>
                                        <div class="value">${stage.optimisticAssessment}</div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="label">optimistic_assessment</div>
                                    <div class="value">${stage.badProbability}</div>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                        <div class="update-popup">
                            <div class="form"></div>
                            <div class="submit">Update</div>
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
