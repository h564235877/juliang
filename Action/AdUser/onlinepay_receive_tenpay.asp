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
<% Response.Buffer = true %>
<meta name="TENCENT_ONELINE_PAYMENT" content="China TENCENT">
<html>
<%
'ȡ���ز���
cmdno			= Request("cmdno")
pay_result	= Request("pay_result")
pay_info		= Request("pay_info")
bill_date		= Request("date")
bargainor_id	= Request("bargainor_id")
transaction_id	= Request("transaction_id")
sp_billno		= Request("sp_billno")
total_fee		= Request("total_fee")
fee_type		= Request("fee_type")
attach			= Request("attach")
md5_sign		= Request("sign")

OrderCode = ChkStr(sp_billno,1)'ȡ�÷���֧��ϵͳ���Լ�����Ķ�����

'���ز���
spid	= RsSet("Pay_TenpayID")	' �����滻Ϊ����ʵ���̻���
sp_key = RsSet("Pay_TenpayKey")		' sp_key��32λ�̻���Կ, ���滻Ϊ����ʵ����Կ

If spid="" Or spid="��ʵ����д������" Or sp_key="" Or sp_key="��ʵ����д������" Then
 Response.write "�̻�����Կ��������"
 Response.End
End If

'����ֵ����
Private Const retOK = 0					' �ɹ�					
Private Const invalidSpid = 1			' �̻��Ŵ���
Private Const invalidSign = 2			' ǩ������
Private Const tenpayErr	= 3				' �Ƹ�ͨ����֧��ʧ��

'��ǩ����
Function verifyMd5Sign

	origText = "cmdno=" & cmdno & "&pay_result=" & pay_result &_ 
		       "&date=" & bill_date & "&transaction_id=" & transaction_id &_
			   "&sp_billno=" & sp_billno & "&total_fee=" & total_fee &_
			   "&fee_type=" & fee_type & "&attach=" & attach &_
			   "&key=" & sp_key
	
	localSignText = UCase(Md5(origText,2)) ' ת��Ϊ��д
	verifyMd5Sign = (localSignText = md5_sign)
	
End Function

'����ֵ
Dim retValue
retValue = retOK

'�ж��̻���
If bargainor_id <> spid Then
	retValue = invalidSpid
Else 
' ��ǩ
	If verifyMd5Sign <> True Then
		retValue = invalidSign
	Else
' ���Ƹ�ͨ����ֵ
		If pay_result <> 0 Then
			retValue = tenpayErr
		End If
	End If
End If

'�����ﴦ��ҵ���߼� 

'�����Ϣ
Dim pay_msg
Select Case retValue
	Case retOK			pay_msg = "֧���ɹ�!"
	Case invalidSpid	pay_msg = "������̻���!"	
	Case invalidSign	pay_msg = "��֤MD5ǩ��ʧ��!"
	Case Else			pay_msg = "֧��ʧ��!"
End Select

If pay_msg = "֧���ɹ�!" Then
%>

<!--#include file="OnlinePay_Ok.asp"-->

<%
Response.write "֧���ɹ�����رձ�ҳ"
End If
%>