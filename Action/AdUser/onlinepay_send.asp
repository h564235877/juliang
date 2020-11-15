<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
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

If AdUserName="" Or OrderCode="" Then Call AlertClose("必须的参数不能为空")
If PayMoney="" Then Call AlertClose("请输入充值金额")
If CLng(PayMoney)<RsSet("Pay_LowCent") Then Call AlertClose("最低充值金额不够")
 
 '插入一个订单，在线支付是否完成默认为没有完成。。
 Sql="Select Count(1) From CFWztg_AdUser_OnlinePay Where OrderCode='"&OrderCode&"'"
 Set Rs=Conn.Execute(Sql)
 If Rs(0)=0 Then
  Sql = "Insert Into CFWztg_AdUser_OnlinePay(AdUserName,OrderCode,PayMoney) Values('" & AdUserName & "','" & OrderCode & "'," & PayMoney & ")"
  Conn.Execute Sql
 Else
  Call AlertClose("此订单已经存在")
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
      show_url          =HttpPath(1)                   '网站的网址
	  seller_email		= RsSet("Pay_AlipayEmail")				'请设置成您自己的支付宝帐户
	  partner			= RsSet("Pay_AlipayID")					'支付宝的账户的合作者身份ID
	  key			    = RsSet("Pay_AlipayKey")	'支付宝的安全校验码

      notify_url			= ""	'付完款后服务器通知的页面 要用 http://格式的完整路径
	  return_url			= HttpPath(2)&"onlinepay_receive_alipay.asp"	'付完款后跳转的页面 要用 http://格式的完整路径

	 
'登陆 www.alipay.com 后, 点商家服务,可以看到支付宝安全校验码和合作id,导航栏的下面
INTERFACE_URL="https://www.alipay.com/cooperate/gateway.do?"
%>

<%
   dingdan=OrderCode
    '客户网站订单号，（现取系统时间，可改成网站自己的变量）
	
	subject			=	"tg_onlinepay"		'商品名称
	body			=	"tg_onlinepay"		'body			商品描述
	out_trade_no    =   dingdan       
	price		    =	PayMoney				'price商品单价			0.01～50000.00
    quantity        =   "1"               '商品数量,如果走购物车默认为1
	discount        =   "0"               '商品折扣
    seller_email    =    RsSet("Pay_AlipayEmail")   '卖家的支付宝帐号
	Set AlipayObj	= New creatAlipayItemURL
	itemUrl=AlipayObj.creatAlipayItemURL(subject,body,out_trade_no,price,quantity,seller_email)
	
	
	Response.Redirect itemUrl
%>
<%End If%>


<%If RsSet("Pay_Default")="tenpay" Then%>
<% Response.Charset="GB2312" %>
<%
	' 获取服务器日期，格式YYYYMMDD
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

	spid		= RsSet("Pay_TenpayID")		' 这里替换为您的实际商户号
	sp_key	= RsSet("Pay_TenpayKey")	' sp_key是32位商户密钥, 请替换为您的实际密钥

	' 下面是请求参数
	cmdno		= "1"				' 财付通支付为"1" (当前只支持 cmdno=1)	
	bill_date	= CFTGetServerDate	' 交易日期 (yyyymmdd)	
	bank_type	= "0"				' 银行类型:	0		财付通
									'			1001	招商银行   
									'			1002	中国工商银行  
									'			1003	中国建设银行  
									'			1004	上海浦东发展银行   
									'			1005	中国农业银行  
									'			1006	中国民生银行  
									'			1008	深圳发展银行   
									'			1009	兴业银行   

	desc		= "tg_onlinepay"		' 商品名称
	purchaser_id = ""				' 用户财付通帐号，如果没有可以置空
	bargainor_id = spid				' 商户号
	sp_billno	 = OrderCode		' 商户生成的订单号(最多32位)	

	' 重要:
	' 交易单号(28位): 商户号(10位) + 日期(8位) + 流水号(10位), 必须按此格式生成, 且不能重复
	' 如果sp_billno超过10位, 则截取其中的流水号部分加到transaction_id后部(不足10位左补0)
	' 如果sp_billno不足10位, 则左补0, 加到transaction_id后部
	transaction_id = spid & bill_date & Right(OrderCode,10)

	total_fee	 = PayMoney*100				' 总金额, 分为单位
	fee_type	 = "1"				' 货币类型: 1 – RMB(人民币) 2 - USD(美元) 3 - HKD(港币)
	return_url	 = HttpPath(2)&"onlinepay_receive_tenpay.asp" ' 财付通回调页面地址, (最长255个字符)
	attach		 = ""	' 商户私有数据, 请求回调页面时原样返回
	spbill_create_ip= Request.ServerVariables("REMOTE_ADDR")

	' 生成MD5签名    
	sign_text = "cmdno=" & cmdno & "&date=" & bill_date & "&bargainor_id=" & bargainor_id &_
        "&transaction_id=" & transaction_id & "&sp_billno=" & sp_billno &_
        "&total_fee=" & total_fee & "&fee_type=" & fee_type & "&return_url=" & return_url &_
        "&attach=" & attach & "&spbill_create_ip=" & spbill_create_ip & "&key=" & sp_key

	md5_sign = UCase(Md5(sign_text,2))        ' 转换为大写  
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
<input name="pay"  type="submit" value="开始在线支付">
</form>
<%End If%>


