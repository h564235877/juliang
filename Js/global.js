function selectcheckbox(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall' && e.disabled != true) e.checked = form.chkall.checked;
    }
}


function gotoUrl(url){
    if(document.all){
        var gotoLink = document.createElement('a');
        gotoLink.href = url;
        document.body.appendChild(gotoLink);
        gotoLink .click();
    }
    else window.location.href = url;
}


function getByteLen(val) {
var len = 0;

for (var i = 0; i < val.length; i++) {
 var a = val.charAt(i);
 if (a.match(/[^\x00-\xff]/ig) != null){
  len += 2;
 }else{
  len += 1;
 }
}

return len;
}


function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}


function chkname(String){ 
var Letters = "abcdefghijklmnopqrstuvwxyz1234567890_";
var i;
var c;
if(String.charAt( 0 )=='-')
return false;
if( String.charAt( String.length - 1 ) == '-' )
return false;
for( i = 0; i < String.length; i ++ )
{
c = String.charAt( i );
if (Letters.indexOf( c ) < 0)
return false;
}
return true;
}


function isValidEmail(s){
 var reg1 = new RegExp('^[a-zA-Z0-9][a-zA-Z0-9@._-]{3,}[a-zA-Z]$');
 var reg2 = new RegExp('[@.]{2}');
 if (s.search(reg1) == -1
  || s.indexOf('@') == -1
  || s.lastIndexOf('.') < s.lastIndexOf('@')
  || s.lastIndexOf('@') != s.indexOf('@')
  || s.search(reg2) != -1)
  return false;		
 return true;
}


function isDomain(s){
var regu = "^[0-9a-zA-Z\.\-]+$"; 
var re = new RegExp(regu); 
if (re.test(s)) { 
return true; 
}else{ 
return false; 
}
}


function isDate(str) {
var reg = /^(\d+)-(\d{1,2})-(\d{1,2})$/;
var r = str.match(reg);
if(r==null)return false;
r[2]=r[2]-1;
var d= new Date(r[1], r[2],r[3]);
if(d.getFullYear()!=r[1])return false;
if(d.getMonth()!=r[2])return false;
if(d.getDate()!=r[3])return false;
return true;
}