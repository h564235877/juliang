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
'������action�жϵĻ���©�������ļ�����Ϣ
If Action<>"templatelist" Then Response.End

TemplateType=ChkStr(Request("TemplateType"),1)
If TemplateType="" Then TemplateType="index"
%>

<ul class="tab">
<li><a href="?Action=<%=Action%>&TemplateType=index"<%If TemplateType="index" Then Response.write " class='selected'"%>><span>ǰ̨ģ��</span></a></li>
<li><a href="?Action=<%=Action%>&TemplateType=user"<%If TemplateType="user" Then Response.write " class='selected'"%>><span>��վ����̨ģ��</span></a></li>
<li><a href="?Action=<%=Action%>&TemplateType=aduser"<%If TemplateType="aduser" Then Response.write " class='selected'"%>><span>�������̨ģ��</span></a></li>
<li><a href="?Action=<%=Action%>&TemplateType=seuser"<%If TemplateType="seuser" Then Response.write " class='selected'"%>><span>�ͷ���̨ģ��</span></a></li>
<li><a href="?Action=<%=Action%>&TemplateType=couser"<%If TemplateType="couser" Then Response.write " class='selected'"%>><span>�����̨ģ��</span></a></li>
<li><a href="?Action=<%=Action%>&TemplateType=adminuser"<%If TemplateType="adminuser" Then Response.write " class='selected'"%>><span>����Ա��̨ģ��</span></a></li>


<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_SysLabel" class=''><span>ǰ̨��ǩ</span></a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_AdCode" class=''><span>��ѭ��ý����ģ��</span></a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_MixCode" class=''><span>��ϸ�ý����ģ��</span></a></li>
</ul>

<table class="tb_2">

<tr>
<td>
<%
Response.write "<select name='setsite' id='setsite' onChange=""window.location=document.getElementById('setsite').options[document.getElementById('setsite').selectedIndex].value"">"

Response.write "<option value='?Action=setbclasslist'>����ѡ����Ҫ���õ�ѡ��</option>"


Sql="Select * From CFWztg_SetBClass where SetBClassFlag<>'AdminPower' Order By SetTaxis"
Set Rs1=Conn.Execute(Sql)
While Not Rs1.Eof

Response.write "<option value='?Action=setsclasslist&SetBclassFlag="&Rs1("SetBClassFlag")&"'"
If Action="setsclasslist" And Chkstr(Request("SetBclassFlag"),1)=Rs1("SetBClassFlag") Then Response.write " selected"
Response.write ">"&Rs1("SetBClassDesc")&"["&Rs1("SetBClassFlag")&"]</option>"

Sql="Select * From CFWztg_SetSClass Where SetBClassFlag='"&Rs1("SetBClassFlag")&"' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 Response.write "<option value='?Action=setcontentlist&SetBClassFlag="&Rs1("SetBClassFlag")&"&SetSClassFlag="&Rs2("SetSClassFlag")&"'"
 If Action="setcontentlist" And Chkstr(Request("SetBclassFlag"),1)=Rs1("SetBClassFlag") And Chkstr(Request("SetSClassFlag"),1)=Rs2("SetSClassFlag") Then Response.write " selected"
 Response.write ">----"&Rs2("SetSClassDesc")&"["&Rs2("SetSClassFlag")&"]</option>"
 
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='"&Rs1("SetBClassFlag")&"' and SetSClassFlag='"&Rs2("SetSClassFlag")&"' Order By SetTaxis"
Set Rs3=Conn.Execute(Sql)
While Not Rs3.Eof
 Response.write "<option value='?Action=setcontentmodify&SetFlag="&Rs3("SetFlag")&"'"
  If Action="setcontentmodify" And Chkstr(Request("SetFlag"),1)=Rs3("SetFlag") Then Response.write " selected"
 Response.write ">--------"&Rs3("SetDesc")&"["&Rs3("SetFlag")&"]</option>"
Rs3.movenext
Wend
Rs3.Close

Rs2.movenext
Wend
Rs2.Close


Rs1.movenext
Wend
Rs1.Close
Response.write "</select>"
%>
</td>
</tr>


</table>
  
<%If TemplateType="index" Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
<strong>ǰ̨ģ��˵����</strong><br />
1.ǰ̨ģ����ڳ����Ŀ¼��templateĿ¼�Ĭ��ģ��Ŀ¼Ϊ"default"<br />
2.ģ��Ŀ¼���small.jpgΪ����Сͼ��big.jpgΪ��ͼ<br />
3.���Ժ��ֻ�����ѡ��ͬ��ģ��
</div>
</td>
</tr>
</table>

<div style="margin:20px 10px;width:820px;">
<ul>
<%
foldername=server.mappath("../../template")
path=foldername
If Instr(path,"\template")=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList_templet(path)