<%If RsSet("Pay_Default")="99bill" Then%>
<%
'*
'* @Description: 快钱人民币支付网关接口范例
'* @Copyright (c) 上海快钱信息服务有限公司
'* @version 2.0
'*

'人民币网关账户号
''请登录快钱系统获取用户编号，用户编号后加01即为人民币网关账户号。
merchantAcctId=RsSet("Pay_99BillID")

'人民币网关密钥
''区分大小写.请与快钱联系索取
key=RsSet("Pay_99BillKey")

'字符集.固定选择值。可为空。
''只能选择1、2、3.
''1代表UTF-8; 2代表GBK; 3代表gb2312
''默认值为1
inputCharset="3"

'服务器接受支付结果的后台地址.与[pageUrl]不能同时为空。必须是绝对地址。
''快钱通过服务器连接的方式将交易结果发送到[bgUrl]对应的页面地址，在商户处理完成后输出的<result>如果为1，页面会转向到<redirecturl>对应的地址。
''如果快钱未接收到<redirecturl>对应的地址，快钱将把支付结果GEt到[pageUrl]对应的页面。
bgUrl=HttpPath(2)&"onlinepay_receive_99bill.asp"
	
'网关版本.固定值
''快钱会根据版本号来调用对应的接口处理程序。
''本代码版本号固定为v2.0
version="v2.0"

'语言种类.固定选择值。
''只能选择1、2、3
''1代表中文；2代表英文
''默认值为1
language="1"

'签名类型.固定值
''1代表MD5签名
''当前版本固定为1
signType="1"
   
'支付人姓名
''可为中文或英文字符
payerName="payerName"

'支付人联系方式类型.固定选择值
''只能选择1
''1代表Email
payerContactType="1"

'支付人联系方式
''只能选择Email或手机号
payerContact=""

'商户订单号
''由字母、数字、或[-][_]组成
orderId=OrderCode

'订单金额
''以分为单位，必须是整型数字
''比方2，代表0.02元
orderAmount=CDbl(PayMoney)*100

	
'订单提交时间
''14位数字。年[4位]月[2位]日[2位]时[2位]分[2位]秒[2位]
''如；20080101010101
orderTime=getDateStr()

'商品名称
''可为中文或英文字符
productName="productName"

'商品数量
''可为空，非空时必须为数字
productNum="1"

'商品代码
''可为字符或者数字
productId=""

'商品描述
productDesc=""
	
'扩展字段1
''在支付结束后原样返回给商户
ext1=""

'扩展字段2
''在支付结束后原样返回给商户
ext2=""
	
'支付方式.固定选择值
''只能选择00、10、11、12、13、14
''00：组合支付（网关支付页面显示快钱支持的各种支付方式，推荐使用）10：银行卡支付（网关支付页面只显示银行卡支付）.11：电话银行支付（网关支付页面只显示电话支付）.12：快钱账户支付（网关支付页面只显示快钱账户支付）.13：线下支付（网关支付页面只显示线下支付方式）
payType="00"

'同一订单禁止重复提交标志
''固定选择值： 1、0
''1代表同一订单号只允许提交1次；0表示同一订单号在没有支付成功的前提下可重复提交多次。默认为0建议实物购物车结算类商户采用0；虚拟产品类商户采用1
redoFlag="1"

