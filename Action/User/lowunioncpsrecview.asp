<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<form action="../../cf.aspx?action=lowunioncpsout" method="post" name="form2" target="_blank">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">CPS���ݵ���</td>

	<tr>
      <td class="td_r">�û�����</td>
      <td><%=UserName%><input type="hidden" name="UserName" value="<%=UserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">��¼���룺</td>
      <td><input name="Pwd" type="password" id="Pwd"></td>
    </tr>
	<tr>
	  <td class="td_r">���������</td>
	  <td><input name="AdUserName" type="text" id="AdUserName" value="">(ע:�����򵼳����й������cps���ݣ���д��������򵼳����������������)</td>
    </tr>
	<tr>
      <td class="td_r">�¼�����CPS�����İٷֱȣ�</td>
      <td><input name="TcRate" type="text" id="TcRate" value="100">%(ע�����Ѿ���������������˵ı���)</td>
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
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="����" class="btn btn-primary"></td>
	</tr>
	<tr class="tr_1"> 
	  <td colspan="2">CPS�ӿ����ݲ�ѯ</td>
    </tr>
	<tr>
	  <td class="td_r">
��ѯ�ӿڣ�
  <br /></td>
      <td><textarea name="textarea" cols="60" rows="3"><%=AdPath%>cf.aspx?action=lowunioncpsout&username=<%=UserName%>&pwd=&adusername=&tcrate=100&startdate=<%=Date%>&enddate=<%=Date%>&outype=json</textarea></td>
	</tr>
	<tr>
	  <td class="td_r">˵����</td>
	  <td> username�������˵��û���<br />
pwd�������˵��û�����<br />
adusername�������򵼳����й������cps���ݣ���д��������򵼳����������������<br />
tcrate���¼������û�CPS�����İٷֱ�<br />
startdate����ѯ��ʼ����<br />
enddate����ѯ��������<br />
outtype:�������ݵĸ�ʽ��������Ϊ֧��json��txt
</td>
    </tr>
    
	<tr>
	  <td class="td_r">���ص�json����˵��</td>
	  <td>�������ݸ�ʽ��:<br />
{"success": "true","message": "�ɹ�","data":[<br />
{"adusername":"myad","ordercode":"c","lowunionusername":"1","spend_cent":"0.30","addtime":"2011-5-4 10:23:19","orderdesc":""},<br />
{"ordercode":"mytest-a-488997151","lowunionusername":"a","spend_cent":"14.00","addtime":"2015-7-2 16:27:06","orderdesc":""},<br />
{"ordercode":"mytest-488997152","lowunionusername":"a","spend_cent":"14.00","addtime":"2015-7-2 16:27:06","orderdesc":""}<br />
]}<br /><br />
success:���سɹ�true��ʧ��false<br />
message:����ʧ��ʱ��ԭ��<br />
adusername:�������е�cps�������<br />
ordercode:�����ţ�����һ��Ψһֵ��ÿ�������Ų�����ͬ<br />
lowunionusername:�������˵��û������û�id<br />
spend_cent:�������˵��û��ڴ˶�������ܽ���ϳ���tcrate%�Ľ��
addtime:��������ʱ��
orderdesc:��������
</td>
    </tr>
</table></form>
