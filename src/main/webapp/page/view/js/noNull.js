function validateForm() {
    var username = document.getElementById("exampleInputUsername1").value;
    var password = document.getElementById("exampleInputPassword1").value;
    var tipMessage = document.getElementById("tipMessage");

    if (username === "" || password === "") {
    tipMessage.innerText = "用户名和密码不能为空";
    return false; // 阻止表单提交
}

    // 如果用户名和密码不为空，则继续提交表单
    return true;
}

function validateR() {
    var username = document.getElementById("userName").value;
    var email = document.getElementById("userEmail").value;
    var password = document.getElementById("userPassword").value;
    var tipMessage = document.getElementById("tipMessage");

    if (username === "" || email === "" || password === "") {
        tipMessage.innerText = "用户名邮箱和密码均不能为空";
        return false; // 阻止表单提交
    }

    // 如果用户名和密码不为空，则继续提交表单
    return true;
}

function validateL() {
    var email = document.getElementById("userEmail").value;
    var password = document.getElementById("userPassword").value;
    var tipMessage = document.getElementById("tipMessage");

    if (email === "" || password === "") {
        tipMessage.innerText = "邮箱和密码不能为空";
        return false; // 阻止表单提交
    }

    // 如果用户名和密码不为空，则继续提交表单
    return true;
}