function docAjax() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest(); // code for IE7+, Firefox, Chrome, Opera, Safari
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); // code for IE6, IE5
    }
    return xmlhttp;
}
function LoadAjax(xmlhttp) {
    if (typeof xmlhttp != "undefined") {
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                ProcessAjax(xmlhttp);
            }
        };
    } 
    xmlhttp.open("POST","Demo.html", true); 
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
    xmlhttp.send("FirstName=abcs&LastName=truongnn1"); 
} 
function ProcessAjax(xmlhttp) {
    var flag = xmlhttp.responseText;  
    if(flag == "True")
    { 
        removeDiv('lg-Info');
        return Implement('div','ID','display','lg-Info');
    }else{
        alert("UserName hoặc Password không đúng..!");
    }
}
function RunAjax()
{
    var xmlhttp = docAjax();
    LoadAjax(xmlhttp);
}
function Implement(tagName,Name,vlues,dID)
{
    var d = document.getElementById(dID);
    Creatediv(tagName,Name,vlues,d);
    return false;
}
function Creatediv(tagName,Name,vlues,d)
{
    var divID = document.createElement(tagName);
     divID.setAttribute(Name,vlues); 
     divID.innerText = 'abc';
    d.appendChild(divID);
} 