<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>			
					

<%
Sql="Select IsNull(Sum(a.AdUser_Spend_Cent),0) As AdUser_Spend_Cent From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id and DateDiff(d,a.adddate,getdate())=0 Where b.AdUserName='"&AdUserName&"'"
Set Rs2=Conn.Execute(Sql)
AdUser_Spend_Cent_T=FormatNumber(Cdbl(Rs2("AdUser_Spend_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select IsNull(Sum(a.AdUser_Spend_Cent),0) As AdUser_Spend_Cent From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id and DateDiff(d,a.adddate,getdate())=1 Where b.AdUserName='"&AdUserName&"'"
Set Rs2=Conn.Execute(Sql)
AdUser_Spend_Cent_Y=FormatNumber(Cdbl(Rs2("AdUser_Spend_Cent")),2,-1,0,0)
Rs2.Close

Sql="Select Spare_Cent From CFWztg_User Where UserName='"&AdUserName&"'"
Set Rs2=Conn.Execute(Sql)
Spare_Cent=FormatNumber(Cdbl(Rs2("Spare_Cent")),2,-1,0,0)
Rs2.Close

Sql="SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"
Set Rs2=Conn.Execute(Sql)
AdNum=Rs2(0)
Rs2.Close
%>

      <div class="container-fluid">
        
        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">���ջ���</p>
                  <p class="h3 text-white m-b-0"><%=AdUser_Spend_Cent_T%></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">���ջ���</p>
                  <p class="h3 text-white m-b-0"><%=AdUser_Spend_Cent_Y%></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-checkerboard fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">�˻����</p>
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
                  <p class="h6 text-white m-t-0">���й��</p>
                  <p class="h3 text-white m-b-0"><%=AdNum%>��</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-stackoverflow fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
		
	
        <div class="row">
<table class="tb_1">
<tr> 
<TD>
��������רԱ��
<%
Sql="Select UpUserName From CFWztg_User Where UserName='"&AdUserName&"'"
Set Rs=Conn.Execute(Sql)
If Rs("UpUserName")<>"" Then

Sql="Select UserNick,QQ From CFWztg_User where UserType=4 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
If Not Rs2.Eof Then
 Response.write Rs2("UserNick")
 Response.write "��QQ:"&Rs2("QQ")&"&nbsp;<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&Rs2("QQ")&"&site=qq&menu=yes'><img border='0'  src='../../images/qqonline2.gif' alt='���������ҷ���Ϣ' title='���������ҷ���Ϣ'></a>"
Else
 Response.write "��ǰ����רԱʧЧ��<a href='?Action=datamodify'>����ѡ��һ��</a>?" 
End If
Rs2.Close

Else
 Response.write "��ǰû��ѡ������רԱ��<a href='?Action=datamodify'>ѡ��һ��</a>?" 
End If
Rs.Close
%>
</TD>
</TR>
</table>


		</div>
		
		
        
        <div class="row">
          
          <div class="col-lg-6"> 
            <div class="card">
              <div class="card-header">
                <h4>�������</h4>
              </div>
              <div class="card-body">
                <canvas class="js-chartjs-bars"></canvas>
              </div>
            </div>
          </div>
          
          <div class="col-lg-6"> 
            <div class="card">
              <div class="card-header">
                <h4>���PV</h4>
              </div>
              <div class="card-body">
                <canvas class="js-chartjs-lines"></canvas>
              </div>
            </div>
          </div>
           
        </div>
      </div>
	  
	  


