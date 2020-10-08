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
Sql="Select IsNull(Sum(User_Income_Cent),0) As User_Income_Cent From CFWztg_AD_Counter_Day Where UserName='"&UserName&"' And Datediff(d,AddDate,getdate())=0"
Set Rs2=Conn.Execute(Sql)
User_Income_Cent_T=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select IsNull(Sum(User_Income_Cent),0) As User_Income_Cent From CFWztg_AD_Counter_Day Where UserName='"&UserName&"' And Datediff(d,AddDate,getdate())=1"
Set Rs2=Conn.Execute(Sql)
User_Income_Cent_Y=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select Spare_Cent From CFWztg_User Where UserName='"&UserName&"'"
Set Rs2=Conn.Execute(Sql)
Spare_Cent=FormatNumber(Cdbl(Rs2("Spare_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select Count(1) From CFWztg_LowUser Where UserName='"&UserName&"'"
Set Rs2=Conn.Execute(Sql)
LowUserNum=Rs2(0)
Rs2.Close
%>

      <div class="container-fluid">
        
        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">今日收入</p>
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
                  <p class="h6 text-white m-t-0">昨日收入</p>
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
                  <p class="h6 text-white m-t-0">账户余额</p>
                  <p class="h3 text-white m-b-0"><%=Spare_Cent%></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-assistant fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">推广用户</p>
                  <p class="h3 text-white m-b-0"><%=LowUserNum%>个</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
		
	
        <div class="row">
<table class="tb_1">
<tr> 
<TD>
您的客服专员：
<%
Sql="Select UpUserName From CFWztg_User Where UserName='"&UserName&"'"
Set Rs=Conn.Execute(Sql)
If Rs("UpUserName")<>"" Then

Sql="Select UserNick,QQ From CFWztg_User where UserType=3 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
If Not Rs2.Eof Then
 Response.write Rs2("UserNick")
 Response.write "，QQ:"&Rs2("QQ")&"&nbsp;<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&Rs2("QQ")&"&site=qq&menu=yes'><img border='0'  src='../../images/qqonline2.gif' alt='点击这里给我发消息' title='点击这里给我发消息'></a>"
Else
 Response.write "当前客服专员失效，<a href='?Action=datamodify'>重新选择一个</a>?" 
End If
Rs2.Close

Else
 Response.write "当前没有选择客服专员，<a href='?Action=datamodify'>选择一个</a>?" 
End If
Rs.Close
%>
</TD>
</TR>
</table>


<%
If LowReg_Ad_ID<>0 Then
Sql="Select Count(1) From CFWztg_Ad Where ID="&LowReg_Ad_ID
Set Rs=Conn.Execute(Sql)
If Rs(0)>0 Then

Sql="Select ID From CFWztg_User Where UserName='"&UserName&"'"
Set Rs2=Conn.Execute(Sql)
UserID=Rs2("ID")
Rs2.Close
%>

<script src="../../js/clipboard.min.js"></script>

<table>
<tr> 
<td style="width:86px;">
<strong>下线推广地址</strong>
</td>
<td style="width:320px;">
<INPUT id=lowusercode value=<%=AdPath_2%>cf.aspx?<%=UserID%> type="text" readonly style="width:320px;" class="form-control">
</td>
<td >
<input type="button" value="复制" id="copya1" data-clipboard-target="#lowusercode" data-clipboard-action="copy" class="btn btn-sm btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
</td>
</tr>
<tr>
<td colspan="3">
<div class="explain">
<%
If RsSet("UserTcLayer")>0 Then
 Response.write "本系统支持"&RsSet("UserTcLayer")&"级用户推荐提成功能，"
 If RsSet("UserTcLayer")>=1 Then Response.write "一级(直接推荐的用户)：" & RsSet("UserTcLayer1Rate") & "%，"
 If RsSet("UserTcLayer")>=2 Then Response.write "二级用户提成：" & RsSet("UserTcLayer2Rate") & "%，"
 If RsSet("UserTcLayer")>=3 Then Response.write "三级用户提成：" & RsSet("UserTcLayer3Rate") & "%，"
 If RsSet("UserTcLayer")>=4 Then Response.write "四级用户提成：" & RsSet("UserTcLayer4Rate") & "%，"
 If RsSet("UserTcLayer")>=5 Then Response.write "五级用户提成：" & RsSet("UserTcLayer5Rate") & "%，"
 Response.write "为永久提成收益高，欢迎推广！请不要自己推荐自己，这类行为会严惩。"
End If
%>
</div>

</td>
</tr>
</table>

<%Else%>
<table class="tb_1">
<tr class="tr_1"> 
<td>下线推广地址</td>
</tr>
<tr> 
<td>
下线广告ID不存在，需管理员重新指定
</td>
</tr>
</table>

<%
End If
End If
%>
		</div>
		
		
        
        <div class="row">
          
          <div class="col-lg-6"> 
            <div class="card">
              <div class="card-header">
                <h4>最近收入</h4>
              </div>
              <div class="card-body">
                <canvas class="js-chartjs-bars"></canvas>
              </div>
            </div>
          </div>
          
          <div class="col-lg-6"> 
            <div class="card">
              <div class="card-header">
                <h4>最近PV</h4>
              </div>
              <div class="card-body">
                <canvas class="js-chartjs-lines"></canvas>
              </div>
            </div>
          </div>
           
        </div>
      </div>
	  
	  


