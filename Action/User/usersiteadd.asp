<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<script language=JavaScript>
$(function(){

$("#submit").click(function(){

siteurl = $('#siteurl').val().toLowerCase();


if(siteurl == ""){
 alert('����д����', '', function () {$("#siteurl").focus();});
 return false;
}

if(isDomain(siteurl)==false){
 alert('������ʽ����ȷ����д��a.com������������', '', function () {$("#siteurl").focus();});
 return false;
}
 
if(siteurl.substring(0,4)=="www."){
 alert('������Ҫ��www.��ͷ', '', function () {$("#siteurl").focus();});
 return false;
}
 
if($('#siteclassid').val()==""){
 alert('��ѡ�����', '', function () {$("#siteclassid").focus();});
 return false;
}
 
});

});

</script>

<a href="?Action=usersitelist" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form_usersite" method="post" onsubmit="return usersiteaddcheck()" action="../../User.aspx?Action=usersiteaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">���������ַ</td>
    </tr>
    <tr> 
      <td width="80" class="td_r">��վ������</td>
      <td><input name="siteurl" id="siteurl" type="text" size="30"> 
        <br>
        (˵����������д�������Ϳ��ԣ���qqcf.com���������������ж�����������Ч!)
		</td>
    </tr>
    <tr> 
      <td class="td_r">��վ���ࣺ</td>
      <td>
<select name="siteclassid" id="siteclassid">
<option selected value="">��ѡ�����</option>
<%
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
%>
<option value="<%=Rs("ID")%>"><%=Rs("SiteClassName")%></option>
<%
Rs.MoveNext
Wend
%>
</select>
      </td>
    </tr>
    <tr> 
      <td></td>
	  <td>
          <input type="submit" name="submit" id="submit" value="����" class="btn btn-primary">
      </td>
    </tr>
</table></form>