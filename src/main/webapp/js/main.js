let project = Object.create(Project.prototype);
$(document).on("click", ".add-project", function () {
    project.create();
});
$(document).on("click", ".update-project", function () {
    project.update();
});

$(document).on("click", ".delete-project", function () {
    project.delete();
});

function Project() {
    this.id = '';
    this.name = '';
    this.description = '';
    this.jsonData = '';
}

Project.prototype.create = function () {
    this.name = $(".add input[name='name']").val();
    this.description = $(".add input[name='description']").val();
    let data = {
        name: this.name,
        description: this.description
    };

    this.jsonData = JSON.stringify(data);

    $.ajax({
        type: "POST",
        url: "/api/project",
        data: this.jsonData,
        contentType: "application/json",
        success: function (data) {
            console.log(data)
        }
    });
};

Project.prototype.update = function () {
    this.id = $(".update input[name='id']").val();
    this.name = $(".update input[name='name']").val();
    this.description = $(".update input[name='description']").val();
    let data = {
        id: this.id,
        name: this.name,
        description: this.description
    };
    this.jsonData = JSON.stringify(data);

    $.ajax({
        type: "PUT",
        url: "/api/project/" + this.id,
        data: this.jsonData,
        contentType: "application/json",
        success: function (data) {
            console.log(data)
        }
    });
};

Project.prototype.delete = function () {
    this.id = $(".delete input[name='id']").val();

    $.ajax({
        type: "DELETE",
        url: "/api/project/" + this.id,
        contentType: "application/json",
        success: function (data) {
            console.log(data)
        }
    });
};


Project.prototype.read = function () {

};
