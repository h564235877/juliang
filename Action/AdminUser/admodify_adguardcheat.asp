<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


<script>
$(function(){
 $("#adguardcheatbtn").click(function(){
  AllowClickTotal=parseInt($('#AllowClickTotal').val());
  AllowAdUserClickTotal=parseInt($('#AllowAdUserClickTotal').val());


  if(AllowAdUserClickTotal < AllowClickTotal){
   alert('��д�ĶԹ����ͬһIP���������õ�ʱ��������ܵ����չʾ���ٴ���Ч��ֵ����ڻ���ڶ���վ��ͬһIP���������õ�ʱ��������ܵ����չʾ���ٴ���Ч��ֵ', '', function () {$("#AllowAdUserClickTotal").focus();});
   return false;
  }


 })
});
</script>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">����������</td>
</tr>
<tr> 
<td width="240"  class="td_r">IP���ݿ�û�е�IP�����Ч��</td>
<td><input type="radio" name="OtherIpEffect" value="1"<%If Rs("OtherIpEffect")=1 Then Response.write " checked"%>>
�� 
<input type="radio" name="OtherIpEffect" value="0"<%If Rs("OtherIpEffect")=0 Then Response.write " checked"%>>
��*Ĭ��Ϊ��</td>
</tr>

<tr> 
<td class="td_r">�Ƿ�����ӱ�ϵͳ�ڲ������</td>
<td><input type="radio" name="SysClick" value="1"<%If Rs("SysClick")=1 Then Response.write " checked"%>>
�� 
<input type="radio" name="SysClick" value="0"<%If Rs("SysClick")=0 Then Response.write " checked"%>>
��*Ĭ��Ϊ��</td>
</tr>

<tr> 
<td class="td_r">IP�����׵ļ���</td>
<td>
<input type="radio" name="IpGuardLevel" value="1"<%If Rs("IpGuardLevel")=1 Then Response.write " checked"%>>
�ϸ�(һ��ip�������ʾ���й��ֻ�Ƶ�һ��)<br />
<input type="radio" name="IpGuardLevel" value="2"<%If Rs("IpGuardLevel")=2 Then Response.write " checked"%>>
���ϸ�(һ��ip�������ʾ��ͬ������Ĺ��, ÿ���������һ��)<br />
<input type="radio" name="IpGuardLevel" value="3"<%If Rs("IpGuardLevel")=3 Then Response.write " checked"%>>
����(һ��ip�������ʾ���в�ͬ���, ÿ������һ��)<br />
</td>
</tr>

<tr> 
<td class="td_r">��ͬIP��ڶ�����ͬ���ʱ��</td>
<td><input type="radio" name="IpDiffAdEffect" value="1"<%If Rs("IpDiffAdEffect")=1 Then Response.write " checked"%>>
��
<input type="radio" name="IpDiffAdEffect" value="0"<%If Rs("IpDiffAdEffect")=0 Then Response.write " checked"%>>
�� Ĭ�Ϸ� (�ǣ�������Ʒ���վ�����ƣ������߶�����)</td>
</tr>

<tr> 
<td class="td_r">�����IP�Σ�</td>
<td><input type="radio" name="IpSegmentGuard" value="1"<%If Rs("IpSegmentGuard")=1 Then Response.write " checked"%>>
����
<input type="radio" name="IpSegmentGuard" value="0"<%If Rs("IpSegmentGuard")=0 Then Response.write " checked"%>>
�ر� (Ĭ�Ͽ���,��ֹ��ip���,��ͬip�ε��������Ϊ��Ч���)</td>
</tr>

<tr> 
<td class="td_r">�Ƿ��IPת���ɶ�Ӧ�ĵ�����</td>
<td><input type="radio" name="IpAreaSwitch" value="1"<%If Rs("IpAreaSwitch")=1 Then Response.write " checked"%>>
��
<input type="radio" name="IpAreaSwitch" value="0"<%If Rs("IpAreaSwitch")=0 Then Response.write " checked"%>>
��</td>
</tr>
	
<tr> 
<td class="td_r">�����ʾ��������������Ч��</td>
<td><input name="AdShowAfterToClickTime" type="text" value="<%=Rs("AdShowAfterToClickTime")%>">��Ĭ��Ϊ0��</td>
</tr>

<tr> 
<td class="td_r">���������ֶ������ӵ���תҳ��</td>
<td><input name="ShowClickInfoTime" type="text" value="<%=Rs("ShowClickInfoTime")%>">��Ĭ��Ϊ0��</td>
</tr>

<tr class="tr_1">
<td colspan="2">������ʱ������</td>
</tr>

<tr> 
<td class="td_r">ͬһIP���ٷ��Ӻ�����ٴε���˹����Ч��</td>
<td><input name="EffectTime" type="text" value="<%=Rs("EffectTime")%>">��Ĭ��Ϊ1440��ע��0��ʾ����IP,-1��ʾ����IP�Ҳ���¼IP�ڱ��</td>
</tr>

