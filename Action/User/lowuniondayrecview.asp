<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<form action="../../cf.aspx?action=lowuniondayout" method="post" name="form2" target="_blank">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2"><strong>�¼�����ͳ�����ݵ���</strong> </td>

	<tr>
      <td class="td_r">�û�����</td>
      <td><%=UserName%><input type="hidden" name="UserName" value="<%=UserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">��¼���룺</td>
      <td><input name="Pwd" type="password" id="Pwd"></td>
    </tr>

	<tr>
      <td class="td_r">��ʼ���ڣ�</td>
      <td><input name="StartDate" type="text" id="StartDate" value="<%=Date%>"></td>
    </tr>
	<tr>
      <td class="td_r">�������ڣ�</td>
      <td><input name="EndDate" type="text" id="EndDate" value="<%=Date%>"></td>
    </tr>
	<tr>
	  <td class="td_r">�������ݸ�ʽ��</td>
	  <td><input type="radio" name="OutType" id="radio" value="json" checked="checked" />json��ʽ
      <input type="radio" name="OutType" id="radio2" value="txt" />txt�ı�</td>
    </tr>
	<tr>
      <td height="29">&nbsp;</td>
      <td><input type="submit" name="submit" value="����" class="btn btn-primary"></td>
	</tr>
	<tr class="tr_1"> 
	  <td colspan="2">CPC��CPV��CPA�������ݽӿڲ�ѯ</td>
    </tr>
	<tr>
	  <td class="td_r">
��ѯ�ӿڣ�
  <br /></td>
      <td><textarea name="textarea" cols="60" rows="3"><%=AdPath%>cf.aspx?action=lowuniondayout&username=<%=UserName%>&pwd=&startdate=<%=Date%>&enddate=<%=Date%>&outype=json</textarea></td>
	</tr>
	<tr>
	  <td class="td_r">˵����</td>
	  <td>
username�������˵��û���<br />
pwd�������˵��û�����<br />
startdate����ѯ��ʼ����<br />
enddate����ѯ��������<br />
outtype:�������ݵĸ�ʽ��������Ϊ֧��json��txt</td>
    </tr>
    
	<tr>
	  <td class="td_r">���ص�json����˵��</td>
	  <td>�������ݸ�ʽ��:<br />
{"success": "true","message": "�ɹ�","data":[
{"lowunionusername":"a","ad_id":1,"pv_counter":"1","uv_counter":"2","display_counter":"3",<br />"clickpv_counter":"4","clickuv_counter":"5","click_counter":"6","reg_counter":"7","adddate":"2015-7-4"}
]}<br /><br />
success:���سɹ�true��ʧ��false<br />
message:����ʧ��ʱ��ԭ��<br />
lowunionusername:�������˵��û������û�id<br />
ad_id:���ID<br />
pv_counter:�����ʾpv��<br />
uv_counter:�����ʾuv��<br />
uv_counter:�����ʾip��<br />
clickpv_counter:�����pv��<br />
clickuv_counter:�����uv��<br />
click_counter:�����ip��<br />
reg_counter:���ע���û���<br />
adddate:�����������
</td>
    </tr>
</table></form>
