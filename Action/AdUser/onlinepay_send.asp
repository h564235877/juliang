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
Response.Expires= -1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","no-store"
%>
<!--#Include File="../../Conn.asp"-->
<!--#Include File="../../include/MyFunction.asp"-->
<!--#Include File="../../include/Md5.asp"-->

<%
AdUserName=ChkStr(Request("AdUserName"),1)
OrderCode=ChkStr(Request("OrderCode"),1)
PayMoney=ChkStr(Request("PayMoney"),2)

If AdUserName="" Or OrderCode="" Then Call AlertClose("����Ĳ�������Ϊ��")
If PayMoney="" Then Call AlertClose("�������ֵ���")
If CLng(PayMoney)<RsSet("Pay_LowCent") Then Call AlertClose("��ͳ�ֵ����")
 
 '����һ������������֧���Ƿ����Ĭ��Ϊû����ɡ���
 Sql="Select Count(1) From CFWztg_AdUser_OnlinePay Where OrderCode='"&OrderCode&"'"
 Set Rs=Conn.Execute(Sql)
 If Rs(0)=0 Then
  Sql = "Insert Into CFWztg_AdUser_OnlinePay(AdUserName,OrderCode,PayMoney) Values('" & AdUserName & "','" & OrderCode & "'," & PayMoney & ")"
  Conn.Execute Sql
 Else
  Call AlertClose("�˶����Ѿ�����")
 End If
 Rs.Close


Class creatAlipayItemURL
Public Function creatAlipayItemURL(subject,body,out_trade_no,price,quantity,seller_email)
mystr = Array("service=create_direct_pay_by_user","partner="&partner,"subject="&subject,"body="&body,"out_trade_no="&out_trade_no,"price="&price,"discount="&discount,"show_url="&show_url,"quantity="&quantity,"payment_type=1","seller_email="&seller_email,"notify_url="&notify_url,"return_url="&return_url)
Count=ubound(mystr)
For i = Count TO 0 Step -1
    minmax = mystr( 0 )
    minmaxSlot = 0
    For j = 1 To i
            mark = (mystr( j ) > minmax)
        If mark Then 
            minmax = mystr( j )
            minmaxSlot = j
        End If
    Next
    If minmaxSlot <> i Then 
        temp = mystr( minmaxSlot )
        mystr( minmaxSlot ) = mystr( i )
        mystr( i ) = temp
    End If
 Next

For j = 0 To Count Step 1
  value = SPLIT(mystr( j ), "=")

  If  value(1)<>"" then
       If j=Count Then
       md5str= md5str&mystr( j )
	   Else 
       md5str= md5str&mystr( j )&"&"
	   End If 
  End If 
  Next
       md5str=md5str&key
	   sign=md5(md5str,2)
	itemURL	= itemURL&INTERFACE_URL 
	For j = 0 To Count Step 1
      
	    value = SPLIT(mystr( j ), "=")
		If  value(1)<>"" then
		itemURL= itemURL&mystr( j )&"&"
		End If 	     
  Next
		itemURL	= itemURL&"sign="&sign&"&sign_type="&"MD5"
		creatAlipayItemURL=itemURL
	End Function
End Class
%>


<%If RsSet("Pay_Default")="alipay" Then%>
<%
      show_url          =HttpPath(1)                   '��վ����ַ
	  seller_email		= RsSet("Pay_AlipayEmail")				'�����ó����Լ���֧�����ʻ�
	  partner			= RsSet("Pay_AlipayID")					'֧�������˻��ĺ��������ID
	  key			    = RsSet("Pay_AlipayKey")	'֧�����İ�ȫУ����

      notify_url			= ""	'�����������֪ͨ��ҳ�� Ҫ�� http://��ʽ������·��
	  return_url			= HttpPath(2)&"onlinepay_receive_alipay.asp"	'��������ת��ҳ�� Ҫ�� http://��ʽ������·��

	 
'��½ www.alipay.com ��, ���̼ҷ���,���Կ���֧������ȫУ����ͺ���id,������������
INTERFACE_URL="https://www.alipay.com/cooperate/gateway.do?"
%>

