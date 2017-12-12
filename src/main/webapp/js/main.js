$(document).on("click", ".add-project", function () {

    var data = {
        name: $("input[name='name']").val(),
        description: $("input[name='description']").val()
    };

    data = JSON.stringify(data);

    $.ajax({
        type: "POST",
        url: "/api/project",
        data: data,
        contentType: "application/json",
        success: function (data) {
            console.log(data)
        }
    });
    console.log(data);
});