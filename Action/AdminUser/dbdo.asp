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
If Action<>"dbdo" Then Response.End
%>


<table class="tb_1">
<tr class="tr_1"> 
<td>ִ��Sql���</td>
</tr>
<form name="form_exesql" id="form_exesql" method="post" action="?Action=sqlexesave&CurrUrl=<%=Server.URLEncode(HttpPath(7))%>">
<tr> 
<td><textarea name="sql" cols="80" rows="5" id="sqlcmd"></textarea> 
</td>
</tr>
<tr>
<td>���������Ա����ȷ��ִ�У�
<input type="password" name="Pwd"></td>
</tr>
<tr>
<td><a href="javascript:;" onclick="$(function () { confirm('ȷ��ִ������Sql�����?', '', function (isConfirm) {if (isConfirm) {$('#form_exesql').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-primary">ȷ��ִ������Sql���</a>
ע���������ִ���Իس����У�ÿһ��Ҫ��Ϊһ�������</td>
</tr>
</form>

<tr class="tr_1"> 
<td>���ݿ���¼���鿴</td>
</tr>

<script language=JavaScript>
function searchcheck_rsnumview()
{ 
 var searchurl ="?Action=<%=Action%>&DoType=rsnumview"
 searchurl += '&RsNum=' + document.getElementById('RsNum').value;
 location.href= searchurl ;
}
</script>
<tr> 
<td>�鿴��¼�����ڻ����
<%
If Request("RsNum")="" Then
 RsNum = 10000
Else
 RsNum = ChkStr(Request("RsNum"),2)
End If
%>
<input name="RsNum" id="RsNum" type="text" value="<%=RsNum%>" size="10" />
�ı������
<input type="button" name="submit" value="�鿴" class="btn btn-primary" onclick="searchcheck_rsnumview()">
&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="reset" value="����" class="btn btn-dark" onclick="location.href='?Action=<%=Action%>';">
</td>
</tr>

<%
If Request("DoType")="rsnumview" Then
%>
<tr> 
<td>

<table>
<%
RsNum=GoBack(ChkStr(Request("RsNum"),2),"�������¼��")

Sql="select o.name,i.rows from sysobjects o,sysindexes i where o.id=i.id and o.Xtype='U' and i.indid<2 and i.rows>="&RsNum&" order by i.rows desc,o.name"
Set Rs=Conn.Execute(Sql)

If Rs.Eof Then Response.write "û���ҵ���¼������"&RsNum&"�ı�"
While Not Rs.Eof
 Response.write "<tr><td>"&Rs(0)&"</td><td>"&Rs(1)&"</td></tr>"
Rs.MoveNext
Wend
%>
</table>

</td>
</tr>
<%
End If
%>

<tr class="tr_1"> 
<td>���ݿ���־ѹ��</td>
</tr>
<tr> 
<td>
<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫѹ�����ݿ���?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=dbys')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-primary">���ѹ�����ݿ�</a>

<div class="explain">ע��ѹ�����ݿ�һ�������ݿ���־�ļ��ܴ�ʱʹ�ã����ϰ�M��һ�㲻��ʹ��
</div>
</td>
</tr>
<tr class="tr_1"> 
<td> ���ݿⱸ��</td>
</tr>
<tr> 
<td>
<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫ�������ݿ���?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=dbbackup')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-primary">����������ݿ�</a>

<div class="explain">
1.�ֹ����ݵ������ǳ�������ݿ����һ̨�������ϣ��ٶ�һ�㼸���Ӽ��ɱ��ݳɹ����������������ϲ�����ʹ�ô˹��ܱ��ݽ������ݿⱸ�ݡ�
<br>
2.�ֹ����ݵ����ݿ���ڳ����dataĿ¼���backup_��ͷ�����Ǳ��ݵ�ʱ����д��14λ���֣���չ��Ϊ.bak��
<br>
3.�Զ����ݵ����ݿ���ڳ����dataĿ¼���backup_��ͷ�����Ǵ�1��ͷ��1λ��2λ���֣���չ��Ϊ.bak����ѭ���ݣ�����ʱ�俴�ļ����޸�ʱ���֪����
</div>
</td>
</tr>
<tr> 
<td><%
foldername=server.mappath("../../data")
path=foldername
If Instr(path,"\data")=0 Then Call AlertRef("����������Ŀ¼��")
ShowFolderList(path) 



Function ShowFolderList(folderspec) 
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
%>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
<tr> 
<td>����</td>
<td>��С</td>
<td>����</td>
<td>�޸�ʱ��</td>
</tr>
        <% 
'�г�Ŀ¼ 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<tr> 
<td><%= f1.name%></td>
<td>
<%MySize=f1.size/1024
If MySize<1024 Then Response.write FormatNumber(MySize,2,-1,0,0)&"K"
If MySize>=1024 Then Response.write FormatNumber(MySize/1024,2,-1,0,0)&"M"%>
</td>
<td>�ļ���</td>
<td><%= f1.datelastmodified%></td>
</tr>
<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"
'�г��ļ� 
Set fc = f.Files 
For Each f1 in fc 
%>
<tr> 
<td><%= f1.name%></td>
<td> 
<%MySize=f1.size/1024
If MySize<1024 Then Response.write  FormatNumber(MySize,2,-1,0,0)&"K"
If MySize>=1024 Then Response.write  FormatNumber(MySize/1024,2,-1,0,0)&"M"%>
</td>
<td>�ļ�</td>
<td><%= f1.datelastmodified%></td>
</tr>
<% 
Next 
set fso=nothing 
%>
</table>
<%End Function %></td>
</tr>
</table>
</td>
</tr>
</table>