<%
   dingdan=OrderCode
    '�ͻ���վ�����ţ�����ȡϵͳʱ�䣬�ɸĳ���վ�Լ��ı�����
	
	subject			=	"tg_onlinepay"		'��Ʒ����
	body			=	"tg_onlinepay"		'body			��Ʒ����
	out_trade_no    =   dingdan       
	price		    =	PayMoney				'price��Ʒ����			0.01��50000.00
    quantity        =   "1"               '��Ʒ����,����߹��ﳵĬ��Ϊ1
	discount        =   "0"               '��Ʒ�ۿ�
    seller_email    =    RsSet("Pay_AlipayEmail")   '���ҵ�֧�����ʺ�
	Set AlipayObj	= New creatAlipayItemURL
	itemUrl=AlipayObj.creatAlipayItemURL(subject,body,out_trade_no,price,quantity,seller_email)
	
	
	Response.Redirect itemUrl
%>
<%End If%>


<%If RsSet("Pay_Default")="tenpay" Then%>
<% Response.Charset="GB2312" %>
<%
	' ��ȡ���������ڣ���ʽYYYYMMDD
	Function CFTGetServerDate 
		Dim strTmp, iYear,iMonth,iDate 
		iYear = Year(Date) 
		iMonth = Month(Date) 
		iDate = Day(Date) 

		strTmp = CStr(iYear)
		If iMonth < 10 Then 
			strTmp = strTmp & "0" & Cstr(iMonth)
		Else 
			strTmp = strTmp & Cstr(iMonth)
		End If 
		If iDate < 10 Then 
			strTmp = strTmp & "0" & Cstr(iDate) 
		Else 
			strTmp = strTmp & Cstr(iDate) 
		End If 
		CFTGetServerDate = strTmp 
	End Function

	Dim request_text
	Dim md5_sign

	spid		= RsSet("Pay_TenpayID")		' �����滻Ϊ����ʵ���̻���
	sp_key	= RsSet("Pay_TenpayKey")	' sp_key��32λ�̻���Կ, ���滻Ϊ����ʵ����Կ

	' �������������
	cmdno		= "1"				' �Ƹ�֧ͨ��Ϊ"1" (��ǰֻ֧�� cmdno=1)	
	bill_date	= CFTGetServerDate	' �������� (yyyymmdd)	
	bank_type	= "0"				' ��������:	0		�Ƹ�ͨ
									'			1001	��������   
									'			1002	�й���������  
									'			1003	�й���������  
									'			1004	�Ϻ��ֶ���չ����   
									'			1005	�й�ũҵ����  
									'			1006	�й���������  
									'			1008	���ڷ�չ����   
									'			1009	��ҵ����   

	desc		= "tg_onlinepay"		' ��Ʒ����
	purchaser_id = ""				' �û��Ƹ�ͨ�ʺţ����û�п����ÿ�
	bargainor_id = spid				' �̻���
	sp_billno	 = OrderCode		' �̻����ɵĶ�����(���32λ)	

	' ��Ҫ:
	' ���׵���(28λ): �̻���(10λ) + ����(8λ) + ��ˮ��(10λ), ���밴�˸�ʽ����, �Ҳ����ظ�
	' ���sp_billno����10λ, ���ȡ���е���ˮ�Ų��ּӵ�transaction_id��(����10λ��0)
	' ���sp_billno����10λ, ����0, �ӵ�transaction_id��
	transaction_id = spid & bill_date & Right(OrderCode,10)

	total_fee	 = PayMoney*100				' �ܽ��, ��Ϊ��λ
	fee_type	 = "1"				' ��������: 1 �C RMB(�����) 2 - USD(��Ԫ) 3 - HKD(�۱�)
	return_url	 = HttpPath(2)&"onlinepay_receive_tenpay.asp" ' �Ƹ�ͨ�ص�ҳ���ַ, (�255���ַ�)
	attach		 = ""	' �̻�˽������, ����ص�ҳ��ʱԭ������
	spbill_create_ip= Request.ServerVariables("REMOTE_ADDR")

	' ����MD5ǩ��    
	sign_text = "cmdno=" & cmdno & "&date=" & bill_date & "&bargainor_id=" & bargainor_id &_
        "&transaction_id=" & transaction_id & "&sp_billno=" & sp_billno &_
        "&total_fee=" & total_fee & "&fee_type=" & fee_type & "&return_url=" & return_url &_
        "&attach=" & attach & "&spbill_create_ip=" & spbill_create_ip & "&key=" & sp_key

	md5_sign = UCase(Md5(sign_text,2))        ' ת��Ϊ��д  