<tr> 
<td class="td_r">ͬһ���Զ��ٷ��Ӻ�����ٴε����չʾ�˹����Ч��</td>
<td><input name="EffectTime_Cookie" type="text" value="<%=Rs("EffectTime_Cookie")%>">��Ĭ��Ϊ1440��ע��0��ʾ����Cookie��</td>
</tr>

<tr class="tr_1">
<td colspan="2">��IP��PV�Ʒ�����</td>
</tr>

<tr> 
<td class="td_r">����վ��ͬһIP���������õ�ʱ��������ܵ����չʾ���ٴ���Ч��</td>
<td><input name="AllowClickTotal" id="AllowClickTotal" type="text" value="<%=Rs("AllowClickTotal")%>">(Ĭ��Ϊ1�Σ�1Ϊ��IP�Ʒѣ�����1Ϊ��PV�Ʒѣ���д�Ĵ���1����ֵΪһ��IP���ɰ�PV�ƷѶ��ٴ�)</td>
</tr>

<tr> 
<td class="td_r">�Թ����ͬһIP���������õ�ʱ��������ܵ����չʾ���ٴ���Ч��</td>
<td><input name="AllowAdUserClickTotal" id="AllowAdUserClickTotal" type="text" value="<%=Rs("AllowAdUserClickTotal")%>">(Ĭ��Ϊ1�Σ�1Ϊ��IP�۷ѣ�����1Ϊ��PV�۷ѣ���д�Ĵ���1����ֵΪһ��IP���ɰ�PV�۷Ѷ��ٴ�)</td>
</tr>


<tr class="tr_1">
<td colspan="2">���ȷ������</td>
</tr>

<tr> 
<td class="td_r">�����������ٴ�ȷ����Ч��</td>
<td><input name="AdAffirmTotal" type="text" value="<%=Rs("AdAffirmTotal")%>">
(Ĭ��Ϊ0������ȷ�ϵ������Ч)</td>
</tr>

	
<tr class="tr_1">
<td colspan="2">PC�豸�ϵķ����׸�������</td>
</tr>
<tr> 
<td class="td_r">Ͷ��ҳ����С�򿪵�ҳ���ȣ�</td>
<td><input name="WebMinWidth" type="text" value="<%=Rs("WebMinWidth")%>">
(Ĭ��Ϊ100��ע��0��ʾ���ж�)</td>
</tr>
	
<tr> 
<td class="td_r">Ͷ��ҳ�����򿪵�ҳ���ȣ�</td>
<td><input name="WebMaxWidth" type="text" value="<%=Rs("WebMaxWidth")%>">
(Ĭ��Ϊ-1��ע��0��ʾ���ж�,-1��ʾ�Զ��ж�)</td>
</tr>

<tr> 
<td class="td_r">Ͷ��ҳ����С�򿪵�ҳ��߶ȣ�</td>
<td><input name="WebMinHeight" type="text" value="<%=Rs("WebMinHeight")%>">
(Ĭ��Ϊ100��ע��0��ʾ���ж�)</td>
</tr>
	
<tr> 
<td class="td_r">Ͷ��ҳ�����򿪵�ҳ��߶ȣ�</td>
<td><input name="WebMaxHeight" type="text" value="<%=Rs("WebMaxHeight")%>">
(Ĭ��Ϊ-1��ע��0��ʾ���ж�,-1��ʾ�Զ��ж�)</td>
</tr>

<tr> 
<td class="td_r">Ͷ��ҳ��ҳ������Ļ��������С���룺</td>
<td><input name="WebMinTop" type="text" value="<%=Rs("WebMinTop")%>">
(Ĭ��Ϊ-100��ע��0��ʾ���ж�)</td>
</tr>

<tr> 
<td class="td_r">Ͷ��ҳ��ҳ������Ļ�����������룺</td>
<td><input name="WebMaxTop" type="text" value="<%=Rs("WebMaxTop")%>">
(Ĭ��Ϊ-1��ע��0��ʾ���ж�,-1��ʾ�Զ��ж�)</td>
</tr>

<tr> 
<td class="td_r">Ͷ��ҳ��ҳ������Ļ��ߵ���С���룺</td>
<td><input name="WebMinLeft" type="text" value="<%=Rs("WebMinLeft")%>">
(Ĭ��Ϊ-100��ע��0��ʾ���ж�)</td>
</tr>

<tr> 
<td class="td_r">Ͷ��ҳ��ҳ������Ļ��ߵ������룺</td>
<td><input name="WebMaxLeft" type="text" value="<%=Rs("WebMaxLeft")%>">
(Ĭ��Ϊ-1��ע��0��ʾ���ж�,-1��ʾ�Զ��ж�)</td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adguardcheatbtn" id="adguardcheatbtn" value="�޸�" class="btn btn-primary">
</td>
</tr>

</table>

