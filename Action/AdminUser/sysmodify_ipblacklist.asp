<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&label=ipblacklist">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2" >IP����������</td>
</tr>

<tr>
<td class="td_r" width="350">IP���������ñ���������</td>
<td>
<input type="radio" name="IpBlackListOpen" value="1"<%if rs("IpBlackListOpen")=1 then Response.write " checked"%>>��
<input type="radio" name="IpBlackListOpen" value="0"<%if rs("IpBlackListOpen")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">��ЧIP�����ˢIP�ĵ������ͼ���IP��ʱ������������</td>
<td>
<input type="radio" name="IpBlackFlagOpen" value="1"<%if rs("IpBlackFlagOpen")=1 then Response.write " checked"%>>��
<input type="radio" name="IpBlackFlagOpen" value="0"<%if rs("IpBlackFlagOpen")=0 then Response.write " checked"%>>��
</td>
</tr>


<tr>
<td class="td_r">��ЧIP�����ˢIP��C�����ͼ���IP��ʱ������������</td>
<td>
<input type="radio" name="IpSegmentBlackFlagOpen" value="1"<%if rs("IpSegmentBlackFlagOpen")=1 then Response.write " checked"%>>��
<input type="radio" name="IpSegmentBlackFlagOpen" value="0"<%if rs("IpSegmentBlackFlagOpen")=0 then Response.write " checked"%>>��
</td>
</tr>

<tr> 
<td></td>
<td>  
<input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary"></td>
</tr>
</table>
</form>
