<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


  
<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>">
<table class="tb_1">



<tr class="tr_1"> 
<td colspan="2" >ϵͳ�����������</td>
</tr>
<tr> 
<td class="td_r" width="300">ϵͳ�������Դ����</td>
<td><input name="LyMaxTotal" type="text" id="LyMaxTotal" value="<%=Rs("LyMaxTotal")%>">
��(ע:һ����10000-50000֮��)</td>
</tr>
<tr> 
<td class="td_r">ϵͳ�������Ч���IP����</td>
<td><input name="IpMaxTotal" type="text" id="IpMaxTotal" value="<%=Rs("IpMaxTotal")%>">
��(ע:һ����100000-200000֮��)</td>
</tr>
<tr> 
<td class="td_r">ϵͳ�������Ч���IP����</td>
<td><input name="InvalidIpMaxTotal" type="text" id="InvalidIpMaxTotal" value="<%=Rs("InvalidIpMaxTotal")%>">
��(ע:һ����100000-200000֮��)</td>
</tr>
<tr> 
<td class="td_r">�����ؼ������������</td>
<td><input name="SearchKeywordMaxTotal" type="text" id="SearchKeywordMaxTotal" value="<%=Rs("SearchKeywordMaxTotal")%>">
��(ע:һ����10000-50000֮��)</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">���ݿ��Զ�����</td>
</tr>

<tr> 
<td class="td_r">�Զ�������������������ݵķ�ʽ��</td>
<td><input name="DataDelType" type="text" id="DataDelType" value="<%=Rs("DataDelType")%>">
<br />
(
Ĭ��Ϊ-1��ע��-1Ϊ�Զ���ÿ����������ʱ����ʱ������0Ϊ��ֹ�Զ���������Ϊ������ʱ����ٷ�������
<%If Rs("DataDelType")>0 And Rs("DataDelType")<1440 Then Response.write "<br><font color='#FF0000'>���õļ��ʱ�䲻Ҫ���̣�������1440���ӻ�����"%>
)</td>
</tr>

<tr> 
<td class="td_r">�Զ������������������������ִ��ʱ�䣺</td>
<td><input name="DataDelLastTime" type="text" id="DataDelLastTime" value="<%=Rs("DataDelLastTime")%>">
<br />(<a href="javascript:" onclick="document.getElementById('DataDelLastTime').value='<%=year(now)&"-"&month(now)&"-"&day(now)&" 3:00:00"%>';">����</a>�����������������С��ʱ�Σ������賿3����)		</td>
</tr>

<tr> 
<td class="td_r">�Զ�������־�ķ�ʽ��</td>
<td><input name="DbLogDelType" type="text" id="DbLogDelType" value="<%=Rs("DbLogDelType")%>">
<br />
(
Ĭ��Ϊ-1��ע��-1Ϊ�Զ���ÿ����������ʱ����ʱ������0Ϊ��ֹ�Զ���������Ϊ������ʱ����ٷ�������
<%If Rs("DbLogDelType")>0 And Rs("DbLogDelType")<1440 Then Response.write "<br><font color='#FF0000'>���õļ��ʱ�䲻Ҫ���̣�������1440���ӻ�����"%>
)</td>
</tr>

<tr> 
<td class="td_r">�Զ�������־����ִ��ʱ�䣺</td>
<td><input name="DbLogDelLastTime" type="text" id="DbLogDelLastTime" value="<%=Rs("DbLogDelLastTime")%>">
<br />
(<a href="javascript:" onclick="document.getElementById('DbLogDelLastTime').value='<%=year(now)&"-"&month(now)&"-"&day(now)&" 3:05:00"%>';">����</a>�����������������С��ʱ�Σ������賿3��05��)		</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">���ݿ��Զ�����</td>
</tr>
<tr> 
<td class="td_r">�Զ��������ݿ�ķ�ʽ��</td>
<td><input name="DbBackupType" type="text" id="DbBackupType" value="<%=Rs("DbBackupType")%>">
<br />
(
Ĭ��Ϊ-3��ע������Ϊ�Զ�����,���������ִ������������ı���,���10�죬0Ϊ��ֹ�Զ����ݣ�����Ϊ������ʱ����ٷ��ӱ���
<%If Rs("DbBackupType")>0 And Rs("DbBackupType")<1440 Then Response.write "<br><font color='#FF0000'>���õļ��ʱ�䲻Ҫ���̣�������1440���ӻ�����"%>
)</td>
</tr>

<tr> 
<td class="td_r">�Զ���������ִ��ʱ�䣺</td>
<td><input name="DbBackupLastTime" type="text" id="DbBackupLastTime" value="<%=Rs("DbBackupLastTime")%>">
<br />(<a href="javascript:" onclick="document.getElementById('DbBackupLastTime').value='<%=year(now)&"-"&month(now)&"-"&day(now)&" 3:10:00"%>';">����</a>�����������������С��ʱ�Σ������賿3��10��)</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">���ݼ�¼����</td>
</tr>

