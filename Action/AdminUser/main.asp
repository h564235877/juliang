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
                  <p class="h6 text-white m-t-0">������վ������</p>
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
                  <p class="h6 text-white m-t-0">������վ������</p>
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
                  <p class="h6 text-white m-t-0">���й��</p>
                  <p class="h3 text-white m-b-0"><%=AdNum%>��</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-stackoverflow fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">��վ��</p>
                  <p class="h3 text-white m-b-0"><%=UserNum%>��</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>

		
<%
Sql="Select Count(1) From CFWztg_AdUser_Expend where AdminCheck=0"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>δ��˹�淢����<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close

Sql="Select Count(1) From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where a.CheckState=1"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>δ��˹���޸���<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close

Sql="Select Count(1) From CFWztg_Gbook where IsRead_Admin=0"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>����Աδ�ظ�������<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close

If RsSet("UserValid")=3 Then
Sql="Select Count(1) From CFWztg_User where UserType=1 And UserState=3"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>δ�����վ����<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close
End If

If RsSet("AdUserValid")=3 Then
Sql="Select Count(1) From CFWztg_User where UserType=2 And UserState=3"
Set Rs=Conn.Execute(Sql)
Response.write "<button class='btn btn-primary' type='button'>δ��˹������<span class='badge'>"&Rs(0)&"</span></button>&nbsp;&nbsp;"
Rs.Close
End If
%>

<table class="tb_2">
<tr>
<td>
<div class="explain">
���������ֺ�ɫ��ע����ʾ��Ϣ�����⣬������Ϣ�ɲ鿴&nbsp;&nbsp;<a href="../../AspxCheck.aspx" target="_blank" class="btn_add"><i class="fa fa-info-circle"></i> ̽��</a>
</div>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan=2>ʱ����Ϣ��ʾ</td>
</tr>
<tr>
  <td width="240" class="td_r">���ص�ǰʱ�䣺</td>
  <td><script>
        var now = new Date();
        
        var year = now.getFullYear();       //��
        var month = now.getMonth() + 1;     //��
        var day = now.getDate();            //��
        
        var hh = now.getHours();            //ʱ
        var mm = now.getMinutes();          //��
        var ss = now.getSeconds();           //��
        
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
<td class="td_r">��������ǰʱ�䣺</td>
<td><%=year(now)&"-"&Right("0"&month(now),2)&"-"&Right("0"&day(now),2)&" "&Right("0"&hour(now),2)&":"&Right("0"&minute(now),2)&":"&Right("0"&second(now),2)%>
<script>
var d = new Date()
if(Math.abs(parseInt(d.getTime()/1000)+28800-parseInt(<%=datediff("s","1970-1-1",now)%>))>3600){
document.write("<font color='#ff0000'>����ʱ��ͷ�����ʱ��������1Сʱ������cookiesʧЧ���������ʱ��������������׼ʱ��</font>");	
}

</script> 

</td>
</tr>


<tr class="tr_1"> 
 <td colspan=2>CDN����������Ϣ��ʾ</td>
</tr>
<tr>
  <td class="td_r">CDN����������ǰ���õ�״̬��</td>
  <td><%If RsSet("portmap")=1 Then Response.write "����" Else Response.write "�ر�" End If%></td>
</tr> 

<tr>
  <td class="td_r">CDN�Ƿ���Ҫ������ʾ��</td>
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
 <td colspan=2>.net���а汾���</td>
</tr>
<tr>
  <td class="td_r">.net���а汾��</td>
  <td>
<%
if AdScriptShowDomain="" Then
 Response.write "<iframe scrolling='no' width='100' height='14' src='../../cf.aspx?Action=aspxcheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"' frameborder='0' marginheight=0 marginwidth=0></iframe>"
Else
 Response.write "<iframe scrolling='no' width='100' height='14' src='"&AdScriptShowDomain&"cf.aspx?Action=aspxcheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"' frameborder='0' marginheight=0 marginwidth=0 ></iframe>"
End If
%>

(�粻����ʾ����2.0.50727.8762��ʽ�İ汾�ţ���ʾ.net�����޷����У�����.net2.0��3.0��3.5��֧��)</td>
</tr>


<%
CacheServer=RsSet("CacheServer")
CheckTime  = DateDiff("s", "1970-1-1", Now)
CheckCode  = Md5(CheckTime & RsSet("SysCode"), 2)
If CacheServer <> "" Then
%>
<tr class="tr_1">
 <td colspan=2>���ؾ���վ�����м��</td>
</tr>
<tr>
  <td class="td_r">�������</td>
  <td>
<%
MyArray = Split(CacheServer, ",")

Response.Write("��" & UBound(MyArray) + 1 & "��վ��<br>")
 For I = 0 To UBound(MyArray)
 Response.Write("��" & I + 1 & "��:<iframe scrolling='no' width='450' height='16' src='" & MyArray(I) & "cf.aspx?Action=cachecheck&CacheServer=" & MyArray(I) & "&CheckTime=" & CheckTime & "&CheckCode=" & CheckCode & "' frameborder='0' marginheight=0 marginwidth=0></iframe><br>")
 Next
%>
</td>
</tr>
<%end if%>
  
  <tr class="tr_1"> 
    <td colspan=2>����Ա��Ϣ</td>
  </tr>
<%
Sql="Select * From CFWztg_AdminUser where AdminUserName='"&GetStr(Session("CFWztgAdmin"),"AdminUserName")&"'"
Set Rs=Conn.Execute(Sql)
%>

  

<tr> 
<td class="td_r">
��һ�ε�¼ʱ�䣺
</td>
<td>
<%=Rs("PreviousLoginTime") %>
</td>
</tr>

<tr> 
<td class="td_r">
��һ�ε�¼IP��
</td>
<td>
<%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%>
</td>
</tr>

</table>




