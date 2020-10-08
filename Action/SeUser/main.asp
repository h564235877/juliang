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
Sql="Select IsNull(Sum(a.SeUser_Income_Cent),0) As SeUser_Income_Cent From CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username and DateDiff(d,a.adddate,getdate())=0 Where b.upusername='"&SeUserName&"'"
Set Rs2=Conn.Execute(Sql)
User_Income_Cent_T=FormatNumber(Cdbl(Rs2("SeUser_Income_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select IsNull(Sum(a.SeUser_Income_Cent),0) As SeUser_Income_Cent From CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username and DateDiff(d,a.adddate,getdate())=1 Where b.upusername='"&SeUserName&"'"
Set Rs2=Conn.Execute(Sql)
User_Income_Cent_Y=FormatNumber(Cdbl(Rs2("SeUser_Income_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select Spare_Cent From CFWztg_User Where UserName='"&SeUserName&"'"
Set Rs2=Conn.Execute(Sql)
Spare_Cent=FormatNumber(Cdbl(Rs2("Spare_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select Count(1) From CFWztg_User where UpUserName='"&SeUserName&"' And UserType=1"
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
                  <p class="h6 text-white m-t-0">推广网站主</p>
                  <p class="h3 text-white m-b-0"><%=LowUserNum%>个</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
		
	
        <div class="row">

<%
Sql="Select * From CFWztg_User Where UserName='"&SeUserName&"'"
Set Rs=Conn.Execute(Sql)
UserID=Rs("ID")
UserTcRate=Rs("UserTcRate")
%>
<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"> 
<td>推广网站主链接</td>
</tr>
<tr> 
<td>
<INPUT id=lowusercode value=<%=AdPath_2%>?s=<%=UserID%> size=60>
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
</table>

<table class="tb_2">
<tr>
<td>
<div class="explain">
<%
Response.write "你对名下网站主收入的提成率:"&UserTcRate&"%"
%>，满<%=RsSet("LowSpendCent")%>元结算。
</div>
</td>
</tr>

</table>
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
	  
	  