%>
<body onload='form1.submit();'>
<form method='post' name='form1' action="https://www.tenpay.com/cgi-bin/v1.0/pay_gate.cgi">
<input type=hidden name="cmdno"				value="<%=cmdno%>">
<input type=hidden name="date"			    value="<%=bill_date%>">
<input type=hidden name="bank_type"			value="<%=bank_type%>">
<input type=hidden name="desc"				value="<%=desc%>">
<input type=hidden name="purchaser_id"		value="<%=purchaser_id%>">
<input type=hidden name="bargainor_id"		value="<%=bargainor_id%>">
<input type=hidden name="transaction_id"	value="<%=transaction_id%>">
<input type=hidden name="sp_billno"			value="<%=sp_billno%>">
<input type=hidden name="total_fee"			value="<%=total_fee%>">
<input type=hidden name="fee_type"			value="<%=fee_type%>">
<input type=hidden name="return_url"		value="<%=return_url%>">
<input type=hidden name="attach"			value="<%=attach%>">
<input type=hidden name="spbill_create_ip"			value="<%=spbill_create_ip%>">
<input type=hidden name="sign"				value="<%=md5_sign%>">
<input name="pay"  type="submit" value="��ʼ����֧��">
</form>
<%End If%>


<%If RsSet("Pay_Default")="99bill" Then%>
<%
'*
'* @Description: ��Ǯ�����֧�����ؽӿڷ���
'* @Copyright (c) �Ϻ���Ǯ��Ϣ�������޹�˾
'* @version 2.0
'*

'����������˻���
''���¼��Ǯϵͳ��ȡ�û���ţ��û���ź��01��Ϊ����������˻��š�
merchantAcctId=RsSet("Pay_99BillID")

'�����������Կ
''���ִ�Сд.�����Ǯ��ϵ��ȡ
key=RsSet("Pay_99BillKey")

'�ַ���.�̶�ѡ��ֵ����Ϊ�ա�
''ֻ��ѡ��1��2��3.
''1����UTF-8; 2����GBK; 3����gb2312
''Ĭ��ֵΪ1
inputCharset="3"

'����������֧������ĺ�̨��ַ.��[pageUrl]����ͬʱΪ�ա������Ǿ��Ե�ַ��
''��Ǯͨ�����������ӵķ�ʽ�����׽�����͵�[bgUrl]��Ӧ��ҳ���ַ�����̻�������ɺ������<result>���Ϊ1��ҳ���ת��<redirecturl>��Ӧ�ĵ�ַ��
''�����Ǯδ���յ�<redirecturl>��Ӧ�ĵ�ַ����Ǯ����֧�����GEt��[pageUrl]��Ӧ��ҳ�档
bgUrl=HttpPath(2)&"onlinepay_receive_99bill.asp"
	
'���ذ汾.�̶�ֵ
''��Ǯ����ݰ汾�������ö�Ӧ�Ľӿڴ������
''������汾�Ź̶�Ϊv2.0
version="v2.0"

'��������.�̶�ѡ��ֵ��
''ֻ��ѡ��1��2��3
''1�������ģ�2����Ӣ��
''Ĭ��ֵΪ1
language="1"

'ǩ������.�̶�ֵ
''1����MD5ǩ��
''��ǰ�汾�̶�Ϊ1
signType="1"
   
'֧��������
''��Ϊ���Ļ�Ӣ���ַ�
payerName="payerName"

'֧������ϵ��ʽ����.�̶�ѡ��ֵ
''ֻ��ѡ��1
''1����Email
payerContactType="1"

'֧������ϵ��ʽ
''ֻ��ѡ��Email���ֻ���
payerContact=""

