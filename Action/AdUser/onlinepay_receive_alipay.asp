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
 key=RsSet("Pay_AlipayKey")    ' ֧������ȫ������
 partner=RsSet("Pay_AlipayID")  '֧��������id

If partner="" Or partner="��ʵ����д������" Or key="" Or key="��ʵ����д������" Then
 Response.write "�̻�����Կ��������"
 Response.End
End If

	out_trade_no		= DelStr(Request("out_trade_no")) '��ȡ������
    total_fee		    = DelStr(Request("total_fee")) '��ȡ֧�����ܼ۸�
    receive_name    =DelStr(Request("receive_name"))   '��ȡ�ջ�������
	receive_address =DelStr(Request("receive_address")) '��ȡ�ջ��˵�ַ
	receive_zip     =DelStr(Request("receive_zip"))   '��ȡ�ջ����ʱ�
	receive_phone   =DelStr(Request("receive_phone")) '��ȡ�ջ��˵绰
	receive_mobile  =DelStr(Request("receive_mobile")) '��ȡ�ջ����ֻ�
	
	OrderCode = ChkStr(out_trade_no,1)'ȡ�÷���֧��ϵͳ���Լ�����Ķ�����

'******************************************�ж���Ϣ�ǲ���֧��������
alipayNotifyURL = "http://notify.alipay.com/trade/notify_query.do?"
alipayNotifyURL = alipayNotifyURL &"partner=" & partner & "&notify_id=" & request("notify_id")
	Set Retrieval = Server.CreateObject("Msxml2.ServerXMLHTTP.3.0")
    Retrieval.setOption 2, 13056 
    Retrieval.open "GET", alipayNotifyURL, False, "", "" 
    Retrieval.send()
    ResponseTxt = Retrieval.ResponseText
	Set Retrieval = Nothing
'*****************************************
'��ȡ֧����GET����֪ͨ��Ϣ,�ж���Ϣ�ǲ��Ǳ��޸Ĺ�
For Each varItem in Request.QueryString
mystr=varItem&"="&Request(varItem)&"^"&mystr
Next 
If mystr<>"" Then 
mystr=Left(mystr,Len(mystr)-1)
End If 

mystr = SPLIT(mystr, "^")
Count=ubound(mystr)
'�Բ�������
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
'����md5ժҪ�ַ���
 For j = 0 To Count Step 1
 value = SPLIT(mystr( j ), "=")
 If  value(1)<>"" And value(0)<>"sign" And value(0)<>"sign_type"  Then
 If j=Count Then
 md5str= md5str&mystr( j )
 Else 
 md5str= md5str&mystr( j )&"&"
 End If 
 End If 
 Next
md5str=md5str&key
 mysign=md5(md5str,2)
'********************************************************

If mysign=Request("sign") and ResponseTxt="true"   Then 	
%>
<!--#include file="OnlinePay_Ok.asp"-->
<%
Response.write "֧���ɹ�����رձ�ҳ"

Else
response.write "��תʧ��"          '�������ָ������Ҫ��ʾ������
End If 


	
	

Function DelStr(Str)
		If IsNull(Str) Or IsEmpty(Str) Then
			Str	= ""
		End If
		DelStr	= Replace(Str,";","")
		DelStr	= Replace(DelStr,"'","")
		DelStr	= Replace(DelStr,"&","")
		DelStr	= Replace(DelStr," ","")
		DelStr	= Replace(DelStr,"��","")
		DelStr	= Replace(DelStr,"%20","")
		DelStr	= Replace(DelStr,"--","")
		DelStr	= Replace(DelStr,"==","")
		DelStr	= Replace(DelStr,"<","")
		DelStr	= Replace(DelStr,">","")
		DelStr	= Replace(DelStr,"%","")
	End Function
%>