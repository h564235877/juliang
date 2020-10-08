<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<%If Action="main" Then%>
<!--#include file="../../Action/AdUser/main.asp"-->
<%End If%>

<%If Action="adadd" Then%>
<!--#include file="../../Action/AdUser/adadd.asp"-->
<%End If%>

<%If Action="imglist" Then%>
<!--#include file="../../Action/AdUser/imglist.asp"-->
<%End If%>

<%If Action="planlist" Then%>
<!--#include file="../../Action/AdUser/planlist.asp"-->
<%End If%>

<%If Action="planadd" Then%>
<!--#include file="../../Action/AdUser/planadd.asp"-->
<%End If%>

<%If Action="planmodify" Then%>
<!--#include file="../../Action/AdUser/planmodify.asp"-->
<%End If%>

<%If Action="planchase" Then%>
<!--#include file="../../Action/AdUser/planchase.asp"-->
<%End If%>

<%If Action="planview" Then%>
<!--#include file="../../Action/AdUser/planview.asp"-->
<%End If%>


<%If Action="passadlist" Then%>
<!--#include file="../../Action/AdUser/passadlist.asp"-->
<%End If%>

<%If Action="pauseadlist" Then%>
<!--#include file="../../Action/AdUser/pauseadlist.asp"-->
<%End If%>

<%If Action="waitadlist" Then%>
<!--#include file="../../Action/AdUser/waitadlist.asp"-->
<%End If%>

<%If Action="refuadlist" Then%>
<!--#include file="../../Action/AdUser/refuadlist.asp"-->
<%End If%>
		
<%If Action="overadlist" Then%>
<!--#include file="../../Action/AdUser/overadlist.asp"-->
<%End If%>

<%If Action="admodify" Then%>
<!--#include file="../../Action/AdUser/admodify.asp"-->
<%End If%>


<%If Action="lowuserlist" Then%>
<!--#include file="../../Action/AdUser/lowuserlist.asp"-->
<%End If%>

<%If Action="lowuserdaytj" Then%>
<!--#include file="../../Action/AdUser/lowuserdaytj.asp"-->
<%End If%>


<%If Action="daytj" Then%>
<!--#include file="../../Action/AdUser/daytj.asp"-->
<%End IF%>

<%If Action="daytjdetail" Then%>
<!--#include file="../../Action/AdUser/daytjdetail.asp"-->
<%End IF%>

<%If Action="hourtj" Then%>
<!--#include file="../../Action/AdUser/hourtj.asp"-->
<%End IF%>

<%If Action="iplist" Then%>
<!--#include file="../../Action/AdUser/iplist.asp"-->
<%End IF%>

<%If Action="invalidiplist" Then%>
<!--#include file="../../Action/AdUser/invalidiplist.asp"-->
<%End IF%>

<%If Action="lylist" Then%>
<!--#include file="../../Action/AdUser/lylist.asp"-->
<%End IF%>

<%If Action="showlist" Then%>
<!--#include file="../../Action/AdUser/showlist.asp"-->
<%End IF%>


<%If Action="orderlist" Then%>
<!--#include file="../../Action/AdUser/orderlist.asp"-->
<%end if%>

<%If Action="orderadd" Then%>
<!--#include file="../../Action/AdUser/orderadd.asp"-->
<%End IF%>

<%If Action="orderadd_2" Then%>
<!--#include file="../../Action/AdUser/orderadd_2.asp"-->
<%End IF%>


<%If Action="ordermoreadd" Then%>
<!--#include file="../../Action/AdUser/ordermoreadd.asp"-->
<%End IF%>


<%If Action="ordermoremodify" Then%>
<!--#include file="../../Action/AdUser/ordermoremodify.asp"-->
<%End IF%>

<%If Action="orderdaytj" Then%>
<!--#include file="../../Action/AdUser/orderdaytj.asp"-->
<%End IF%>

<%If Action="orderdaytjgoodstime" Then%>
<!--#include file="../../Action/AdUser/orderdaytjgoodstime.asp"-->
<%End IF%>


<%If Action="recsafecodemodify" Then%>
<!--#include file="../../Action/AdUser/recsafecodemodify.asp"-->
<%End if%>

<%If Action="reccodeview" Then%>
<!--#include file="../../Action/AdUser/reccodeview.asp"-->
<%End If%>


<%If Action="upunioncpain" Then%>
<!--#include file="../../Action/AdUser/upunioncpain.asp"-->
<%End If%>


<%If Action="upuniondataview" Then%>
<!--#include file="../../Action/AdUser/upuniondataview.asp"-->
<%End If%>

<%If Action="upunioncpsview" Then%>
<!--#include file="../../Action/AdUser/upunioncpsview.asp"-->
<%End If%>

<%If Action="upuniondayview" Then%>
<!--#include file="../../Action/AdUser/upuniondayview.asp"-->
<%End If%>

<%If Action="enoughlist" Then%>
<!--#include file="../../Action/AdUser/enoughlist.asp"-->
<%End If%>

<%If Action="onlinepay" Then%>
<!--#include file="../../Action/AdUser/onlinepay.asp"-->
<%End If%>


<%If Action="expendlist" Then%>
<!--#include file="../../Action/AdUser/expendlist.asp"-->
<%End If%>


<%If Action="pwdmodify" Then%>
<!--#include file="../../Action/AdUser/pwdmodify.asp"-->
<%End if%>

<%If Action="datamodify" Then%>
<!--#include file="../../Action/AdUser/datamodify.asp"--> 
<%End If%>

<%If Action="sysinfolist" Then%>
<!--#include file="../../Action/AdUser/sysinfolist.asp"--> 
<%End If%>

<%If Action="sysinfoshow" Then%>
<!--#include file="../../Action/AdUser/sysinfoshow.asp"--> 
<%End If%>

<%If Action="gbooklist" Then%> 
<!--#include file="../../Action/AdUser/gbooklist.asp"--> 
<%end if%>

<%If Action="gbookadd" Then%>
<!--#include file="../../Action/AdUser/gbookadd.asp"--> 
<%End IF%>


<%If Action="adadd" Then
Response.write "<script>"               &Chr(13)&Chr(10)
Response.write "function myshow()"      &Chr(13)&Chr(10)
Response.write "{"					    &Chr(13)&Chr(10)
Response.write  Show                    &Chr(13)&Chr(10)
Response.write "clearInterval(myst);"   &Chr(13)&Chr(10)
Response.write "}"                      &Chr(13)&Chr(10)
Response.write "myst=setInterval('myshow()',1);"  &Chr(13)&Chr(10)
Response.write "</script>"              &Chr(13)&Chr(10)
End If
%>