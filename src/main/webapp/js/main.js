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

$(document).on("click", ".read-project", function () {
    project.read();
});

$(document).on("click", ".read-all-project", function () {
    project.readAll();
});

console.log("ok");

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

    let printData = data;
    this.jsonData = JSON.stringify(data);

    $.ajax({
        type: "POST",
        url: "/api/project",
        data: this.jsonData,
        contentType: "application/json",
        success: function (data) {
            if (data > 0) {
                project = printData;
                let template = `<tr class="project-item" data-id="${data}">
                    <td class="field">
                        <div class="value"><a href="/project/${data}">${project.name}</a></div>
                    </td>
                    <td class="field">
                        <div class="value">${project.description}</div>
                    </td>
                    <td class="field">
                        <div class="value">${"0.0"}</div>
                    </td>
                </tr>`;
                $(".projects").append(template);
            }
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
    this.id = $(".read input[name='id']").val();

    $.ajax({
        type: "GET",
        url: "/api/project/" + this.id,
        contentType: "application/json",
        success: function (data) {
            for (let index in data) {
                let template = `<div class="project-item">
                    <div class="field">
                        <div class="label">Title</div>
                        <div class="value">${data[index].name}</div>
                    </div>
                    <div class="field">
                        <div class="label">Description</div>
                        <div class="value">${data[index].description}</div>
                    </div>
                    <div class="field">
                        <div class="label">Normal probability</div>
                        <div class="value">${data[index].normalProbability}</div>
                    </div>
                </div>`;
                console.log(template);
            }
        }
    });
};

Project.prototype.readAll = function () {

    $.ajax({
        type: "GET",
        url: "/api/project",
        contentType: "application/json",
        success: function (data) {
            let template = ``;
            for (let index in data) {
                template += `<div class="project-item" data-id="${data[index].id}">
                    <div class="field">
                        <div class="label">Title</div>
                        <div class="value"><a href="/project/${data[index].id}">${data[index].name}</a></div>
                    </div>
                    <div class="field">
                        <div class="label">Description</div>
                        <div class="value">${data[index].description}</div>
                    </div>
                    <div class="field">
                        <div class="label">Normal probability</div>
                        <div class="value">${data[index].normalProbability}</div>
                    </div>
                </div><hr>`;
            }
            $(".projects").html(template);

        }
    });
};

let numbers = ["pessimistic_assessment", "probable_assessment", "optimistic_assessment"];

let setTitles = function () {
    // let items = $(".add .item");
    // for (let index = 0; index < items.length; index++) {
    //     $(items[index]).find(".title").text($(items[index]).find("input[name='name']").val());
    // }
};

let addStageForm = function () {
    let itemObject = $(".item");
    itemObject.removeClass("active");
    $(".add .list").append("<li class='item active'>" + itemObject.html() + "</li>");
    setTitles()
};

let addStages = function () {
    let projectId = $(".add .list").data('id');
    let forms = $(".add .form");
    let data = [];
    for (let index = 0; index < forms.length; index++) {
        let form = $(forms[index]).find(".input");
        let formObject = {};
        for (let inputIndex = 0; inputIndex < form.length; inputIndex++) {
            if (numbers.indexOf($(form[inputIndex]).attr("name")) !== -1) {
                formObject[$(form[inputIndex]).attr("name")] = $(form[inputIndex]).val();
            } else {
                formObject[$(form[inputIndex]).attr("name")] = $(form[inputIndex]).val();
            }
        }
        data.push(formObject);
    }
    data = JSON.stringify(data);
    $.ajax({
        type: "POST",
        url: "/api/stage/" + projectId,
        data: data,
        contentType: "application/json",
        success: function (data) {
            var template = ``;
            for (var index = 0; index < data.length; index++) {
                template += `<div class="item active" style="float: left" data-project-id="${data[index].id}" data-stage-id="${data[index].id}">
                                <div class="title"></div>
                                <div class="update" style="display:none;" data-stage-id="${data[index].id}">update</div>
                                <div class="delete" data-delete-id="${data[index].id}">delete</div>
                                <div class="content">
                                    <span class="field" data-key="name" data-value="${data[index].name}">
                                        <span class="label">name</span>
                                        <span class="value">${data[index].name}</span>
                                    </span>
                                    <span class="field" data-key="description" data-value="${data[index].description}">
                                        <span class="label">description</span>
                                        <span class="value">${data[index].description}</span>
                                    </span>
                                    <span class="field" data-key="pessimisticAssessment" data-value="${data[index].pessimisticAssessment}">
                                        <span class="label">pessimistic_assessment</span>
                                        <span class="value">${data[index].pessimisticAssessment}</span>
                                    </span>
                                    <span class="field" data-key="probableAssessment" data-value="${data[index].probableAssessment}">
                                        <span class="label">probable_assessment</span>
                                        <span class="value">${data[index].probableAssessment}</span>
                                    </span>
                                    <span class="field" data-key="optimisticAssessment" data-value="${data[index].optimisticAssessment}">
                                        <span class="label">optimistic_assessment</span>
                                        <span class="value">${data[index].optimisticAssessment}</span>
                                    </span>
                                </div>
                                <span class="total">
                                    <span class="label">optimistic_assessment</span>
                                    <span class="value">${data[index].badProbability}</span>
                                </span>
                            </div>`
            }
            $(".read .list").html(template);
        }
    })
};

let updateFormInit = function (object) {
    let stageId = $(object).data('stage-id');
    let item = $(".item[data-stage-id='" + stageId + "']");
    let fields = item.find('.field');
    let data = {};
    let formData = ``;
    formData += `<div class="form-group"><input type="hidden" class="input" name="id" value="${stageId}"></div>\n`;
    for (let index = 0; index < fields.length; index++) {
        formData += `<div class="form-group"><input type="text" class="input" name="${$(fields[index]).data('key')}" value="${$(fields[index]).data('value')}"></div>\n`;
    }
    $(".update-popup .form").html(formData);
};

let updateStage = function () {
    let fields = $(".update-popup .form .input");
    let data = {};
    for (let index = 0; index < fields.length; index++) {
        if (numbers.indexOf($(fields[index]).attr("name")) !== -1) {
            data[$(fields[index]).attr('name')] = parseInt($(fields[index]).val());
        } else {
            data[$(fields[index]).attr('name')] = $(fields[index]).val();
        }
    }
    let stageId = data.id;
    data = JSON.stringify(data);

    $.ajax({
        type: "PUT",
        url: "/api/stage/" + stageId,
        data: data,
        contentType: "application/json",
        success: function (data) {
            console.log(data);
        }
    })
};

let deleteStage = function (object) {
    let stageId = $(object).data('delete-id');

    console.log(stageId);
    $.ajax({
        type: "DELETE",
        url: "/api/stage/" + stageId,
        success: function (data) {
            if (data)
                $(".read .list li[data-stage-id='" + stageId + "']").remove();
        }
    })
};


$(document).on("click", ".add-field", function () {
    addStageForm();
});

$(document).on("click", ".add .item", function () {
    if ($(this).hasClass("active")) {
    } else {
        $(".add .item").removeClass("active");
        $(this).addClass("active")
    }
    setTitles();
});


$(document).on("click", ".submit", function () {
    addStages();
});

$(document).on("click", ".update", function () {
    updateFormInit(this);
});

$(document).on("click", ".update-popup .submit", function () {
    updateStage();
});

$(document).on("click", ".delete", function () {
    deleteStage(this);
});