'�̻�������
''����ĸ�����֡���[-][_]���
orderId=OrderCode

'�������
''�Է�Ϊ��λ����������������
''�ȷ�2������0.02Ԫ
orderAmount=CDbl(PayMoney)*100

	
'�����ύʱ��
''14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
''�磻20080101010101
orderTime=getDateStr()

'��Ʒ����
''��Ϊ���Ļ�Ӣ���ַ�
productName="productName"

'��Ʒ����
''��Ϊ�գ��ǿ�ʱ����Ϊ����
productNum="1"

'��Ʒ����
''��Ϊ�ַ���������
productId=""

'��Ʒ����
productDesc=""
	
'��չ�ֶ�1
''��֧��������ԭ�����ظ��̻�
ext1=""

'��չ�ֶ�2
''��֧��������ԭ�����ظ��̻�
ext2=""
	
'֧����ʽ.�̶�ѡ��ֵ
''ֻ��ѡ��00��10��11��12��13��14
''00�����֧��������֧��ҳ����ʾ��Ǯ֧�ֵĸ���֧����ʽ���Ƽ�ʹ�ã�10�����п�֧��������֧��ҳ��ֻ��ʾ���п�֧����.11���绰����֧��������֧��ҳ��ֻ��ʾ�绰֧����.12����Ǯ�˻�֧��������֧��ҳ��ֻ��ʾ��Ǯ�˻�֧����.13������֧��������֧��ҳ��ֻ��ʾ����֧����ʽ��
payType="00"

'ͬһ������ֹ�ظ��ύ��־
''�̶�ѡ��ֵ�� 1��0
''1����ͬһ������ֻ�����ύ1�Σ�0��ʾͬһ��������û��֧���ɹ���ǰ���¿��ظ��ύ��Ρ�Ĭ��Ϊ0����ʵ�ﹺ�ﳵ�������̻�����0�������Ʒ���̻�����1
redoFlag="1"

'��Ǯ�ĺ��������˻���
''��δ�Ϳ�Ǯǩ���������Э�飬����Ҫ��д������
pid=""


   
'���ɼ���ǩ����
''����ذ�������˳��͹�����ɼ��ܴ���
	signMsgVal=appendParam(signMsgVal,"inputCharset",inputCharset)
	signMsgVal=appendParam(signMsgVal,"bgUrl",bgUrl)
	signMsgVal=appendParam(signMsgVal,"version",version)
	signMsgVal=appendParam(signMsgVal,"language",language)
	signMsgVal=appendParam(signMsgVal,"signType",signType)
	signMsgVal=appendParam(signMsgVal,"merchantAcctId",merchantAcctId)
	signMsgVal=appendParam(signMsgVal,"payerName",payerName)
	signMsgVal=appendParam(signMsgVal,"payerContactType",payerContactType)
	signMsgVal=appendParam(signMsgVal,"payerContact",payerContact)
	signMsgVal=appendParam(signMsgVal,"orderId",orderId)
	signMsgVal=appendParam(signMsgVal,"orderAmount",orderAmount)
	signMsgVal=appendParam(signMsgVal,"orderTime",orderTime)
	signMsgVal=appendParam(signMsgVal,"productName",productName)
	signMsgVal=appendParam(signMsgVal,"productNum",productNum)
	signMsgVal=appendParam(signMsgVal,"productId",productId)
	signMsgVal=appendParam(signMsgVal,"productDesc",productDesc)
	signMsgVal=appendParam(signMsgVal,"ext1",ext1)
	signMsgVal=appendParam(signMsgVal,"ext2",ext2)
	signMsgVal=appendParam(signMsgVal,"payType",payType)
	signMsgVal=appendParam(signMsgVal,"redoFlag",redoFlag)
	signMsgVal=appendParam(signMsgVal,"pid",pid)
	signMsgVal=appendParam(signMsgVal,"key",key)
