function isCurrent(Id_li) {
    var IdCurrent = document.getElementById(Id_li);
    var arrLi = new Array('ctl00_li_NavId');
    var arrUl = new Array('child_ul');

    for (var i = 1; i <= 5; i++) {
        var ac = arrLi[0] + i;
        var tempId = document.getElementById(arrLi[0] + i);
        var tempul = document.getElementById(arrUl[0] + i);
        if (tempId == IdCurrent) {
            if (tempul != null) {
                tempId.className = 'li_current';
                tempul.className = 'show';
            } else
                tempId.className = 'li_current';
        } else {
            if (tempul != null) {
                tempul.className = 'hide';
            }
            tempId.className = '';
        }
    }
    return false;
}
 
//----------- Login Start-----------
function clickButton(e, buttonid) {
    var evt = e ? e : window.event;
    var bt = document.getElementById(buttonid);
    if (bt) {
        if (evt.keyCode == 13) {
            bt.click();
            return false;
        }
    }
}
function isBlank(val) {
    if (val == null)
        return;
    for (var i = 0; i < val.length; i++) {
        if ((val.charAt(i) != ' ') && (val.charAt(i) != "\t") && (val.charAt(i) != "\n") && (val.charAt(i) != "\r")) {
            return false;
        }
    }
    return true;
}

function ClosePopup() {
    var Id = document.getElementById('PopupRegister');
    var idInfo = document.getElementById('wrapper');
    if (Id.className == 'show') {
        Id.className = 'hide';
        if (idInfo != null) {
            idInfo.className = '';
        }
    } else {
        Id.className = 'show';
        if (idInfo != null) {
            idInfo.className = 'disable';
        }
    }
}
function ClearForm() {
    var i;
    for (i = 0; (i < document.forms.length); i++) {
        document.forms[i].reset();
    }
    return false;
}
//----------- Login End-----------
function isFalse(flag) {
    return flag;
}

 