<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<%
ID=ChkStr(request("ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_SysInfo where ID="&ID
Rs.open Sql,Conn,1,1
%>

<script>
$(function(){

$("#infomodify").click(function(){

if ($('#assort').val()==""){
 alert('��ѡ�����', '', function () {$("#assort").focus();});
 return false;
}

if ($('#title').val()==""){
 alert('���������д', '', function () {$("#title").focus();});
 return false;
}

if ($('#addtime').val()==""){
 alert('ʱ�������д', '', function () {$("#addtime").focus();});
 return false;
}

if ($('#listid').val()==""){
 alert('�ö����ֱ�����д', '', function () {$("#listid").focus();});
 return false;
}

if ($('#listid').val()<0){
 alert('�ö����ֱ�����ڻ����0', '', function () {$("#listid").focus();});
 return false;
}


if ($('#infokeyword').val()!=""&&getByteLen($('#infokeyword').val())>255){
 alert('���¹ؼ���������ַ���:255��,������������', '', function () {$("#infokeyword").focus();});
 return false;
}

if ($('#infodesc').val()!=""&&getByteLen($('#infodesc').val())>255){
 alert('��������������ַ���:255��,������������', '', function () {$("#infodesc").focus();});
 return false;
}

if ($('#infolabel').val()!=""&&getByteLen($('#infolabel').val())>255){
 alert('���±�ǩ������ַ���:255��,������������', '', function () {$("#infolabel").focus();});
 return false;
}

return true;

});


});

</script>


<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form id="form_infomodify" name="form_infomodify" method="post" action="../../AdminUser.aspx?Action=infomodifysave&id=<%=id%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infomodifycheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">����Ͱ����޸�</td>
</tr>
<tr> 
<td width="100" class="td_r">���ࣺ</td>
<td>

<select name="assort" id="assort">
<option  value="">��ѡ�����</option>
<%

Sql="Select * From CFWztg_SysInfoClass Order By ID"
Set Rs2= Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"<%If Rs("Assort")=Rs2("ID") Then Response.write " selected"%>><%=Rs2("InfoClassName")%></option>
<%
Rs2.MoveNext
Wend
Rs2.Close
%>
</select>*��ѡ��
</td>
</tr>

<tr>
<td class="td_r">���⣺</td>
<td><input name="title" type="text" id="title" value="<%=server.HTMLEncode(rs("Title"))%>" size="62">*������</td>
</tr>
<tr> 
<td class="td_r">���ݣ�</td>
<td>
<input type="hidden" id="content" name="content" value="<%=Server.HTMLEncode(rs("Content"))%>" style="display:none" /><input type="hidden" id="FCKeditor1___Config" value="" style="display:none" /><iframe id="FCKeditor1___Frame" src="../../js/FckEditor/editor/fckeditor.html?InstanceName=content&amp;Toolbar=Default" width="580" height="350" frameborder="0" scrolling="no"></iframe></td>
</tr>
<tr>
<td class="td_r">ʱ�䣺</td>
<td><input name="addtime" type="text" id="addtime" value="<%=rs("AddTime")%>" size="62">*������</td>
</tr>
<tr>
<td class="td_r">�ö����֣�</td>
<td><input name="listid" type="text" id="listid" value="<%=rs("ListID")%>" size="10">*������(0���ö�������0���ö�������Խ��Խ���ϣ�������ͬԽ����Խ����)</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">SEO��Ϣ</td>
</tr>
<tr>
<td class="td_r">���¹ؼ��֣�</td>
<td><input name="infokeyword" type="text" id="infokeyword" size="82"  value="<%=rs("infokeyword")%>">�Ǳ�����
</td>
</tr>
<tr>
<td class="td_r">����������</td>
<td><input name="infodesc" type="text" id="infodesc" size="82"  value="<%=rs("infodesc")%>">�Ǳ�����
</td>
</tr>
<tr>
<td class="td_r">���±�ǩ��</td>
<td><input name="infolabel" type="text" id="infolabel" size="82"  value="<%=rs("infolabel")%>">�Ǳ�����
</td>
</tr>

<tr> 
<td></td>
<td> 
<input type="submit" name="infomodify" id="infomodify" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>
</form>
