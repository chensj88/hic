(function ($) {
        $.fn.extend({
            //给表单设置值
            initForm: function (options) {
                // 默认参数
                var defaults = {
                    jsonValue: options,
                    isDebug: false
                    // 是否需要调试，这个用于开发阶段，发布阶段请将设置为false，默认为false,true将会把name
                    // value打印出来
                };

                // 设置参数
                var setting = defaults;
                var form = this;
                jsonValue = setting.jsonValue;
                // 如果传入的json字符串，将转为json对象
                if ($.type(setting.jsonValue) === "string") {
                    jsonValue = $.parseJSON(jsonValue);
                }
                // 如果传入的json对象为空，则不做任何操作
                if (!$.isEmptyObject(jsonValue)) {
                    var debugInfo = "";
                    $.each(jsonValue,
                        function (key, value) {
                            // 是否开启调试，开启将会把name value打印出来
                            if (setting.isDebug) {
                                alert("name:" + key + "; value:" + value);
                                debugInfo += "name:" + key + "; value:" + value + " || ";
                            }
                            var formField = form.find("[name='" + key + "']");
                            if ($.type(formField[0]) === "undefined") {
                                if (setting.isDebug) {
                                    alert("can not find name:[" + key + "] in form!!!"); // 没找到指定name的表单
                                }
                            } else {
                                var fieldTagName = formField[0].tagName.toLowerCase();
                                if (fieldTagName == "input") {
                                    if (formField.attr("type") == "radio") {
                                        $("input:radio[name='" + key + "'][value='" + value
                                            + "']").attr("checked",
                                            "checked");
                                    } else {
                                        formField.val(value);
                                    }
                                    //下拉框
                                } else if (fieldTagName == "select") {
                                    var options = formField.find('option');
                                    for (var j = 0; j < options.length; j++) {
                                        if ($(options[j]).val() == value) {
                                            $(options[j]).attr("selected", "selected");
                                        }
                                    }
                                } else if (fieldTagName == "textarea") {
                                    formField.val(value);
                                } else {
                                    formField.val(value);
                                }
                            }
                        });
                    if (setting.isDebug) {
                        alert(debugInfo);
                    }
                }
                return form; // 返回对象，提供链式操作
            }
        });
        window.Ewin = function () {
            var html = '<div id="[Id]" class="modal fade" role="dialog" aria-labelledby="modalLabel">' +
                '<div class="modal-dialog modal-sm">' +
                '<div class="modal-content">' +
                '<div class="modal-header">' +
                '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
                '<h4 class="modal-title" id="modalLabel">[Title]</h4>' +
                '</div>' +
                '<div class="modal-body">' +
                '<p>[Message]</p>' +
                '</div>' +
                '<div class="modal-footer">' +
                '<button type="button" class="btn btn-primary ok" data-dismiss="modal">[BtnOk]</button>' +
                '<button type="button" class="btn btn-default cancel" data-dismiss="modal">[BtnCancel]</button>' +

                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';


            var dialogdHtml = '<div id="[Id]" class="modal fade" role="dialog" aria-labelledby="modalLabel">' +
                '<div class="modal-dialog">' +
                '<div class="modal-content">' +
                '<div class="modal-header">' +
                '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
                '<h4 class="modal-title" id="modalLabel">[Title]</h4>' +
                '</div>' +
                '<div class="modal-body">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
            var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
            var generateId = function () {
                var date = new Date();
                return 'mdl' + date.valueOf();
            };
            var init = function (options) {
                options = $.extend({}, {
                    title: "操作提示",
                    message: "提示内容",
                    btnok: "确定",
                    btncl: "取消",
                    width: 200,
                    auto: false
                }, options || {});
                var modalId = generateId();
                var content = html.replace(reg, function (node, key) {
                    return {
                        Id: modalId,
                        Title: options.title,
                        Message: options.message,
                        BtnOk: options.btnok,
                        BtnCancel: options.btncl
                    }[key];
                });
                $('body').append(content);
                $('#' + modalId).modal({
                    width: options.width,
                    backdrop: 'static'
                });
                $('#' + modalId).on('hide.bs.modal', function (e) {
                    $('body').find('#' + modalId).remove();
                });
                return modalId;
            };

            return {
                alert: function (options) {
                    if (typeof options == 'string') {
                        options = {
                            message: options
                        };
                    }
                    var id = init(options);
                    var modal = $('#' + id);
                    modal.find('.ok').removeClass('btn-success').addClass('btn-primary');
                    modal.find('.cancel').hide();

                    return {
                        id: id,
                        on: function (callback) {
                            if (callback && callback instanceof Function) {
                                modal.find('.ok').click(function () {
                                    callback(true);
                                });
                            }
                        },
                        hide: function (callback) {
                            if (callback && callback instanceof Function) {
                                modal.on('hide.bs.modal', function (e) {
                                    callback(e);
                                });
                            }
                        }
                    };
                },
                confirm: function (options) {
                    var id = init(options);
                    var modal = $('#' + id);
                    modal.find('.ok').removeClass('btn-primary').addClass('btn-success');
                    modal.find('.cancel').show();
                    return {
                        id: id,
                        on: function (callback) {
                            if (callback && callback instanceof Function) {
                                modal.find('.ok').click(function () {
                                    callback(true);
                                });
                                modal.find('.cancel').click(function () {
                                    callback(false);
                                });
                            }
                        },
                        hide: function (callback) {
                            if (callback && callback instanceof Function) {
                                modal.on('hide.bs.modal', function (e) {
                                    callback(e);
                                });
                            }
                        }
                    };
                },
                dialog: function (options) {
                    options = $.extend({}, {
                        title: 'title',
                        url: '',
                        width: 800,
                        height: 550,
                        onReady: function () {
                        },
                        onShown: function (e) {
                        }
                    }, options || {});
                    var modalId = generateId();

                    var content = dialogdHtml.replace(reg, function (node, key) {
                        return {
                            Id: modalId,
                            Title: options.title
                        }[key];
                    });
                    $('body').append(content);
                    var target = $('#' + modalId);
                    target.find('.modal-body').load(options.url);
                    if (options.onReady())
                        options.onReady.call(target);
                    target.modal();
                    target.on('shown.bs.modal', function (e) {
                        if (options.onReady(e))
                            options.onReady.call(target, e);
                    });
                    target.on('hide.bs.modal', function (e) {
                        $('body').find(target).remove();
                    });
                }
            }
        }();
    }
)(jQuery);