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
Ad_ID=CLng(ChkStr(Request("Ad_ID"),2))

If Request("Ad_Class")<>"" Then Ad_Class=CInt(ChkStr(Request("Ad_Class"),2)) Else Ad_Class = RsSet("AdListDefaultClass")

AdShowType=ChkStr(Request("AdShowType"),1)

ClickState=CInt(ChkStr(Request("ClickState"),2))

Ad_Size=ChkStr(Request("Ad_Size"),1)

If Ad_Size<>"" Then
 AdWidth=ChkStr(Left(Ad_Size,Instr(Ad_Size,"x")-1),2)
 AdHeight=ChkStr(Mid(Ad_Size,Instr(Ad_Size,"x")+1),2)
End If


Sql = "Select ID,AdShowNum,ComVisit,ComReg,UserLevel From CFWztg_User Where UserName='" & UserName & "'"
Set Rs=Conn.Execute(Sql)
UserID = Rs("ID")
UserShowTotal = Rs("AdShowNum")
UserClickTotal = Rs("ComVisit")
UserRegTotal = Rs("ComReg")
UserLevel = Rs("UserLevel")
Rs.Close

%>


<div class="explain">
1."[]"内的数字代表这类广告形式里广告的数量，广告都可以在电脑和手机上投放，只要尺寸相符即可<br>
2.直链广告和软件下载的广告就是一个单独的网址链接，可发布在任何地方，没有显示数<br>
3.直图广告是图片和一个链接的组合，可发布在任意地方，包括普通网页和H5网页，APP应用等内，有显示数<br>
4.轮循类的是每次调用一个广告，刷新换另一个广告，此类是JS广告代码可一直固定不变<br>
5.混合类的广告是多广告主多广告共用一个代码，一次同时显示出来，此类是JS广告代码可一直固定不变，混合文字图片标签都可以自己设置广告代码的宽高。<br>
6.富媒体类的广告包括多种广告效果，右下角，对联，移动设备广告等
</div>


        
<%If Ad_Class=1 Or Ad_Class=2 Or Ad_Class=3 Or Ad_Class=4 Or Ad_Class=7 Then'--直链文字，直链图片，普通文字，普通图片，富媒体%>
<!--#Include File="adlist_common.asp"-->
<%End If%>

<%If Ad_Class=5 Then'--混合文字%>
<!--#Include File="adlist_5.asp"-->
<%End If%>

<%If Ad_Class=6 Then'--混合图片%>
<!--#Include File="adlist_6.asp"-->
<%End If%>

<%If Ad_Class=8 Or Ad_Class=9 Then'--强弹和退弹Then%>
<!--#Include File="adlist_popup.asp"-->
<%End If%>

<%If Ad_Class=10 Then'--混合标签云%>
<!--#Include File="adlist_10.asp"-->
<%End If%>

<%If Ad_Class=0 Then'--代理广告%>
<!--#Include File="adlist_0.asp"-->
<%End If%>

<%If Ad_Class = -1 Then'--轮循直链%>
<!--#Include File="adlist_1.asp"-->
<%End If%>

<%If Ad_Class = -4 Then'--轮循图片%>
<!--#Include File="adlist_4.asp"-->
<%End If%>

<%If Ad_Class = -7 Then'--轮循富媒体%>
<!--#Include File="adlist_7.asp"-->
<%End If%>

<%If Ad_Class = 11 Then'--混合富媒体%>
<!--#Include File="adlist_11.asp"-->
<%End If%>

<%If Ad_Class=12 Then'--软件下载安装%>
<!--#Include File="adlist_12.asp"-->
<%End If%>

