<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<%
AdUserName=ChkStr(Request("AdUserName"),1)
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"><td colspan='6'>图片上传</td></tr>

<tr><td colspan='6'>
    
    
<table width="100%" >
      <td width="180" class="td_r">上传前先选择广告主：</td>
      <td>
<select name='AdUserName' id='AdUserName' onChange="window.location='?Action=imglist&AdUserName='+document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value">
<option value=''>请选择广告主</option>
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
<td class="td_r">再选择本地需上传的图片：</td>
<td><iframe style="top:2px" ID="UploadFiles" src="../../include/Upfile.asp?UserType=adminuser&Site=imglist&AdUserName=<%=AdUserName%>" frameborder=0 scrolling=no width="400" height="30" allowtransparency="true"></iframe></td></tr>
<%end If%>

</table>

</td></tr>


<tr class="tr_1">
<td colspan='6'><span class="title">图片列表</span></td>
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

Response.write "<br><a href='../../upload/"&Rs("FileName")&"' target='_blank'>查看源文件</a><br>"
Response.write "文件名："&Rs("FileName")&"<br>"
Response.write "文件大小：" & CLng(Rs("FileSizeNum")/1024) &"k<br>"
Response.write "上传时间："&Rs("AddTime")&"<br>"
Response.write "上传广告主："&Rs("AdUserName")&"<br>"

Sql="Select Count(1) From CFWztg_Ad Where Ad Like '%"&Rs("FileName")&"%'"
Set Rs2=Conn.Execute(Sql)
Response.write "被多少个广告在使用：" & Rs2(0) &"个<br>"

Response.write "绝对路径：<input id='target"&Rs("ID")&"' type='text' value='"&AdPath&"upload/"&Rs("FileName")&"' size='15' readonly style=""background='#e8e8e8';"">"
Response.write "<input type='button' value='复制' data-clipboard-action='copy' data-clipboard-target='#target"&Rs("ID")&"' id='copy_btn"&Rs("ID")&"' class='btn btn-sm btn-primary'>"

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
 AlertStr="确定要删除吗?"
Else
 AlertStr="这个文件已经有"&Rs2(0)&"个广告在使用，确定要删除吗?"
End If
Rs2.Close()

Response.write "操作：<a href=""javascript:;"" onclick=""$(function () { confirm('"&AlertStr&"', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=imgdel&FileName="&Rs("FileName")&"')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> 删除</a><br>"


%>
</td>
<%
if jishu mod linenum=0 then
Response.write "</tr>"

end if
jishu=jishu+1
mypagesize=mypagesize-1
Rs.movenext
wend '写tr和td,jishu mod 列数为1时开始tr,为0时结束tr
Rs.Close
jishu=jishu-1
if jishu mod linenum <> 0 then
for i= 1 to linenum-(jishu mod linenum)
	response.write "<td width='"&tdwidth&"'>&nbsp;</td>"
	if  i = linenum-(jishu mod linenum) then response.write "</tr>"
next
end if '判断最后一行tr是否正好闭合,否则增加td,里面填入空格
%>
</table>

<script>    
    $(document).ready(function(){       
        var clipboard = new Clipboard('#copy_btn');    
        clipboard.on('success', function(e) {    
            alert("测试内容复制成功",1500); 
            e.clearSelection();    
            console.log(e.clearSelection);    
        });    
    });    
</script>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
