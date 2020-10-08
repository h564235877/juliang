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
<% Response.Buffer = true %>
<meta name="TENCENT_ONELINE_PAYMENT" content="China TENCENT">
<html>
<%
'取返回参数
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

OrderCode = ChkStr(sp_billno,1)'取得发给支付系统的自己定义的订单号

'本地参数
spid	= RsSet("Pay_TenpayID")	' 这里替换为您的实际商户号
sp_key = RsSet("Pay_TenpayKey")		' sp_key是32位商户密钥, 请替换为您的实际密钥

If spid="" Or spid="请实际填写或留空" Or sp_key="" Or sp_key="请实际填写或留空" Then
 Response.write "商户或密钥参数错误"
 Response.End
End If

'返回值定义
Private Const retOK = 0					' 成功					
Private Const invalidSpid = 1			' 商户号错误
Private Const invalidSign = 2			' 签名错误
Private Const tenpayErr	= 3				' 财付通返回支付失败

'验签函数
Function verifyMd5Sign

	origText = "cmdno=" & cmdno & "&pay_result=" & pay_result &_ 
		       "&date=" & bill_date & "&transaction_id=" & transaction_id &_
			   "&sp_billno=" & sp_billno & "&total_fee=" & total_fee &_
			   "&fee_type=" & fee_type & "&attach=" & attach &_
			   "&key=" & sp_key
	
	localSignText = UCase(Md5(origText,2)) ' 转换为大写
	verifyMd5Sign = (localSignText = md5_sign)
	
End Function

'返回值
Dim retValue
retValue = retOK

'判断商户号
If bargainor_id <> spid Then
	retValue = invalidSpid
Else 
' 验签
	If verifyMd5Sign <> True Then
		retValue = invalidSign
	Else
' 检查财付通返回值
		If pay_result <> 0 Then
			retValue = tenpayErr
		End If
	End If
End If

'在这里处理业务逻辑 

'输出信息
Dim pay_msg
Select Case retValue
	Case retOK			pay_msg = "支付成功!"
	Case invalidSpid	pay_msg = "错误的商户号!"	
	Case invalidSign	pay_msg = "验证MD5签名失败!"
	Case Else			pay_msg = "支付失败!"
End Select

If pay_msg = "支付成功!" Then
%>

<!--#include file="OnlinePay_Ok.asp"-->

<%
Response.write "支付成功，请关闭本页"
End If
%>