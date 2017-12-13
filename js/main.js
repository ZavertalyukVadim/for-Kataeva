let numbers = ["pessimistic_assessment", "probable_assessment", "optimistic_assessment"];

let setTitles = function () {
    let items = $(".add .item");
    for (let index = 0; index < items.length; index++) {
        $(items[index]).find(".title").text($(items[index]).find("input[name='name']").val());
    }
};

let addStageForm = function () {
    let itemObject = $(".item");
    itemObject.removeClass("active");
    $(".add .list").append("<li class='item active'>" + itemObject.html() + "</li>");
    setTitles()
};

let addStages = function () {
    let forms = $(".add .form");
    let data = [];
    for (let index = 0; index < forms.length; index++) {
        let form = $(forms[index]).find(".input");
        let formObject = {};
        for (let inputIndex = 0; inputIndex < form.length; inputIndex++) {
            if (numbers.indexOf($(form[inputIndex]).attr("name")) !== -1) {
                formObject[$(form[inputIndex]).attr("name")] = parseFloat($(form[inputIndex]).val());
            } else {
                formObject[$(form[inputIndex]).attr("name")] = $(form[inputIndex]).val();
            }
        }
        data.push(formObject);
    }
    data = JSON.stringify(data);
    /*$.ajax({
     type: "POST",
     url: "",
     data: data,
     success: function (data) {
     console.log(data)
     }
     })*/
};

let updateFormInit = function (object) {
    let stageId = $(object).data('stage-id');
    let item = $(".item[data-stage-id='" + stageId + "']");
    let fields = item.find('.field');
    let data = {};
    let formData = ``;
    formData +=`<div class="form-group"><input type="hidden" class="input" name="id" value="${stageId}"></div>\n`;
    for (let index = 0; index < fields.length; index++) {
        formData +=`<div class="form-group"><input type="text" class="input" name="${$(fields[index]).data('key')}" value="${$(fields[index]).data('value')}"></div>\n`;
    }
    $(".update-popup .form").html(formData);
};

let updateStage = function () {
    let fields = $(".update-popup .form .input");
    let data = {};
    for (let index = 0; index < fields.length; index++) {
        if (numbers.indexOf($(fields[index]).attr("name")) !== -1) {
            data[$(fields[index]).attr('name')] = parseFloat($(fields[index]).val());
        } else {
            data[$(fields[index]).attr('name')] = $(fields[index]).val();
        }
    }
    let stageId = data.id;
    data = JSON.stringify(data);

    /*$.ajax({
     type: "PUT",
     url: "stageUrl/" + stageId,
     data: data,
     success: function (data) {
     console.log(data);
     }
     })*/
};

let deleteStage = function () {
    let stageId = $(".read .delete").data('delete-id');

    /*$.ajax({
     type: "DELETE",
     url: "stageUrl/" + stageId,
     success: function (data) {
     console.log(data);
     }
     })*/
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

$(document).on("click", ".update-popup .submit", function () {
    deleteStage();
});




