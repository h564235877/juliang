<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>����һ�������б�</a>
    <form name="form1" method="post" action="../../AdminUser.aspx?Action=setbclassaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
    <tr class="tr_1">
      <td colspan="2">��������</td>
    </tr>

      
      <tr>
        <td class="td_r">����λ�ñ�ʶ��</td>
        <td><input name="SetBClassFlag" type="text" id="SetBClassFlag" value="" size="40">
          (*��ȷ�ı�ʶ��ʽ��ֻ�ܺ���Ӣ����ĸ�����ֺ��»���)</td>
      </tr>
      <tr>
        <td class="td_r">����λ��������</td>
        <td><input name="SetBClassDesc" type="text" id="SetBClassDesc" value="" size="40">
          &nbsp;*</td>
      </tr>
	  <tr>
	    <td class="td_r">���õ����ͣ�</td>
	    <td><input name="SetType" type="radio" value="1" />
	      �ڲ�
        <input name="SetType" type="radio" value="2" checked="checked" />
        �ⲿ *</td>
      </tr>
      <tr>
        <td class="td_r">�������֣�</td>
        <td><input name="SetTaxis" type="text" id="SetTaxis" value="0" size="40">
          &nbsp;*</td>
      </tr>
	  <tr>
        <td class="td_r">����µĻ������ƣ�</td>
        <td><input name="AppName" type="text" id="AppName" value="" size="40">
</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" name="submit" value="����" class="btn btn-primary"></td>
      </tr>
    
</table></form>