<tr> 
<td class="td_r">�����ͳ�ƣ�</td>
<td>
<input type="radio" name="DayTj" id="DayTj"  value="1"<%if rs("DayTj")=1 then Response.write " checked"%>>��
<input type="radio" name="DayTj" id="DayTj"  value="0"<%if rs("DayTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">���Сʱͳ�ƣ�</td>
<td>
<input type="radio" name="HourTj" id="HourTj"  value="1"<%if rs("HourTj")=1 then Response.write " checked"%>>��
<input type="radio" name="HourTj" id="HourTj"  value="0"<%if rs("HourTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">����ͳ�ƣ�</td>
<td>
<input type="radio" name="AreaTj" id="AreaTj"  value="1"<%if rs("AreaTj")=1 then Response.write " checked"%>>��
<input type="radio" name="AreaTj" id="AreaTj"  value="0"<%if rs("AreaTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">������Դͳ�ƣ�</td>
<td>
<input type="radio" name="LyTj" id="LyTj"  value="1"<%if rs("LyTj")=1 then Response.write " checked"%>>��
<input type="radio" name="LyTj" id="LyTj"  value="0"<%if rs("LyTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">�ͻ�����Ϣͳ�ƣ�</td>
<td>
<input type="radio" name="ClientTj" id="ClientTj"  value="1"<%if rs("ClientTj")=1 then Response.write " checked"%>>��
<input type="radio" name="ClientTj" id="ClientTj"  value="0"<%if rs("ClientTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">ҳ����ͳ�ƣ�</td>
<td>
<input type="radio" name="WebWidthTj" id="WebWidthTj"  value="1"<%if rs("WebWidthTj")=1 then Response.write " checked"%>>��
<input type="radio" name="WebWidthTj" id="WebWidthTj"  value="0"<%if rs("WebWidthTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">��������ؼ���ͳ�ƣ�</td>
<td>
<input type="radio" name="SearchKeywordTj" id="SearchKeywordTj"  value="1"<%if rs("SearchKeywordTj")=1 then Response.write " checked"%>>��
<input type="radio" name="SearchKeywordTj" id="SearchKeywordTj"  value="0"<%if rs("SearchKeywordTj")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td class="td_r">����������������ͼ�¼���棺</td>
<td>
<input type="radio" name="ClickFlagTj" id="ClickFlagTj"  value="1"<%if rs("ClickFlagTj")=1 then Response.write " checked"%>>��
<input type="radio" name="ClickFlagTj" id="ClickFlagTj"  value="0"<%if rs("ClickFlagTj")=0 then Response.write " checked"%>>��
</td>
</tr>
    

<tr class="tr_1"> 
<td colspan="2">���ݱ��������</td>
</tr>

<tr> 
<td class="td_r">Сʱͳ�Ʊ���������</td>
<td>
<input name="HourKeepDay" type="text" id="HourKeepDay" value="<%=Rs("HourKeepDay")%>">��
</td>
</tr>

<tr> 
<td class="td_r">ÿ��ͳ�Ƽ�¼������������</td>
<td>
<input name="DayKeepDay" type="text" id="DayKeepDay" value="<%=Rs("DayKeepDay")%>">��
</td>
</tr>

<tr> 
<td class="td_r">�ͻ�����Ϣͳ�Ƽ�¼������������</td>
<td>
<input name="ClientKeepDay" type="text" id="ClientKeepDay" value="<%=Rs("ClientKeepDay")%>">��
</td>
</tr>

<tr> 
<td class="td_r">IP����ͳ�Ƽ�¼������������</td>
<td>
<input name="IpAreaKeepDay" type="text" id="IpAreaKeepDay" value="<%=Rs("IpAreaKeepDay")%>">��
</td>
</tr>

<tr> 
<td class="td_r">ҳ����ͳ�Ƽ�¼������������</td>
<td>
<input name="WebWidthKeepDay" type="text" id="WebWidthKeepDay" value="<%=Rs("WebWidthKeepDay")%>">��
</td>
</tr>

<tr> 
<td class="td_r">����������������ͼ�¼�����������</td>
<td>
<input name="ClickFlagKeepDay" type="text" id="ClickFlagKeepDay" value="<%=Rs("ClickFlagKeepDay")%>">��
</td>
</tr>

<tr> 
<td class="td_r">����ͳ�Ʊ�����������</td>
<td>
<input name="OtherKeepDay" type="text" id="OtherKeepDay" value="<%=Rs("OtherKeepDay")%>">��
</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" value="�޸�" class="btn btn-primary">

</td>
</tr>
</table>
</form>
