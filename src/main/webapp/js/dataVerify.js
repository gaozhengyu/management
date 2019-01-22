$("#studentInfo").bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        studentID: {
            message: 'The ID is not valid',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: '学号是12位'
                },
                regexp: {
                    regexp: /^[0-9]*$/,
                    message: '填写正确的学号'
                }
            }
        },
        studentName: {
            message: 'The Name is not valid',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },
                stringLength: {
                    min: 2,
                    max: 10,
                    message: '长度不符'
                },
                threshold: 1,
                regexp: {
                    regexp: /^[\u4e00-\u9fa5]+$/,
                    message: '填写中文名称'
                }
            }
        },
        studentEamil: {
            validators: {
                notEmpty: {
                    message: '邮件不能为空'
                },
                emailAddress: {
                    message: '请输入正确的邮件地址如：123@qq.com'
                }
            }
        },
        studentPhone: {
            message: 'The phone is not valid',
            validators: {
                notEmpty: {
                    message: '手机号码不能为空'
                },
                stringLength: {
                    min: 11,
                    max: 11,
                    message: '请输入11位手机号码'
                },
                regexp: {
                    regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                    message: '请输入正确的手机号码'
                }
            }
        },
        parentsPhone: {
            message: 'The phone is not valid',
            validators: {
                notEmpty: {
                    message: '手机号码不能为空'
                },
                stringLength: {
                    min: 11,
                    max: 11,
                    message: '请输入11位手机号码'
                },
                regexp: {
                    regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                    message: '请输入正确的手机号码'
                }
            }
        }
    }
});

$("#teacherInfo").bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        teacherID: {
            massage: 'The ID is not valid',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },
                stringLength: {
                    min: 4,
                    max: 4,
                    message: '长度不符'
                },
                regexp: {
                    regexp: /^[0-9]+$/,
                    message: '只能填写数字'
                }
            }
        },
        teacherName: {
            massage: 'The Name is not valid',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },
                stringLength: {
                    min: 2,
                    max: 10,
                    message: '长度不符'
                },
                threshold: 1,
                regexp: {
                    regexp: /^[\u4e00-\u9fa5]+$/,
                    message: '填写中文名称'
                }
            }
        },
        teacherEmail: {
            validators: {
                notEmpty: {
                    message: '邮件不能为空'
                },
                emailAddress: {
                    message: '请输入正确的邮件地址如：123@qq.com'
                }
            }
        },
        teacherPhone: {
            message: 'The phone is not valid',
            validators: {
                notEmpty: {
                    message: '手机号码不能为空'
                },
                stringLength: {
                    min: 11,
                    max: 11,
                    message: '请输入11位手机号码'
                },
                regexp: {
                    regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                    message: '请输入正确的手机号码'
                }
            }
        }
    }
});

$("#companyInfo").bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        companyID: {
            massage: 'The ID is not valid',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },
                stringLength: {
                    min: 1,
                    max: 8,
                    message: '长度不符'
                },
                regexp: {
                    regexp: /^[a-zA-Z][a-zA-Z0-9]+$/,
                    message: '由英文和数字组成，且开头是英文'
                }
            }
        },
        companyName: {
            massage: 'The Name is not valid',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },
                stringLength: {
                    min: 2,
                    max: 15,
                    message: '长度不符'
                },
                regexp: {
                    regexp: /^[\u4e00-\u9fa5]+$/,
                    message: '填写中文名称'
                }
            }
        },
        contacts: {
            validators: {
                notEmpty: {
                    message: '邮件不能为空'
                },
                stringLength: {
                    min: 2,
                    max: 10,
                    message: '长度不符'
                },
                regexp: {
                    regexp: /^[\u4e00-\u9fa5]+$/,
                    message: '填写中文名称'
                }
            }
        },
        companyPhone: {
            message: 'The phone is not valid',
            validators: {
                notEmpty: {
                    message: '手机号码不能为空'
                },
                stringLength: {
                    min: 11,
                    max: 11,
                    message: '请输入11位手机号码'
                },
                regexp: {
                    regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                    message: '请输入正确的手机号码'
                }
            }
        }
    }
});

$("#passwordInfo").bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        oldPassword: {
            massage: '密码无效',
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                identical: {
                    field: 'hiddenPassword',
                    message: '旧密码错误'
                }
            }
        },
        hiddenPassword: {
            validators: {
                identical: {
                    field: 'hiddenPassword',
                    message: ' '
                }
            }
        },
        password: {
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                identical: {
                    field: 'rePassword',
                    message: '两次密码不一致'
                },
                stringLength: {
                    min: 6,
                    max: 30,
                    message: '密码最少6位'
                },
                regexp: {
                    regexp: /^[a-zA-Z0-9]+$/,
                    message: '密码只能由数字和字母组成'
                }
            }
        },
        rePassword: {
            message: '密码无效',
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                stringLength: {
                    min: 6,
                    max: 30,
                    message: '密码最少6位'
                },
                identical: {
                    field: 'password',
                    message: '两次密码不一致'
                },
                regexp: {
                    regexp: /^[a-zA-Z0-9]+$/,
                    message: '密码只能由数字和字母组成'
                }
            }
        }
    }
});