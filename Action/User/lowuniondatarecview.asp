<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<form action="../../cf.aspx?action=lowuniondataout" method="post" name="form2" target="_blank">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">CPC��CPV��CPA�������ݵ���</td>

	<tr>
      <td class="td_r">�û�����</td>
      <td><%=UserName%><input type="hidden" name="UserName" value="<%=UserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">��¼���룺</td>
      <td><input name="Pwd" type="password" id="Pwd"></td>
    </tr>
	<tr>
      <td class="td_r">�¼����˻����İٷֱȣ�</td>
      <td><input name="TcRate" type="text" id="TcRate" value="100">%(ע�����Ѿ���������������˵ı���)</td>
    </tr>
	<tr>
      <td class="td_r">��ʼ���ڣ�</td>
      <td><input name="StartDate" type="text" id="StartDate" value="<%=Date-1%>">(ע������Ϊ���������)</td>
    </tr>
	<tr>
      <td class="td_r">�������ڣ�</td>
      <td><input name="EndDate" type="text" id="EndDate" value="<%=Date-1%>">(ע������Ϊ���������)</td>
    </tr>
	<tr>
	  <td class="td_r">�������ݸ�ʽ��</td>
	  <td><input name="OutType" type="radio" id="radio" value="json" checked="checked" />json��ʽ
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
��ѯ�ӿڣ�</td>
      <td><textarea name="textarea" cols="60" rows="3"><%=AdPath%>cf.aspx?action=lowuniondataout&username=<%=UserName%>&pwd=&tcrate=100&startdate=<%=Date-1%>&enddate=<%=Date-1%>&outype=json</textarea></td>
	</tr>
	<tr>
	  <td class="td_r">��ѯ�ӿڲ���˵����</td>
	  <td>

username�������˵��û���<br />
pwd�������˵��û�����<br />
tcrate���¼������û������İٷֱ�<br />
startdate����ѯ��ʼ����,����Ϊ���������<br />
enddate����ѯ��������,����Ϊ���������<br />
outtype:�������ݵĸ�ʽ��������Ϊ֧��json��txt
</td>
    </tr>
	<tr>
	  <td class="td_r">���ص�json����˵��</td>
	  <td>�������ݸ�ʽ��:<br />
{"success": "true","message": "�ɹ�","data":[
{"lowunionusername":"xxx","total_cent":"0.03","adddate":"2011-5-28"}
]}<br /><br />
success:���سɹ�true��ʧ��false<br />
message:����ʧ��ʱ��ԭ��<br />
lowunionusername:�������˵��û������û�id<br />
total_cent:�������˵��û���adddate��һ�����ڻ�ȡ�����ܽ�����tcrate%�Ľ��<br />
adddate:���ڣ�ÿ�����������û���ͬһ��ֻ��һ����¼
</td>
    </tr>
</table>
</form>
