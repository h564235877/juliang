<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"><td colspan='6'>ͼƬ�ϴ�</td></tr>
<tr><td colspan='6'><iframe style="top:2px" ID="UploadFiles" src="../../include/Upfile.asp?UserType=aduser&Site=imglist" frameborder=0 scrolling=no width="400" height="30" allowtransparency="true"></iframe></td></tr>

<tr class="tr_1"><td colspan='6'>ͼƬ�б�</td></tr>
<%
PageUrl = "?Action="&Action


Sql="Select * From CFWztg_UpFile Where AdUserName='"&AdUserName&"' Order By AddTime Desc"

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

Sql="Select Count(1) From CFWztg_Ad Where Ad Like '%"&Rs("FileName")&"%'"
Set Rs2=Conn.Execute(Sql)
Response.write "�����ٸ������ʹ�ã�" & Rs2(0) &"��<br>"

Response.write "����·����<input id='img"&Rs("ID")&"' type='text' value='"&AdPath&"upload/"&Rs("FileName")&"' size='15' readonly style=""background='#e8e8e8';"">"
Response.write "<input type='button' value='����' id='copy_btn"&Rs("ID")&"' data-clipboard-target='#img"&Rs("ID")&"' data-clipboard-action='copy' class='btn btn-sm btn-primary'>"

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

 Response.write "������<a href=""javascript:;"" onclick=""$(function () { confirm('"&AlertStr&"?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=imgdel&FileName="&Rs("FileName")&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> ɾ��</a><br>"

End If
Rs2.Close()
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
	
<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
