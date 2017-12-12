$(document).on("click", ".add-project", function () {

    var data = {};
    var inputs = document.querySelectorAll(".input");
    for (var index in inputs) {
        var element = inputs[index];
        data[element.name] = data.value;
    }
    console.log(data);
});