<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<!--#Include File="../../Conn.asp"-->
<!--#Include File="../../include/MyFunction.asp"-->
<!--#Include File="../../include/Md5.asp"-->
<%
 key=RsSet("Pay_AlipayKey")    ' 支付宝安全教研码
 partner=RsSet("Pay_AlipayID")  '支付宝合作id

If partner="" Or partner="请实际填写或留空" Or key="" Or key="请实际填写或留空" Then
 Response.write "商户或密钥参数错误"
 Response.End
End If

	out_trade_no		= DelStr(Request("out_trade_no")) '获取定单号
    total_fee		    = DelStr(Request("total_fee")) '获取支付的总价格
    receive_name    =DelStr(Request("receive_name"))   '获取收货人姓名
	receive_address =DelStr(Request("receive_address")) '获取收货人地址
	receive_zip     =DelStr(Request("receive_zip"))   '获取收货人邮编
	receive_phone   =DelStr(Request("receive_phone")) '获取收货人电话
	receive_mobile  =DelStr(Request("receive_mobile")) '获取收货人手机
	
	OrderCode = ChkStr(out_trade_no,1)'取得发给支付系统的自己定义的订单号

'******************************************判断消息是不是支付宝发出
alipayNotifyURL = "http://notify.alipay.com/trade/notify_query.do?"
alipayNotifyURL = alipayNotifyURL &"partner=" & partner & "&notify_id=" & request("notify_id")
	Set Retrieval = Server.CreateObject("Msxml2.ServerXMLHTTP.3.0")
    Retrieval.setOption 2, 13056 
    Retrieval.open "GET", alipayNotifyURL, False, "", "" 
    Retrieval.send()
    ResponseTxt = Retrieval.ResponseText
	Set Retrieval = Nothing
'*****************************************
'获取支付宝GET过来通知消息,判断消息是不是被修改过
For Each varItem in Request.QueryString
mystr=varItem&"="&Request(varItem)&"^"&mystr
Next 
If mystr<>"" Then 
mystr=Left(mystr,Len(mystr)-1)
End If 

mystr = SPLIT(mystr, "^")
Count=ubound(mystr)
'对参数排序
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
'构造md5摘要字符串
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
Response.write "支付成功，请关闭本页"

Else
response.write "跳转失败"          '这里可以指定你需要显示的内容
End If 


	
	

Function DelStr(Str)
		If IsNull(Str) Or IsEmpty(Str) Then
			Str	= ""
		End If
		DelStr	= Replace(Str,";","")
		DelStr	= Replace(DelStr,"'","")
		DelStr	= Replace(DelStr,"&","")
		DelStr	= Replace(DelStr," ","")
		DelStr	= Replace(DelStr,"　","")
		DelStr	= Replace(DelStr,"%20","")
		DelStr	= Replace(DelStr,"--","")
		DelStr	= Replace(DelStr,"==","")
		DelStr	= Replace(DelStr,"<","")
		DelStr	= Replace(DelStr,">","")
		DelStr	= Replace(DelStr,"%","")
	End Function
%>