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

let numbers = ["pessimisticAssessment", "probableAssessment", "optimisticAssessment"];

let setTitles = function () {
    let items = $(".add .item");
    for (let index = 0; index < items.length; index++) {
        $(items[index]).find(".title").text($(items[index]).find("input[name='name']").val());
    }
};

let addStageForm = function () {
    let itemObject = $(".item");
    itemObject.removeClass("active");
    $(".add .list").append(`<li class="item active">
                                <div class="form">
                                    <div class="title"></div>
                                    <div class="form-group">
                                        <input type="text" class="input form-control" name="name" placeholder="Название">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input form-control" name="description" placeholder="Описание">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input form-control" name="pessimisticAssessment"
                                               placeholder="Пессимистическая оценка">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input form-control" name="probableAssessment"
                                               placeholder="Вероятная оценка">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="input form-control" name="optimisticAssessment"
                                               placeholder="Оптимистическая оценка">
                                    </div>
                                </div>
                            </li>`);
    setTitles()
};

let removeStageForm = function () {
    $(".add .list .item:last-child").remove();
};

let addStages = function () {
    let projectId = $(".add .list").data('id');
    let forms = $(".add .form");
    let data = [];
    let notNullOrEmpty = true;
    for (let index = 0; index < forms.length; index++) {
        let form = $(forms[index]).find(".input");
        let formObject = {};
        for (let inputIndex = 0; inputIndex < form.length; inputIndex++) {
            if (numbers.indexOf($(form[inputIndex]).attr("name")) !== -1) {
                formObject[$(form[inputIndex]).attr("name")] = $(form[inputIndex]).val();
                notNullOrEmpty = notNullOrEmpty && ($(form[inputIndex]).val() !== null) && (!isNaN(parseInt($(form[inputIndex]).val()))) && ($(form[inputIndex]).val() !== "");
                if (parseInt($(form[inputIndex]).val()) > 0 && $(form[inputIndex]).val() !== "") {
                    $(form[inputIndex]).removeClass("not-valid");
                    console.log(parseInt($(form[inputIndex]).val()));
                } else {
                    $(form[inputIndex]).addClass("not-valid");
                }

            } else {
                formObject[$(form[inputIndex]).attr("name")] = $(form[inputIndex]).val();
                notNullOrEmpty = notNullOrEmpty && ($(form[inputIndex]).val() !== null) && ($(form[inputIndex]).val() !== "");
                if (($(form[inputIndex]).val() === null) || ($(form[inputIndex]).val() === "")) {
                    $(form[inputIndex]).addClass("not-valid");
                } else {
                    $(form[inputIndex]).removeClass("not-valid");
                }
            }
        }
        data.push(formObject);
    }

    // console.log(parseInt(data[0].optimisticAssessment));

    if (notNullOrEmpty) {
        for (let index = 0; index < forms.length; index++) {
            let form = $(forms[index]).find(".input");
            for (let inputIndex = 0; inputIndex < form.length; inputIndex++) {
                $(form[inputIndex]).val("");
                $(form[inputIndex]).removeClass("not-valid");
            }
        }
        data = JSON.stringify(data);
        $.ajax({
            type: "POST",
            url: "/api/stage/" + projectId,
            data: data,
            contentType: "application/json",
            success: function (data) {
                let template = ``;
                let className;
                for (let index = 0; index < data.length; index++) {
                    className = (index + 1 === data.length) ? " active" : "";
                    template += `<li class="item${className}" data-project-id="${data[index].id}" data-stage-id="${data[index].id}">
                                <div class="title"></div>
                                <div class="update" style="display:none;" data-stage-id="${data[index].id}">update</div>
                                <div class="delete" data-delete-id="${data[index].id}">delete</div>
                                <div class="content">
                                    <div class="field" data-key="name" data-value="${data[index].name}">
                                        <div class="value">${data[index].name}</div>
                                    </div>
                                    <div class="field" data-key="description" data-value="${data[index].description}">
                                        <div class="label">description</div>
                                        <div class="value">${data[index].description}</div>
                                    </div>
                                    <div class="field" data-key="pessimisticAssessment" data-value="${data[index].pessimisticAssessment}">
                                        <div class="label">pessimistic_assessment</div>
                                        <div class="value">${data[index].pessimisticAssessment}</div>
                                    </div>
                                    <div class="field" data-key="probableAssessment" data-value="${data[index].probableAssessment}">
                                        <div class="label">probable_assessment</div>
                                        <div class="value">${data[index].probableAssessment}</div>
                                    </div>
                                    <div class="field" data-key="optimisticAssessment" data-value="${data[index].optimisticAssessment}">
                                        <div class="label">optimistic_assessment</div>
                                        <div class="value">${data[index].optimisticAssessment}</div>
                                    </div>
                                    <div class="field">
                                        <div class="label">optimistic_assessment</div>
                                        <div class="value">${data[index].badProbability}</div>
                                    </div>
                                </div>
                            </li>`
                }
                $(".read .list").html(template);
                if ($(".add .message").length !== 0) {
                    $(".add .message").remove();
                }
            }
        })
    } else {
        if ($(".add .message").length === 0) {
            $(".add").append("<div class='message alert alert-warning' role='alert'>Поля должны быть запонены</div>");
        }
    }
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
            $(".read .list .item[data-stage-id='" + stageId + "']").remove();
        }
    })
};


$(document).on("click", ".add-field", function () {
    addStageForm();
});

$(document).on("click", ".delete-field", function () {
    removeStageForm();
});

$(document).on("click", ".add .item", function () {
    if ($(this).hasClass("active")) {
    } else {
        $(".add .item").removeClass("active");
        $(this).addClass("active")
    }
    setTitles();
});

$(document).on("click", ".read .item", function () {
    console.log($(this).hasClass("active"));
    if ($(this).hasClass("active")) {
        $(this).removeClass("active");
    } else {
        $(this).addClass("active")
    }
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
