<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<!--#Include File="../../Conn.asp"-->
<!--#Include File="../../include/MyFunction.asp"-->
<!--#Include File="../../include/Md5.asp"-->
<%
'*
'* @Description: ��Ǯ�����֧�����ؽӿڷ���
'* @Copyright (c) �Ϻ���Ǯ��Ϣ�������޹�˾
'* @version 2.0
'*

'��ȡ����������˻���
merchantAcctId=trim(request("merchantAcctId"))

'���������������Կ
''���ִ�Сд
key=RsSet("Pay_99BillKey")

If merchantAcctId="" Or merchantAcctId="��ʵ����д������" Or key="" Or key="��ʵ����д������" Then
 Response.write "�̻�����Կ��������"
 Response.End
End If
'��ȡ���ذ汾.�̶�ֵ
''��Ǯ����ݰ汾�������ö�Ӧ�Ľӿڴ�������
''������汾�Ź̶�Ϊv2.0
version=trim(request("version"))

'��ȡ��������.�̶�ѡ��ֵ��
''ֻ��ѡ��1��2��3
''1�������ģ�2����Ӣ��
''Ĭ��ֵΪ1
language=trim(request("language"))

'ǩ������.�̶�ֵ
''1����MD5ǩ��
''��ǰ�汾�̶�Ϊ1
signType=trim(request("signType"))

'��ȡ֧����ʽ
''ֵΪ��10��11��12��13��14
''00�����֧��������֧��ҳ����ʾ��Ǯ֧�ֵĸ���֧����ʽ���Ƽ�ʹ�ã�10�����п�֧��������֧��ҳ��ֻ��ʾ���п�֧����.11���绰����֧��������֧��ҳ��ֻ��ʾ�绰֧����.12����Ǯ�˻�֧��������֧��ҳ��ֻ��ʾ��Ǯ�˻�֧����.13������֧��������֧��ҳ��ֻ��ʾ����֧����ʽ��.14��B2B֧��������֧��ҳ��ֻ��ʾB2B֧��������Ҫ���Ǯ���뿪ͨ����ʹ�ã�
payType=trim(request("payType"))

'��ȡ���д���
''�μ����д����б�
bankId=trim(request("bankId"))

'��ȡ�̻�������
orderId=trim(request("orderId"))
OrderCode=ChkStr(orderId,1)

'��ȡ�����ύʱ��
''��ȡ�̻��ύ����ʱ��ʱ��.14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
''�磺20080101010101
orderTime=trim(request("orderTime"))

'��ȡԭʼ�������
''�����ύ����Ǯʱ�Ľ���λΪ�֡�
''�ȷ�2 ������0.02Ԫ
orderAmount=trim(request("orderAmount"))

'��ȡ��Ǯ���׺�
''��ȡ�ý����ڿ�Ǯ�Ľ��׺�
dealId=trim(request("dealId"))

'��ȡ���н��׺�
''���ʹ�����п�֧��ʱ�������еĽ��׺š��粻��ͨ������֧������Ϊ��
bankDealId=trim(request("bankDealId"))

'��ȡ�ڿ�Ǯ����ʱ��
''14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
''�磻20080101010101
dealTime=trim(request("dealTime"))

'��ȡʵ��֧�����
''��λΪ��
''�ȷ� 2 ������0.02Ԫ
payAmount=trim(request("payAmount"))

'��ȡ����������
''��λΪ��
''�ȷ� 2 ������0.02Ԫ
fee=trim(request("fee"))

'��ȡ��չ�ֶ�1
ext1=trim(request("ext1"))

'��ȡ��չ�ֶ�2
ext2=trim(request("ext2"))

'��ȡ�������
''10���� �ɹ�11���� ʧ��
payResult=trim(request("payResult"))

'��ȡ�������
''��ϸ���ĵ���������б�
errCode=trim(request("errCode"))

'��ȡ����ǩ����
signMsg=trim(request("signMsg"))



'���ɼ��ܴ������뱣������˳��
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"merchantAcctId",merchantAcctId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"version",version)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"language",language)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"signType",signType)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"payType",payType)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"bankId",bankId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"orderId",orderId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"orderTime",orderTime)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"orderAmount",orderAmount)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"dealId",dealId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"bankDealId",bankDealId)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"dealTime",dealTime)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"payAmount",payAmount)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"fee",fee)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"ext1",ext1)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"ext2",ext2)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"payResult",payResult)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"errCode",errCode)
	merchantSignMsgVal=appendParam(merchantSignMsgVal,"key",key)
merchantSignMsg= md5(merchantSignMsgVal,2)


'��ʼ���������ַ
rtnOk=0
rtnUrl=""

'�̼ҽ������ݴ���������ת���̼���ʾ֧�������ҳ��
''���Ƚ���ǩ���ַ�����֤
If UCase(signMsg)=UCase(merchantSignMsg) then

	''���Ž���֧������ж�
	Select Case payResult
	
		  case "10"
			
			'*  
			' �̻���վ�߼��������ȷ����¶���֧��״̬Ϊ�ɹ�
			' �ر�ע�⣺ֻ��UCase(signMsg)=UCase(merchantSignMsgVal)����payResult=10���ű�ʾ֧���ɹ���ͬʱ������������ύ����ǰ�Ķ��������жԱ�У�顣
			'*
			
			'�������Ǯ������������ṩ��Ҫ�ض���ĵ�ַ��
			rtnOk=1
			rtnUrl=HttpPath(2)
			%>
 <!--#include file="OnlinePay_Ok.asp"-->
			<%

			
		  
		 Case else

			rtnOk=1
			rtnUrl=HttpPath(2)

	End select

else

	rtnOk=1
	rtnUrl=HttpPath(2)

End if





	'���ܺ�����������ֵ��Ϊ�յĲ�������ַ���
	Function appendParam(returnStr,paramId,paramValue)

		If returnStr <> "" Then
			If paramValue <> "" then
				returnStr=returnStr&"&"&paramId&"="&paramValue
			End if
		Else 
			If paramValue <> "" then
				returnStr=paramId&"="&paramValue
			End if
		End if
		
		appendParam=ReturnStr

	End Function
	'���ܺ�����������ֵ��Ϊ�յĲ�������ַ���������


'���±������Ǯ������������ṩ��Ҫ�ض���ĵ�ַ
%>
<result><%=rtnOk %></result><redirecturl><%=rtnUrl%></redirecturl>