function checkLogin(){
    let inputUsername = document.getElementById("InputUsername").value;
    let inputPassword = document.getElementById("InputPassword").value;
    if(inputUsername == null || inputUsername.trim() === ""){

    return false;
}
    if(inputPassword == null || inputPassword.trim() === ""){

    return false;
}

    return true;
}