signMsg= Ucase(md5(signMsgVal,2))
	
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

	'���ܺ�������ȡ14λ������
	Function getDateStr() 
	dim dateStr1,dateStr2,strTemp 
	dateStr1=split(cstr(formatdatetime(now(),2)),"-") 
	dateStr2=split(cstr(formatdatetime(now(),3)),":") 

	for each StrTemp in dateStr1 
	if len(StrTemp)<2 then 
	getDateStr=getDateStr & "0" & strTemp 
	else 
	getDateStr=getDateStr & strTemp 
	end if 
	next 

	for each StrTemp in dateStr2 
	if len(StrTemp)<2 then 
	getDateStr=getDateStr & "0" & strTemp 
	else 
	getDateStr=getDateStr & strTemp 
	end if
	next
	End function 
	'���ܺ�������ȡ14λ�����ڡ�����
	
%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>ʹ�ÿ�Ǯ֧��</title>
		<meta http-equiv="content-type" content="text/html; charset=gb2312" >
	</head>
	
<body onload='kqPay.submit();'>
	
	<div align="center">
		<table width="259" border="0" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC" >
			<tr bgcolor="#FFFFFF">
				<td width="80">֧����ʽ��</td>
				<td>��Ǯ[99bill]</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>������ţ�</td>
				<td><%=orderId %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>������</td>
				<td><%=orderAmount %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>֧���ˣ�</td>
				<td><%=payerName %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>��Ʒ���ƣ�</td>
				<td><%=productName %></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
	  </table>
	</div>

	<div align="center" style="font-size=12px;font-weight: bold;color=red;">
		<form name="kqPay" method="post" action="https://www.99bill.com/gateway/recvMerchantInfoAction.htm">
			<input type="hidden" name="inputCharset" value="<%=inputCharset %>">
			<input type="hidden" name="bgUrl" value="<%=bgUrl %>">
			<input type="hidden" name="version" value="<%=version %>">
			<input type="hidden" name="language" value="<%=language %>">
			<input type="hidden" name="signType" value="<%=signType %>">
			<input type="hidden" name="signMsg" value="<%=signMsg %>">
			<input type="hidden" name="merchantAcctId" value="<%=merchantAcctId %>">
			<input type="hidden" name="payerName" value="<%=payerName %>">
			<input type="hidden" name="payerContactType" value="<%=payerContactType %>">
			<input type="hidden" name="payerContact" value="<%=payerContact %>">
			<input type="hidden" name="orderId" value="<%=orderId %>">
			<input type="hidden" name="orderAmount" value="<%=orderAmount %>">
			<input type="hidden" name="orderTime" value="<%=orderTime %>">
			<input type="hidden" name="productName" value="<%=productName %>">
			<input type="hidden" name="productNum" value="<%=productNum %>">
			<input type="hidden" name="productId" value="<%=productId %>">
			<input type="hidden" name="productDesc" value="<%=productDesc %>">
			<input type="hidden" name="ext1" value="<%=ext1 %>">
			<input type="hidden" name="ext2" value="<%=ext2 %>">
			<input type="hidden" name="payType" value="<%=payType %>">
			<input type="hidden" name="redoFlag" value="<%=redoFlag %>">
			<input type="hidden" name="pid" value="<%=pid %>">
			
		</form>		
	</div>
<%End If%>


<%If RsSet("Pay_Default")="chinabank" Then%>

<%
'****************************************	
	v_mid = RsSet("Pay_ChinabankID")					                 ' �̻��ţ�����Ϊ�����̻���1001���滻Ϊ�Լ����̻���(�ϰ��̻���Ϊ4λ��5λ,�°�Ϊ8λ)����
	
	v_url = HttpPath(2)&"onlinepay_receive_chinabank.asp" ' �̻��Զ��巵�ؽ���֧�������ҳ�� Receive.asp Ϊ����ҳ��
									
	key = RsSet("Pay_ChinabankKey")									 ' �������û������MD5��Կ���½����Ϊ���ṩ�̻���̨����ַ��https://merchant3.chinabank.com.cn/
													 ' ��½��������ĵ�����������ҵ���B2C�����ڶ������������С�MD5��Կ���á� 
													 ' ����������һ��16λ���ϵ���Կ����ߣ���Կ���64λ��������16λ�Ѿ��㹻��
'****************************************%>


