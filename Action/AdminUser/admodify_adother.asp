,<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_1" id="tbu">
<%If Rs("Ad_Class") = 3 Or Rs("Ad_Class") = 4 Or Rs("Ad_Class") = 7 Then '��ͨ���֡���ͨͼƬ��ý��%>
<tr class="tr_1">
<td colspan="2">������ش���</td>
</tr>

<tr id="e_1"> 
<td class="td_r">������ش��룺</td>
<td>
<textarea name="AdHiddenCode" style="width:600px;height:80px;"><%=Rs("AdHiddenCode")%></textarea>

<br>
���Լ��������ͳ�Ƽ�¼(���벻��&lt;script��ͷ�Ͳ���&lt;/script&gt;��β,�������ؿ��Լ��������ش���,��Ӵ�����ܲ���ʾ,֧�ִ����ڽ��ܹ��id����{ad_id},�û�������{username}</td>
</tr>
<%End If%>

<tr class="tr_1">
<td colspan="2">����</td>
</tr>

<tr> 
<td class="td_r" width="330">ת�򵽹��ҳ��ӹ��ҳ��������Դ�ǣ�</td>
<td>
<input type="radio" name="AdWebLookLy" value="0"<%If Rs("AdWebLookLy")=0 Then Response.write " checked"%>>JSת��,������ԴΪ��
<input type="radio" name="AdWebLookLy" value="1"<%If Rs("AdWebLookLy")=1 Then Response.write " checked"%>>JSת��,������ԴΪ����
<input type="radio" name="AdWebLookLy" value="2"<%If Rs("AdWebLookLy")=2 Then Response.write " checked"%>>302ת��,������ԴΪ���Ͷ��ҳ
(Ĭ��302ת��)</td>
</tr>
<tr>
<td class="td_r">��תҳ��Ͷ�Ŵ��룺</td>
<td><textarea name="ZZWebCode"  style="width:600px;height:110px;"><%=Rs("ZZWebCode")%></textarea>
<br />Ĭ��Ϊ�ղ�Ͷ��,�ɷŵ�����ͳ�ƴ��������&lt;script��ͷ����&lt;/script&gt;��β����302ת��ʱ���ã�����Ͷ�Ŵ�����������302ת��ע��湦��</td>
</tr>

<tr> 
<td class="td_r">ֱ�����ֻ�ͼƬȡ�ͻ�����Ϣ��</td>
<td>
<input type="radio" name="ZLClientInfo" value="1"<%If Rs("ZLClientInfo")=1 Then Response.write " checked"%>>��ȡ
<input type="radio" name="ZLClientInfo" value="0"<%If Rs("ZLClientInfo")=0 Then Response.write " checked"%>>����ȡ
(Ĭ�ϲ���ȡ)</td>
</tr>
	
<tr>
<td class="td_r">�������ʱ��ʱ�䣺</td>
<td><input name="AddTime" type="text" value="<%=Rs("AddTime")%>"></td>
</tr>

<tr>
<td class="td_r">�б��������֣�</td>
<td><input name="ListID" type="text" value="<%=Rs("ListID")%>">(����0���ö��Ĺ��ܣ�Խ��Խ���б�����)</td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adotherbtn" id="adotherbtn" value="�޸�" class="btn btn-primary">
          �� 
</td>
</tr>
</table>

