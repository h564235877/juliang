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
<!--#include file="../../Action/AdUser_Blue/main.asp"-->
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

<%If Action="passadlist" Or Action="pauseadlist" Or Action="waitadlist" Or Action="refuadlist" Or Action="overadlist" Then%>

<ul class="tab">
<li><a href="?Action=passadlist"<%If Action="passadlist" Then Response.write " class='selected'"%>><span>已经审核在运行的广告</span></a></li>
<li><a href="?Action=pauseadlist"<%If Action="pauseadlist" Then Response.write " class='selected'"%>><span>暂停中的广告</span></a></li>
<li><a href="?Action=waitadlist"<%If Action="waitadlist" Then Response.write " class='selected'"%>><span>等待审核的广告</span></a></li>
<li><a href="?Action=refuadlist"<%If Action="refuadlist" Then Response.write " class='selected'"%>><span>拒绝审核的广告</span></a></li>
<li><a href="?Action=overadlist"<%If Action="overadlist" Then Response.write " class='selected'"%>><span>已经完成的广告</span></a></li>
</ul>


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



<%If Action="lowuserlist" Or Action="lowuserdaytj" Or Action="orderlist" Or Action="orderadd" Or Action="orderadd_2" Or Action="ordermoreadd" Or Action="ordermoremodify" Or Action="orderdaytj" Or Action="orderdaytjgoodstime" Or Action="orderlowout" Then%>
<ul class="tab" style="margin-top:5px;margin-bottom:5px;">
<li><a href="?Action=lowuserlist"<%If Action="lowuserlist" Then Response.write " class='selected'"%>><span>CPA注册列表</span></a></li>
<li><a href="?Action=lowuserdaytj"<%If Action="lowuserdaytj" Then Response.write " class='selected'"%>><span>CPA注册每日统计</span></a></li>
<li><a href="?Action=orderlist"<%If Action="orderlist" Then Response.write " class='selected'"%>><span>CPS订单列表</span></a></li>
<li><a href="?Action=orderadd"<%If Action="orderadd" Or Action="orderadd_2" Then Response.write " class='selected'"%>><span>手工单个导入CPS订单</span></a></li>
<li><a href="?Action=ordermoreadd"<%If Action="ordermoreadd" Then Response.write " class='selected'"%>><span>手工批量导入CPS订单</span></a></li>
<li><a href="?Action=ordermoremodify"<%If Action="ordermoremodify" Then Response.write " class='selected'"%>><span>手工批量确认CPS订单</span></a></li>
</ul>

<ul class="tab" style="margin-top:5px;margin-bottom:5px;">
<li><a href="?Action=orderdaytj"<%If Action="orderdaytj" Then Response.write " class='selected'"%>><span>CPS每日统计[按导入时间]</span></a></li>
<li><a href="?Action=orderdaytjgoodstime"<%If Action="orderdaytjgoodstime" Then Response.write " class='selected'"%>><span>CPS每日统计[按商品购买时间]</span></a></li>
</ul>

<%End If%>

<%If Action="lowuserlist" Then%>
<!--#include file="../../Action/AdUser/lowuserlist.asp"-->
<%End If%>

<%If Action="lowuserdaytj" Then%>
<!--#include file="../../Action/AdUser/lowuserdaytj.asp"-->
<%End If%>


<%If Action="daytj" Or Action="daytjdetail" Or Action="hourtj" Or Action="iplist" Or Action="invalidiplist" Or Action="showlist" Or Action="lylist" Then%>
<ul class="tab">
<li><a href="?Action=daytj"<%If Action="daytj" Or Action="daytjdetail" Then Response.write " class='selected'"%>><span>每日数据及花费统计</span></a></li>
<li><a href="?Action=hourtj"<%If Action="hourtj" Then Response.write " class='selected'"%>><span>每小时数据</span></a></li>
<li><a href="?Action=iplist"<%If Action="iplist" Then Response.write " class='selected'"%>><span>有效点击IP</span></a></li>
<li><a href="?Action=invalidiplist"<%If Action="invalidiplist" Then Response.write " class='selected'"%>><span>无效点击IP</span></a></li>
<li><a href="?Action=showlist"<%If Action="showlist" Then Response.write " class='selected'"%>><span>最近显示</span></a></li>
<li><a href="?Action=lylist"<%If Action="lylist" Then Response.write " class='selected'"%>><span>点击来源</span></a></li>
</ul>

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


<%If Action="upunioncpain"  Or Action="upuniondataview" Or Action="upunioncpsview" Or Action="upuniondayview" Then%>

<ul class="tab">
<li><a href="?Action=upunioncpain"<%If Action="upunioncpain" Then Response.write " class='selected'"%>><span>上级联盟CPA数据导入</span></a></li>

<li><a href="?Action=upuniondataview"<%If Action="upuniondataview" Then Response.write " class='selected'"%>><span>上级联盟CPC、CPV和CPA收入导入</span></a></li>

<li><a href="?Action=upunioncpsview"<%If Action="upunioncpsview" Then Response.write " class='selected'"%>><span>上级联盟CPS收入导入</span></a></li>

<li><a href="?Action=upuniondayview"<%If Action="upuniondayview" Then Response.write " class='selected'"%>><span>上级联盟统计数据导入</span></a></li>
</ul>


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


<%If Action="pwdmodify" Or Action="pwdanswermodify" Or Action="datamodify" Then%>

<ul class="tab">
<li><a href="?Action=pwdmodify"<%If Action="pwdmodify" Then Response.write " class='selected'"%>><span>修改密码</span></a></li>
<li><a href="?Action=datamodify"<%If Action="datamodify" Then Response.write " class='selected'"%>><span>修改资料</span></a></li>
</ul>

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