I=0
J=0
Function ShowFolderList_templet(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 

'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<li style="float:left;width:33%;border-bottom: 1px dotted <%=TableBorderColor%>;empty-cells:show;margin-bottom:10px;"> 
<%
 FilePath=Server.mappath("../../template/"&f1.name&"/small.jpg")
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 if Fs.FileExists(FilePath) = true Then
  Response.write "<a href='../../template/"&f1.name&"/big.jpg' target='_blank'><img src='../../template/"&f1.name&"/small.jpg' width='200' height='248' border='0'></a><br>"
 Else
  Response.write "<img src='../../images/notemplatepreview.jpg' width='200' height='248' border='0'><br>"
 End If

Response.write "ģ�����ƣ�"&f1.name &"<br>"


  If Lcase("template/"&f1.name)=LCase(TemplateName) Then
   Response.write "<font color='#ff0000'>PC����ʹ�ô�ģ��</font>"
   I=1
  Else
   Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ������ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=index&TemplateName=template/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">����ʹ�ô�ģ��</a>"
  End If

  If Lcase("template/"&f1.name)=LCase(TemplateName_M) Then
   Response.write "&nbsp;&nbsp;<font color='#ff0000'>�ֻ�����ʹ�ô�ģ��</font>"
   J=1
  Else
   Response.write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ���ֻ�ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=index_m&TemplateName=template/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">�ֻ�ʹ�ô�ģ��</a>"
  End If
%>
</li>

<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"

If I=0 Then Response.write "<script>$(function () { alert('ǰ̨��PCģ��û��ѡ����ѡ��һ��');});</script>"
If J=0 Then Response.write "<script>$(function () { alert('ǰ̨���ֻ�ģ��û��ѡ����ѡ��һ��');});</script>"
%>
</ul>
</div>

<%End Function %>

<%End If%>



<%If TemplateType="user" Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
<strong>��վ����̨ģ��˵����</strong><br />
1.��վ��ģ����ڳ����Ŀ¼�µ�UserĿ¼�Ĭ��ģ��Ŀ¼Ϊ"default"<br />
2.ģ��Ŀ¼���small.jpgΪ����Сͼ��big.jpgΪ��ͼ<br />
3.���Ժ��ֻ�����ѡ��ͬ��ģ��
</div>
</td>
</tr>
</table>


<div style="margin:20px 10px;width:820px;">
<ul>
<%
foldername=server.mappath("../../user/")
path=foldername
If Instr(path,"\user")=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList_usertemplet(path)


I=0
J=0
Function ShowFolderList_usertemplet(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 

'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<%
 FilePath=Server.mappath("../../user/"&f1.name&"/small.jpg")
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 if Fs.FileExists(FilePath) = true Then
  Response.write "<li style='float:left;width:33%;border-bottom: 1px dotted #cccccc;empty-cells:show;margin-bottom:10px;'>"
  Response.write "<a href='../../user/"&f1.name&"/big.jpg' target='_blank'><img src='../../user/"&f1.name&"/small.jpg' width='200' height='248' border='0'></a><br>"

  Response.write "ģ�����ƣ�"&f1.name &"<br>"

  If Lcase("user/"&f1.name)=LCase(UserManagePath) Then
   Response.write "<font color='#ff0000'>PC����ʹ�ô�ģ��</font>"
   I=1
  Else
   Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ������ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=user&TemplateName=user/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">����ʹ�ô�ģ��</a>"
  End If

  If Lcase("user/"&f1.name)=LCase(UserManagePath_M) Then
   Response.write "&nbsp;&nbsp;<font color='#ff0000'>�ֻ�����ʹ�ô�ģ��</font>"
   J=1
  Else
   Response.write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ���ֻ�ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=user_m&TemplateName=user/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">�ֻ�ʹ�ô�ģ��</a>"
  End If
 End If
%>
</li>

<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"

If I=0 Then Response.write "<script>$(function () { alert('��վ����̨��PCģ��û��ѡ����ѡ��һ��');});</script>"
If J=0 Then Response.write "<script>$(function () { alert('��վ����̨���ֻ�ģ��û��ѡ����ѡ��һ��');});</script>"
%>
</ul>
</div>

<%End Function %>

<%End If%>


<%If TemplateType="aduser" Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
<strong>�������̨ģ��˵����</strong><br />
1.�����ģ����ڳ����Ŀ¼�µ�AdUserĿ¼�Ĭ��ģ��Ŀ¼Ϊ"default"<br />
2.ģ��Ŀ¼���small.jpgΪ����Сͼ��big.jpgΪ��ͼ<br />
3.���Ժ��ֻ�����ѡ��ͬ��ģ��
</div>
</td>
</tr>
</table>

<div style="margin:20px 10px;width:820px;">
<ul>
<%
foldername=server.mappath("../../aduser")
path=foldername
If Instr(path,"\aduser")=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList_adusertemplet(path) 


I=0
J=0
Function ShowFolderList_adusertemplet(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 

'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<%
 FilePath=Server.mappath("../../aduser/"&f1.name&"/small.jpg")
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 if Fs.FileExists(FilePath) = true Then
  Response.write "<li style='float:left;width:33%;border-bottom: 1px dotted #cccccc;empty-cells:show;margin-bottom:10px;'>"
  Response.write "<a href='../../aduser/"&f1.name&"/big.jpg' target='_blank'><img src='../../aduser/"&f1.name&"/small.jpg' width='200' height='248' border='0'></a><br>"
  
  Response.write "ģ�����ƣ�"&f1.name &"<br>"

  If Lcase("aduser/"&f1.name)=LCase(AdUserManagePath) Then
   Response.write "<font color='#ff0000'>PC����ʹ�ô�ģ��</font>"
   I=1
  Else
   Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ������ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=aduser&TemplateName=aduser/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">����ʹ�ô�ģ��</a>"
  End If

  If Lcase("aduser/"&f1.name)=LCase(AdUserManagePath_M) Then
   Response.write "&nbsp;&nbsp;<font color='#ff0000'>�ֻ�����ʹ�ô�ģ��</font>"
   J=1
  Else
   Response.write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ���ֻ�ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=aduser_m&TemplateName=aduser/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">�ֻ�ʹ�ô�ģ��</a>"
  End If
 End If
%>
</li>

<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"

If I=0 Then Response.write "<script>$(function () { alert('�������̨��PCģ��û��ѡ����ѡ��һ��');});</script>"
If J=0 Then Response.write "<script>$(function () { alert('�������̨���ֻ�ģ��û��ѡ����ѡ��һ��');});</script>"
%>
</ul>
</div>

<%End Function %>

<%End If%>


<%If TemplateType="seuser" Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
<strong>�ͷ���̨ģ��˵����</strong><br />
1.�ͷ�ģ����ڳ����Ŀ¼�µ�SeUserĿ¼�Ĭ��ģ��Ŀ¼Ϊ"default"<br />
2.ģ��Ŀ¼���small.jpgΪ����Сͼ��big.jpgΪ��ͼ<br />
3.���Ժ��ֻ�����ѡ��ͬ��ģ��
</div>
</td>
</tr>
</table>

<div style="margin:20px 10px;width:820px;">
<ul>
<%
foldername=server.mappath("../../seuser")
path=foldername
If Instr(path,"\seuser")=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList_seusertemplet(path) 


I=0
J=0
Function ShowFolderList_seusertemplet(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 

'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<%
 FilePath=Server.mappath("../../seuser/"&f1.name&"/small.jpg")
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 if Fs.FileExists(FilePath) = true Then
  Response.write "<li style='float:left;width:33%;border-bottom: 1px dotted #cccccc;empty-cells:show;margin-bottom:10px;'>"
  Response.write "<a href='../../seuser/"&f1.name&"/big.jpg' target='_blank'><img src='../../seuser/"&f1.name&"/small.jpg' width='200' height='248' border='0'></a><br>"
  
  Response.write "ģ�����ƣ�"&f1.name &"<br>"

  If Lcase("seuser/"&f1.name)=LCase(SeUserManagePath) Then
   Response.write "<font color='#ff0000'>PC����ʹ�ô�ģ��</font>"
   I=1
  Else
   Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ������ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=seuser&TemplateName=seuser/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">����ʹ�ô�ģ��</a>"
  End If

  If Lcase("seuser/"&f1.name)=LCase(SeUserManagePath_M) Then
   Response.write "&nbsp;&nbsp;<font color='#ff0000'>�ֻ�����ʹ�ô�ģ��</font>"
   J=1
  Else
   Response.write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ���ֻ�ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=seuser_m&TemplateName=seuser/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">�ֻ�ʹ�ô�ģ��</a>"
  End If
 End If
%>
</li>

<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"

If I=0 Then Response.write "<script>$(function () { alert('�ͷ���̨��PCģ��û��ѡ����ѡ��һ��');});</script>"
If J=0 Then Response.write "<script>$(function () { alert('�ͷ���̨���ֻ�ģ��û��ѡ����ѡ��һ��');});</script>"
%>
</ul>
</div>

<%End Function %>

<%End If%>


<%If TemplateType="couser" Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
<strong>�����̨ģ��˵����</strong><br />
1.����ģ����ڳ����Ŀ¼�µ�CoUserĿ¼�Ĭ��ģ��Ŀ¼Ϊ"default"<br />
2.ģ��Ŀ¼���small.jpgΪ����Сͼ��big.jpgΪ��ͼ<br />
3.���Ժ��ֻ�����ѡ��ͬ��ģ��
</div>
</td>
</tr>
</table>

<div style="margin:20px 10px;width:820px;">
<ul>
<%
foldername=server.mappath("../../couser")
path=foldername
If Instr(path,"\couser")=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList_cousertemplet(path) 


I=0
J=0
Function ShowFolderList_cousertemplet(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 

'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<%
 FilePath=Server.mappath("../../couser/"&f1.name&"/small.jpg")
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 if Fs.FileExists(FilePath) = true Then
  Response.write "<li style='float:left;width:33%;border-bottom: 1px dotted #cccccc;empty-cells:show;margin-bottom:10px;'>"
  Response.write "<a href='../../couser/"&f1.name&"/big.jpg' target='_blank'><img src='../../couser/"&f1.name&"/small.jpg' width='200' height='248' border='0'></a><br>"
  
  Response.write "ģ�����ƣ�"&f1.name &"<br>"

  If Lcase("couser/"&f1.name)=LCase(CoUserManagePath) Then
   Response.write "<font color='#ff0000'>PC����ʹ�ô�ģ��</font>"
   I=1
  Else
   Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ������ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=couser&TemplateName=couser/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">����ʹ�ô�ģ��</a>"
  End If

  If Lcase("couser/"&f1.name)=LCase(CoUserManagePath_M) Then
   Response.write "&nbsp;&nbsp;<font color='#ff0000'>�ֻ�����ʹ�ô�ģ��</font>"
   J=1
  Else
   Response.write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ���ֻ�ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=couser_m&TemplateName=couser/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">�ֻ�ʹ�ô�ģ��</a>"
  End If
 End If
%>
</li>

<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"

If I=0 Then Response.write "<script>$(function () { alert('�����̨��PCģ��û��ѡ����ѡ��һ��');});</script>"
If J=0 Then Response.write "<script>$(function () { alert('�����̨���ֻ�ģ��û��ѡ����ѡ��һ��');});</script>"
%>
</ul>
</div>

<%End Function %>

<%End If%>


<%If TemplateType="adminuser" Then%>

<table class="tb_2">
<tr>
<td>
<div class="explain">
<strong>����Ա��̨ģ��˵����</strong><br />
1.����Աģ����ڳ����Ŀ¼�µ�AdminĿ¼�Ĭ��ģ��Ŀ¼Ϊ"default"<br />
2.ģ��Ŀ¼���small.jpgΪ����Сͼ��big.jpgΪ��ͼ<br />
3.���Ժ��ֻ�����ѡ��ͬ��ģ��
</div>
</td>
</tr>
</table>

<div style="margin:20px 10px;width:820px;">
<ul>
<%
adminpath=Left(AdminUserManagePath,Instr(AdminUserManagePath,"/")-1)

foldername=server.mappath("../../"&adminpath)
path=foldername
If Instr(path,"\"&adminpath)=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList_adminusertemplet(path) 


I=0
J=0
Function ShowFolderList_adminusertemplet(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 

'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<%
 FilePath=Server.mappath("../../"&adminpath&"/"&f1.name&"/small.jpg")
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 if Fs.FileExists(FilePath) = true Then
  Response.write "<li style='float:left;width:33%;border-bottom: 1px dotted #cccccc;empty-cells:show;margin-bottom:10px;'>"
  Response.write "<a href='../../"&adminpath&"/"&f1.name&"/big.jpg' target='_blank'><img src='../../"&adminpath&"/"&f1.name&"/small.jpg' width='200' height='248' border='0'></a><br>"
  
  Response.write "ģ�����ƣ�"&f1.name &"<br>"

  If Lcase(adminpath&"/"&f1.name)=LCase(AdminUserManagePath) Then
   Response.write "<font color='#ff0000'>PC����ʹ�ô�ģ��</font>"
   I=1
  Else
   Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ������ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=adminuser&TemplateName="&adminpath&"/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">����ʹ�ô�ģ��</a>"
  End If

  If Lcase(adminpath&"/"&f1.name)=LCase(AdminUserManagePath_M) Then
   Response.write "&nbsp;&nbsp;<font color='#ff0000'>�ֻ�����ʹ�ô�ģ��</font>"
   J=1
  Else
   Response.write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ���ֻ�ʹ�ô�ģ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=templatemodifysave&TemplateType=adminuser_m&TemplateName="&adminpath&"/"&f1.name&"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">�ֻ�ʹ�ô�ģ��</a>"
  End If
 End If
%>
</li>

<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"

If I=0 Then Response.write "<script>$(function () { alert('����Ա��̨��PCģ��û��ѡ����ѡ��һ��');});</script>"
If J=0 Then Response.write "<script>$(function () { alert('����Ա��̨���ֻ�ģ��û��ѡ����ѡ��һ��');});</script>"
%>
</ul>
</div>

<%End Function %>

<%End If%>