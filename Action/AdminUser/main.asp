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
Sql="Select IsNull(Sum(User_Income_Cent),0) As User_Income_Cent From CFWztg_AD_Counter_Day Where Datediff(d,AddDate,getdate())=0"
Set Rs2=Conn.Execute(Sql)
User_Income_Cent_T=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select IsNull(Sum(User_Income_Cent),0) As User_Income_Cent From CFWztg_AD_Counter_Day Where Datediff(d,AddDate,getdate())=1"
Set Rs2=Conn.Execute(Sql)
User_Income_Cent_Y=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select Spare_Cent From CFWztg_User Where UserName='"&UserName&"'"
Set Rs2=Conn.Execute(Sql)
Spare_Cent=FormatNumber(Cdbl(Rs2("Spare_Cent")),2,-1,0,0)
Rs2.Close

Sql="SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2"
Set Rs2=Conn.Execute(Sql)
AdNum=Rs2(0)
Rs2.Close

Sql="Select Count(1) From CFWztg_User Where UserType=1"
Set Rs2=Conn.Execute(Sql)
UserNum=Rs2(0)
Rs2.Close
%>

      <div class="container-fluid">
        
        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">今日网站主收入</p>
                  <p class="h3 text-white m-b-0"><%=User_Income_Cent_T%></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">昨日网站主收入</p>
                  <p class="h3 text-white m-b-0"><%=User_Income_Cent_Y%></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-checkerboard fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">运行广告</p>
                  <p class="h3 text-white m-b-0"><%=AdNum%>个</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-stackoverflow fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">网站主</p>
                  <p class="h3 text-white m-b-0"><%=UserNum%>个</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>

		
<%
Sql="Select Count(1) From CFWztg_AdUser_Expend where AdminCheck=0"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>未审核广告发布数<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close

Sql="Select Count(1) From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where a.CheckState=1"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>未审核广告修改数<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close

Sql="Select Count(1) From CFWztg_Gbook where IsRead_Admin=0"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>管理员未回复留言数<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close

If RsSet("UserValid")=3 Then
Sql="Select Count(1) From CFWztg_User where UserType=1 And UserState=3"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>未审核网站主数<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close
End If

If RsSet("AdUserValid")=3 Then
Sql="Select Count(1) From CFWztg_User where UserType=2 And UserState=3"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>未审核广告主数<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close
End If
%>

<table class="tb_2">
<tr>
<td>
<div class="explain">
如果下面出现红色标注的提示信息请留意，更多信息可查看&nbsp;&nbsp;<a href="../../AspxCheck.aspx" target="_blank" class="btn_add"><i class="fa fa-info-circle"></i> 探针</a>
</div>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan=2>时间信息提示</td>
</tr>
<tr>
  <td width="240" class="td_r">本地当前时间：</td>
  <td><script>
        var now = new Date();
        
        var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate();            //日
        
        var hh = now.getHours();            //时
        var mm = now.getMinutes();          //分
        var ss = now.getSeconds();           //秒
        
        var clock = year + "-";
        
        if(month < 10)
            clock += "0";
        
        clock += month + "-";
        
        if(day < 10)
            clock += "0";
            
        clock += day + " ";
        
        if(hh < 10)
            clock += "0";
            
        clock += hh + ":";
        if (mm < 10) clock += '0'; 
        clock += mm + ":"; 
         
        if (ss < 10) clock += '0'; 
        clock += ss; 
		
		document.write(clock);
		</script>
		</td>
</tr>
<tr>
<td class="td_r">服务器当前时间：</td>
<td><%=year(now)&"-"&Right("0"&month(now),2)&"-"&Right("0"&day(now),2)&" "&Right("0"&hour(now),2)&":"&Right("0"&minute(now),2)&":"&Right("0"&second(now),2)%>
<script>
var d = new Date()
if(Math.abs(parseInt(d.getTime()/1000)+28800-parseInt(<%=datediff("s","1970-1-1",now)%>))>3600){
document.write("<font color='#ff0000'>本地时间和服务器时间相差大于1小时会引起cookies失效，请把两者时间修正到北京标准时间</font>");	
}

</script> 

</td>
</tr>


<tr class="tr_1"> 
 <td colspan=2>CDN和云主机信息提示</td>
</tr>
<tr>
  <td class="td_r">CDN和云主机当前设置的状态：</td>
  <td><%If RsSet("portmap")=1 Then Response.write "开启" Else Response.write "关闭" End If%></td>
</tr> 

<tr>
  <td class="td_r">CDN是否需要开启提示：</td>
  <td>
<%
if AdScriptShowDomain="" Then
 Response.write "<script src='../../cf.aspx?Action=cdncheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"'></script>"
Else
 Response.write "<script src='"&AdScriptShowDomain&"cf.aspx?Action=cdncheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"'></script>"
End If
%>
</td>
</tr>

<tr class="tr_1">
 <td colspan=2>.net运行版本检测</td>
</tr>
<tr>
  <td class="td_r">.net运行版本：</td>
  <td>
<%
if AdScriptShowDomain="" Then
 Response.write "<iframe scrolling='no' width='100' height='14' src='../../cf.aspx?Action=aspxcheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"' frameborder='0' marginheight=0 marginwidth=0></iframe>"
Else
 Response.write "<iframe scrolling='no' width='100' height='14' src='"&AdScriptShowDomain&"cf.aspx?Action=aspxcheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"' frameborder='0' marginheight=0 marginwidth=0 ></iframe>"
End If
%>

(如不能显示类似2.0.50727.8762格式的版本号，表示.net环境无法运行，且需.net2.0或3.0或3.5版支持)</td>
</tr>


<%
CacheServer=RsSet("CacheServer")
CheckTime  = DateDiff("s", "1970-1-1", Now)
CheckCode  = Md5(CheckTime & RsSet("SysCode"), 2)
If CacheServer <> "" Then
%>
<tr class="tr_1">
 <td colspan=2>负载均衡站点运行检测</td>
</tr>
<tr>
  <td class="td_r">检测结果：</td>
  <td>
<%
MyArray = Split(CacheServer, ",")

Response.Write("共" & UBound(MyArray) + 1 & "个站点<br>")
 For I = 0 To UBound(MyArray)
 Response.Write("第" & I + 1 & "个:<iframe scrolling='no' width='450' height='16' src='" & MyArray(I) & "cf.aspx?Action=cachecheck&CacheServer=" & MyArray(I) & "&CheckTime=" & CheckTime & "&CheckCode=" & CheckCode & "' frameborder='0' marginheight=0 marginwidth=0></iframe><br>")
 Next
%>
</td>
</tr>
<%end if%>
  
  <tr class="tr_1"> 
    <td colspan=2>管理员信息</td>
  </tr>
<%
Sql="Select * From CFWztg_AdminUser where AdminUserName='"&GetStr(Session("CFWztgAdmin"),"AdminUserName")&"'"
Set Rs=Conn.Execute(Sql)
%>

  

<tr> 
<td class="td_r">
上一次登录时间：
</td>
<td>
<%=Rs("PreviousLoginTime") %>
</td>
</tr>

<tr> 
<td class="td_r">
上一次登录IP：
</td>
<td>
<%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%>
</td>
</tr>

</table>




