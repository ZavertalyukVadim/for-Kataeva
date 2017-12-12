<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <title>Home</title>
</head>
<body>
<div>
    <div class="projects">
        <div class="project-item" data-id="1">
            <a href="">blabla</a>
            fds
        </div>
        <div class="project-item" data-id="2">
            <a href="">blabla</a>
            dfs
        </div>
        <div class="project-item" data-id="3">
            <a href="">blabla</a>
            dsf
        </div>
        <div class="project-item" data-id="4">
            <a href="">blabla</a>
            fds
        </div>
    </div>

</div>

<div class="project-form add">
    <input type="text" class="input" name="name" placeholder="name">
    <input type="text" class="input" name="description" placeholder="Description">
    <input type="submit" class="add-project" value="ok">
</div>
<div class="project-form update">
    <input type="hidden" class="input" name="id" value="1">
    <input type="text" class="input" name="name" placeholder="name">
    <input type="text" class="input" name="description" placeholder="Description">
    <input type="submit" class="update-project" value="ok">
</div>
<div class="project-form delete">
    <input type="hidden" class="input" name="id" value="1">
    <input type="submit" class="delete-project" value="ok">
</div>
</body>
</html>