<%
								'�ж��Ƿ��д��ݶ�����
   
		  v_oid = OrderCode
	  

	v_amount = PayMoney		' �������
    v_amount = replace(v_amount,",","")
	v_moneytype = "CNY"					' ����

	text = v_amount&v_moneytype&v_oid&v_mid&v_url&key	' ƴ�ռ��ܴ�

	v_md5info=Ucase(trim(md5(text,2)))					' ����֧��ƽ̨��MD5ֵֻ�ϴ�д�ַ���������Сд��MD5ֵ��ת��Ϊ��д

'**********���¼���Ϊ��ѡ��Ϣ,��������������߻ᱣ�����Ϣ,ʹ�úͲ�ʹ�ö���Ӱ��֧����**************

	   v_rcvname = request("v_rcvname")			' �ջ���
	   v_rcvaddr = request("v_rcvaddr")			' �ջ���ַ
		v_rcvtel = request("v_rcvtel")			' �ջ��˵绰
	   v_rcvpost = request("v_rcvpost")			' �ջ����ʱ�
	  v_rcvemail = request("v_rcvemail")		' �ջ����ʼ�
	 v_rcvmobile = request("v_rcvmobile")		' �ջ����ֻ���

	 v_ordername = request("v_ordername")		' ����������
	 v_orderaddr = request("v_orderaddr")		' �����˵�ַ
	  v_ordertel = request("v_ordertel")		' �����˵绰
	 v_orderpost = request("v_orderpost")		' �������ʱ�
  	v_orderemail = request("v_orderemail")		' �������ʼ�
	v_ordermobile = request("v_ordermobile")	' �������ֻ���

		 remark1 = request("remark1")			' ��ע�ֶ�1
		 remark2 = request("remark2")			' ��ע�ֶ�2

%>

<!--������ϢΪ��׼�� HTML ��ʽ + ASP ���� ƴ�ն��ɵ� �������� ֧���ӿڱ�׼��ʾҳ�� �����޸�-->

<html>

<body onLoad="javascript:document.E_FORM.submit()">
<form action="https://pay3.chinabank.com.cn/PayGate?encoding=utf-8" method="POST" name="E_FORM">


    
  <input type="hidden" name="v_md5info"    value="<%=v_md5info%>" size="100">
  <input type="hidden" name="v_mid"        value="<%=v_mid%>">
  <input type="hidden" name="v_oid"        value="<%=v_oid%>">
  <input type="hidden" name="v_amount"     value="<%=v_amount%>">
  <input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
  <input type="hidden" name="v_url"        value="<%=v_url%>">
   
  <!--���¼�����Ϊ����֧����ɺ���֧��������Ϣһͬ������Ϣ����ҳ -->
    
  <input type="hidden"  name="remark1" value="<%=remark1%>">
  <input type="hidden"  name="remark2" value="<%=remark2%>">
    
<!--���¼���ֻ��������¼�ͻ���Ϣ�����Բ��ã���Ӱ��֧�� -->

	<input type="hidden"  name="v_rcvname"      value="<%=v_rcvname%>">
	<input type="hidden"  name="v_rcvaddr"      value="<%=v_rcvaddr%>">
	<input type="hidden"  name="v_rcvtel"       value="<%=v_rcvtel%>">
	<input type="hidden"  name="v_rcvpost"      value="<%=v_rcvpost%>">
	<input type="hidden"  name="v_rcvemail"     value="<%=v_rcvemail%>">
	<input type="hidden"  name="v_rcvmobile"    value="<%=v_rcvmobile%>">

	<input type="hidden"  name="v_ordername"    value="<%=v_ordername%>">
	<input type="hidden"  name="v_orderaddr"    value="<%=v_orderaddr%>">
	<input type="hidden"  name="v_ordertel"     value="<%=v_ordertel%>">
	<input type="hidden"  name="v_orderpost"    value="<%=v_orderpost%>">
	<input type="hidden"  name="v_orderemail"   value="<%=v_orderemail%>">
	<input type="hidden"  name="v_ordermobile"  value="<%=v_ordermobile%>">
  
  </form>
<%End If%>

