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
AdUserName=ChkStr(Request("AdUserName"),1)
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"><td colspan='6'>ͼƬ�ϴ�</td></tr>

<tr><td colspan='6'>
    
    
<table width="100%" >
      <td width="180" class="td_r">�ϴ�ǰ��ѡ��������</td>
      <td>
<select name='AdUserName' id='AdUserName' onChange="window.location='?Action=imglist&AdUserName='+document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value">
<option value=''>��ѡ������</option>
<%
Sql="Select UserName From CFWztg_User Where UserType=2 And UserState=1 Order By UserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("UserName")&"'"
 If AdUserName=Rs("UserName") Then Response.write " selected"
 Response.Write ">"&Rs("UserName")&"</option>"
Rs.MoveNext
Wend
Rs.Close
%>
</select>*
</td>
</tr>
<%If AdUserName<>"" Then%>
<tr>
<td class="td_r">��ѡ�񱾵����ϴ���ͼƬ��</td>
<td><iframe style="top:2px" ID="UploadFiles" src="../../include/Upfile.asp?UserType=adminuser&Site=imglist&AdUserName=<%=AdUserName%>" frameborder=0 scrolling=no width="400" height="30" allowtransparency="true"></iframe></td></tr>
<%end If%>

</table>

</td></tr>


<tr class="tr_1">
<td colspan='6'><span class="title">ͼƬ�б�</span></td>
</tr>



<%
PageUrl = "?Action="&Action


Sql="Select * From CFWztg_UpFile Where 1=1 Order By AddTime Desc"

Set Rs=Server.CreateObject("Adodb.RecordSet")
Rs.open Sql,Conn,1,1

linenum=3
tdwidth=int(100/linenum)&"%"
jishu=1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=6
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If
While Not Rs.Eof And MyPageSize>0

if jishu mod linenum=1 or linenum=1 then
Response.write "<tr>"
end if%>
            <td width="<%=tdwidth%>" valign="top">
<%
If Instr(Lcase(Rs("FileName")),".swf")>0 Then
 response.write "<param name='movie' value='../../upload/"&Rs("FileName")&"'>"
 response.write "<param name='quality' value='high'>"
 response.write "<embed src='../../upload/"&Rs("FileName")&"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='160' height='160'></embed></object>"
ElseIf Instr(Lcase(Rs("FileName")),".jpg")>0 or Instr(Lcase(Rs("FileName")),".gif")>0 Then
 Response.write "<img src='../../upload/"&Rs("FileName")&"' width=160 height=160>"
End If

Response.write "<br><a href='../../upload/"&Rs("FileName")&"' target='_blank'>�鿴Դ�ļ�</a><br>"
Response.write "�ļ�����"&Rs("FileName")&"<br>"
Response.write "�ļ���С��" & CLng(Rs("FileSizeNum")/1024) &"k<br>"
Response.write "�ϴ�ʱ�䣺"&Rs("AddTime")&"<br>"
Response.write "�ϴ��������"&Rs("AdUserName")&"<br>"

Sql="Select Count(1) From CFWztg_Ad Where Ad Like '%"&Rs("FileName")&"%'"
Set Rs2=Conn.Execute(Sql)
Response.write "�����ٸ������ʹ�ã�" & Rs2(0) &"��<br>"

Response.write "����·����<input id='target"&Rs("ID")&"' type='text' value='"&AdPath&"upload/"&Rs("FileName")&"' size='15' readonly style=""background='#e8e8e8';"">"
Response.write "<input type='button' value='����' data-clipboard-action='copy' data-clipboard-target='#target"&Rs("ID")&"' id='copy_btn"&Rs("ID")&"' class='btn btn-sm btn-primary'>"

Response.write "<script>"
Response.write "$(function(){"
Response.write "var clipboard = new Clipboard('#copy_btn"&Rs("ID")&"');"
Response.write "clipboard.on('success', function(e) {"
Response.write "e.clearSelection();"
Response.write "console.log(e.clearSelection);"
Response.write "});"
Response.write "});"
Response.write "</script>"

Response.write "<br>"


If Rs2(0)=0 Then
 AlertStr="ȷ��Ҫɾ����?"
Else
 AlertStr="����ļ��Ѿ���"&Rs2(0)&"�������ʹ�ã�ȷ��Ҫɾ����?"
End If
Rs2.Close()

Response.write "������<a href=""javascript:;"" onclick=""$(function () { confirm('"&AlertStr&"', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=imgdel&FileName="&Rs("FileName")&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> ɾ��</a><br>"


%>
</td>
<%
if jishu mod linenum=0 then
Response.write "</tr>"

end if
jishu=jishu+1
mypagesize=mypagesize-1
Rs.movenext
wend 'дtr��td,jishu mod ����Ϊ1ʱ��ʼtr,Ϊ0ʱ����tr
Rs.Close
jishu=jishu-1
if jishu mod linenum <> 0 then
for i= 1 to linenum-(jishu mod linenum)
	response.write "<td width='"&tdwidth&"'>&nbsp;</td>"
	if  i = linenum-(jishu mod linenum) then response.write "</tr>"
next
end if '�ж����һ��tr�Ƿ����ñպ�,��������td,��������ո�
%>
</table>

<script>    
    $(document).ready(function(){       
        var clipboard = new Clipboard('#copy_btn');    
        clipboard.on('success', function(e) {    
            alert("�������ݸ��Ƴɹ�",1500); 
            e.clearSelection();    
            console.log(e.clearSelection);    
        });    
    });    
</script>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
