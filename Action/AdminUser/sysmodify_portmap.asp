<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&label=portmap">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2" >CDN��������</td>
</tr>
<tr> 
<td class="td_r" width="180">�Ƿ���CDN����������</td>
<td>
<input type="radio" name="portmap" id="portmap_1" value="1"<%if rs("portmap")=1 then Response.write " checked"%>>��
<input type="radio" name="portmap" id="portmap_0" value="0"<%if rs("portmap")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">CDN�Ƿ���Ҫ������ʾ��</td>
<td>
<%
if AdScriptShowDomain="" Then
 Response.write "<script src='../../cf.aspx?Action=cdncheck'></script>"
Else
 Response.write "<script src='"&AdScriptShowDomain&"cf.aspx?Action=cdncheck'></script>"
End If
%>
</td>
</tr>

<tr> 
<td></td>
<td>  
<input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary"></td>
</tr>
</table>
</form>