'快钱的合作伙伴的账户号
''如未和快钱签订代理合作协议，不需要填写本参数
pid=""


   
'生成加密签名串
''请务必按照如下顺序和规则组成加密串！
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
	
	'功能函数。将变量值不为空的参数组成字符串
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
	'功能函数。将变量值不为空的参数组成字符串。结束

	'功能函数。获取14位的日期
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
	'功能函数。获取14位的日期。结束
	
%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>使用快钱支付</title>
		<meta http-equiv="content-type" content="text/html; charset=gb2312" >
	</head>
	
<body onload='kqPay.submit();'>
	
	<div align="center">
		<table width="259" border="0" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC" >
			<tr bgcolor="#FFFFFF">
				<td width="80">支付方式：</td>
				<td>快钱[99bill]</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>订单编号：</td>
				<td><%=orderId %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>订单金额：</td>
				<td><%=orderAmount %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>支付人：</td>
				<td><%=payerName %></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>商品名称：</td>
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
	v_mid = RsSet("Pay_ChinabankID")					                 ' 商户号，这里为测试商户号1001，替换为自己的商户号(老版商户号为4位或5位,新版为8位)即可
	
	v_url = HttpPath(2)&"onlinepay_receive_chinabank.asp" ' 商户自定义返回接收支付结果的页面 Receive.asp 为接收页面
									
	key = RsSet("Pay_ChinabankKey")									 ' 如果您还没有设置MD5密钥请登陆我们为您提供商户后台，地址：https://merchant3.chinabank.com.cn/
													 ' 登陆后在上面的导航栏里可能找到“B2C”，在二级导航栏里有“MD5密钥设置” 
													 ' 建议您设置一个16位以上的密钥或更高，密钥最多64位，但设置16位已经足够了
'****************************************%>


<%
								'判断是否有传递订单号
   
		  v_oid = OrderCode
	  

	v_amount = PayMoney		' 订单金额
    v_amount = replace(v_amount,",","")
	v_moneytype = "CNY"					' 币种

	text = v_amount&v_moneytype&v_oid&v_mid&v_url&key	' 拼凑加密串

	v_md5info=Ucase(trim(md5(text,2)))					' 网银支付平台对MD5值只认大写字符串，所以小写的MD5值得转换为大写

'**********以下几项为可选信息,如果发送网银在线会保存此信息,使用和不使用都不影响支付！**************

	   v_rcvname = request("v_rcvname")			' 收货人
	   v_rcvaddr = request("v_rcvaddr")			' 收货地址
		v_rcvtel = request("v_rcvtel")			' 收货人电话
	   v_rcvpost = request("v_rcvpost")			' 收货人邮编
	  v_rcvemail = request("v_rcvemail")		' 收货人邮件
	 v_rcvmobile = request("v_rcvmobile")		' 收货人手机号

	 v_ordername = request("v_ordername")		' 订货人姓名
	 v_orderaddr = request("v_orderaddr")		' 订货人地址
	  v_ordertel = request("v_ordertel")		' 订货人电话
	 v_orderpost = request("v_orderpost")		' 订货人邮编
  	v_orderemail = request("v_orderemail")		' 订货人邮件
	v_ordermobile = request("v_ordermobile")	' 订货人手机号

		 remark1 = request("remark1")			' 备注字段1
		 remark2 = request("remark2")			' 备注字段2

%>

<!--以下信息为标准的 HTML 格式 + ASP 语言 拼凑而成的 网银在线 支付接口标准演示页面 无需修改-->

<html>

<body onLoad="javascript:document.E_FORM.submit()">
<form action="https://pay3.chinabank.com.cn/PayGate?encoding=utf-8" method="POST" name="E_FORM">


    
  <input type="hidden" name="v_md5info"    value="<%=v_md5info%>" size="100">
  <input type="hidden" name="v_mid"        value="<%=v_mid%>">
  <input type="hidden" name="v_oid"        value="<%=v_oid%>">
  <input type="hidden" name="v_amount"     value="<%=v_amount%>">
  <input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
  <input type="hidden" name="v_url"        value="<%=v_url%>">
   
  <!--以下几项项为网上支付完成后，随支付反馈信息一同传给信息接收页 -->
    
  <input type="hidden"  name="remark1" value="<%=remark1%>">
  <input type="hidden"  name="remark2" value="<%=remark2%>">
    
<!--以下几项只是用来记录客户信息，可以不用，不影响支付 -->

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

