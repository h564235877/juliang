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
SetBClassFlag=ChkStr(Request("SetBClassFlag"),1)
SetSClassFlag=ChkStr(Request("SetSClassFlag"),1)
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�������������б�</a>

<form name="form1" method="post" action="../../AdminUser.aspx?Action=setcontentaddsave&SetBClassFlag=<%=SetBClassFlag%>&SetSClassFlag=<%=SetSClassFlag%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">
<tr class="tr_1">
<td colspan="2">��������</td>
</tr>
<tr>
<td class="td_r">���ñ�ʶ��</td>
<td>
<input name="SetFlag" type="text" id="SetFlag" size="80">*
<br />(��ȷ�ı�ʶ��ʽ��ֻ�ܺ���Ӣ����ĸ�����ֺ��»���)
</td>
</tr>
<tr>
<td class="td_r">���ø���ʶ��</td>
<td><input name="SetFlag_2" type="text" id="SetFlag_2" size="80">
<br />(�Ǳ������ȷ�ı�ʶ��ʽ��ֻ�ܺ���Ӣ����ĸ�����ֺ��»���)</td>
</tr>
<tr>
<td class="td_r">����������</td>
<td><input name="SetDesc" type="text" id="SetDesc" size="80">*</td>
</tr>
<tr>
<td class="td_r">��������2��</td>
<td><input name="SetDesc_2" type="text" id="SetDesc_2" size="80">*</td>
</tr>
<tr>
<td class="td_r">����ֵ��</td>
<td><textarea name="SetValue" cols="78" rows="10"></textarea></td>
</tr>
<tr>
<td class="td_r">���ñ�ע��</td>
<td><textarea name="SetRemark" cols="78" rows="10"></textarea></td>
</tr>
<tr>
<td class="td_r">���õ����ͣ�</td>
<td>
<input name="SetType" type="radio" value="1" />�ڲ�
<input name="SetType" type="radio" value="2" checked="checked" />�ⲿ
</td>
</tr>
<tr>
<td class="td_r">���õ����ݱ༭��ʽ��</td>
<td>
<input type="radio" name="SetContentType" value="1" checked="checked" />���д��뷽ʽ
<input type="radio" name="SetContentType" value="2" />���ݷ�ʽ
<input type="radio" name="SetContentType" value="3" />���д��뷽ʽ
</td>
</tr>
<tr>
<td class="td_r">�������֣�</td>
<td><input name="SetTaxis" type="text" id="SetTaxis" value="0" size="20">*</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="����" class="btn btn-primary"></td>
</tr>
</table>
</form>