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
On Error Resume Next

Action=Request("Action")

If Action<>"" Then '检查文件是否存在
 Set Fs = Server.CreateObject("Scripting.FileSystemObject")
 If Fs.FileExists(server.mappath("Install.lock")) Then
  Response.write "Install.lock文件已经存在，操作中止!"
  Response.End
 End If
End If

If Action="dbrecoversave" Then

dbpath = Request("dbpath")
dbserver = Request("dbserver")
dbuser = Request("dbuser")
pwd = Request("pwd")
dbname = Request("dbname")
dbsavepath = Request("dbsavepath")
	
Sql = "use master	"&chr(13)&chr(10)
Sql = Sql & "declare	"&chr(13)&chr(10)
Sql = Sql & "@sql varchar(1000),	"&chr(13)&chr(10)
Sql = Sql & "@spid int,	"&chr(13)&chr(10)
Sql = Sql & "@dbname varchar(50),	"&chr(13)&chr(10)
Sql = Sql & "@dbpath varchar(255),	"&chr(13)&chr(10)
Sql = Sql & "@lqdataname varchar(50),	"&chr(13)&chr(10)
Sql = Sql & "@lqlogname varchar(50),	"&chr(13)&chr(10)
Sql = Sql & "@dbsavepath varchar(255),	"&chr(13)&chr(10)
Sql = Sql & "@datapath varchar(255),	"&chr(13)&chr(10)
Sql = Sql & "@logpath varchar(255),	"&chr(13)&chr(10)
Sql = Sql & "@sqlver varchar(1000)	"&chr(13)&chr(10)


Sql = Sql & "--需要备份文件还原到哪个数据库上，如填写的数据库存在则完全覆盖还原，如果不存在则会自动新建，支持sql2000,2005,2008,2012,2014，不支持sql2016但sql2016可手工还原		"&chr(13)&chr(10)
Sql = Sql & "set @dbname = '"&dbname&"'		"&chr(13)&chr(10)

Sql = Sql & "--原备份数据库完全路径，原备份文件一般以.bak扩展名结尾，填写格式如d:\1.bak		"&chr(13)&chr(10)
Sql = Sql & "set @dbpath = '"&Replace(Request("dbpath"),"'","''")&"'		"&chr(13)&chr(10)

Sql = Sql & "--还原后数据库的数据mdf文件和和日志ldf文件存放路径,一般填写程序的Data目录，以\结尾，如d:\		"&chr(13)&chr(10)
Sql = Sql & "set @dbsavepath = '"&dbsavepath&"'		"&chr(13)&chr(10)


Sql = Sql & "SELECT @sqlver = @@VERSION		"&chr(13)&chr(10)
Sql = Sql & "if charindex('8.00', @sqlver)<>0		"&chr(13)&chr(10)
Sql = Sql & "begin		"&chr(13)&chr(10)
Sql = Sql & " create table #restoreFileList (LogicalName varchar(255), PhysicalName varchar(255),Type VARCHAR(50), FileGroupName varchar(255), Size VARCHAR(50), MaxSize VARCHAR(50) )		"&chr(13)&chr(10)
Sql = Sql & " insert into #restoreFileList execute('restore filelistonly from disk=''' + @dbpath + '''')		"&chr(13)&chr(10)
Sql = Sql & " select @lqdataname=LogicalName from #restoreFileList where Type='D'		"&chr(13)&chr(10)
Sql = Sql & " select @lqlogname=LogicalName from #restoreFileList where Type='L'		"&chr(13)&chr(10)
Sql = Sql & " drop table #restoreFileList		"&chr(13)&chr(10)
Sql = Sql & "end		"&chr(13)&chr(10)
Sql = Sql & "else if charindex('9.00', @sqlver)<>0		"&chr(13)&chr(10)
Sql = Sql & "begin		"&chr(13)&chr(10)
Sql = Sql & " create table #restoreFileList2 (LogicalName varchar(255), PhysicalName varchar(255),Type VARCHAR(50), FileGroupName varchar(255), Size VARCHAR(50), MaxSize VARCHAR(50), Fileld VARCHAR(50), CreateLSN VARCHAR(50), DropLSN VARCHAR(50), Uniqueld uniqueidentifier, ReadOnlyLSN VARCHAR(50), ReadWriteLSN VARCHAR(50), BackupSizeInBytes VARCHAR(255), SourceBlockSize VARCHAR(50), FileGroupld VARCHAR(50), LogGroupGUID VARCHAR(50), DifferentialBaseLSN VARCHAR(50), DifferentialBaseGUID uniqueidentifier, IsReadOnly VARCHAR(50), IsPresent VARCHAR(50))		"&chr(13)&chr(10)
Sql = Sql & " insert into #restoreFileList2 execute('restore filelistonly from disk=''' + @dbpath + '''')		"&chr(13)&chr(10)
Sql = Sql & " select @lqdataname=LogicalName from #restoreFileList2 where Type='D'		"&chr(13)&chr(10)
Sql = Sql & " select @lqlogname=LogicalName from #restoreFileList2 where Type='L'		"&chr(13)&chr(10)
Sql = Sql & " drop table #restoreFileList2		"&chr(13)&chr(10)
Sql = Sql & "end		"&chr(13)&chr(10)
Sql = Sql & "else		"&chr(13)&chr(10)
Sql = Sql & "begin		"&chr(13)&chr(10)
Sql = Sql & " create table #restoreFileList3 (LogicalName varchar(255), PhysicalName varchar(255),Type VARCHAR(50), FileGroupName varchar(255), Size VARCHAR(50), MaxSize VARCHAR(50), Fileld VARCHAR(50), CreateLSN VARCHAR(50), DropLSN VARCHAR(50), Uniqueld uniqueidentifier, ReadOnlyLSN VARCHAR(50), ReadWriteLSN VARCHAR(50), BackupSizeInBytes VARCHAR(255), SourceBlockSize VARCHAR(50), FileGroupld VARCHAR(50), LogGroupGUID VARCHAR(50), DifferentialBaseLSN VARCHAR(50), DifferentialBaseGUID uniqueidentifier, IsReadOnly VARCHAR(50), IsPresent VARCHAR(50),TDEThumbprint varchar(50))		"&chr(13)&chr(10)
Sql = Sql & " insert into #restoreFileList3 execute('restore filelistonly from disk=''' + @dbpath + '''')		"&chr(13)&chr(10)
Sql = Sql & " select @lqdataname=LogicalName from #restoreFileList3 where Type='D'		"&chr(13)&chr(10)
Sql = Sql & " select @lqlogname=LogicalName from #restoreFileList3 where Type='L'		"&chr(13)&chr(10)
Sql = Sql & " drop table #restoreFileList3		"&chr(13)&chr(10)
Sql = Sql & "end		"&chr(13)&chr(10)

Sql = Sql & "set @datapath = @dbsavepath + @dbname + '_data.mdf'		"&chr(13)&chr(10)
Sql = Sql & "set @logpath = @dbsavepath + @dbname + '_log.ldf'		"&chr(13)&chr(10)

Sql = Sql & "set @sql='declare getspid cursor for select spid from sysprocesses where dbid=db_id(''' + @dbname + ''')'		"&chr(13)&chr(10)
Sql = Sql & "exec (@sql)		"&chr(13)&chr(10)
Sql = Sql & "open getspid		"&chr(13)&chr(10)
Sql = Sql & "fetch next from getspid into @spid		"&chr(13)&chr(10)
Sql = Sql & "while @@fetch_status <> -1		"&chr(13)&chr(10)
Sql = Sql & "begin		"&chr(13)&chr(10)
Sql = Sql & "exec('kill ' + @spid)		"&chr(13)&chr(10)
Sql = Sql & "fetch next from getspid into @spid		"&chr(13)&chr(10)
Sql = Sql & "end		"&chr(13)&chr(10)
Sql = Sql & "close getspid		"&chr(13)&chr(10)
Sql = Sql & "deallocate getspid		"&chr(13)&chr(10)

Sql = Sql & "restore   database   @dbname		"&chr(13)&chr(10)
Sql = Sql & " from   disk = @dbpath		"&chr(13)&chr(10)
Sql = Sql & "WITH REPLACE		"&chr(13)&chr(10)
Sql = Sql & "  ,move @lqdataname   to  @datapath		"&chr(13)&chr(10)
Sql = Sql & " ,move   @lqlogname   to   @logpath		"&chr(13)&chr(10)

 
 

ConnStr="Provider = Sqloledb;Data Source="&dbserver&";User ID="&dbuser&";Password="&pwd&";Initial Catalog=master;"
Set Conn = Server.CreateObject ("Adodb.Connection")
Conn.Open ConnStr
If Err Then
 err.Clear
 Set Conn = Nothing
 Response.Write "数据库连接出错，请检查用户名和密码是否正确，用户是否有管理员权限，数据库服务是否启动"
 Response.End
End If

Conn.Execute Sql

 Set Fso = Server.CreateObject("Scripting.FileSystemObject")
 
 MyStr = Char(10)
 Set Fout = Fso.Createtextfile(server.mappath("Install.lock"),true)
 Fout.WriteLine MyStr
 
 Response.write "<span style='font-size:12px'>数据库安装成功，请设置好conn.asp和web.config文件里连接数据库的参数，关闭本页面或返回<a href='?'>数据库安装界面</a></span>"
 Response.End
End If


If Action="adminpwdlockfilemodifysave" Then

 Set Fso = Server.CreateObject("Scripting.FileSystemObject")
 
 MyStr = Char(10)
 Set Fout = Fso.Createtextfile(server.mappath("Install.lock"),true)
 Fout.WriteLine MyStr
 
 Response.write "<span style='font-size:12px'>安装锁定文件生成成功，请关闭本页面或返回<a href='?'>数据库安装界面</a></span>"
 Response.End
End If
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html><head><title>数据库在线安装程序</title>
<style type="text/css">
body {text-align: left; font-family:Arial; margin:0; padding:0; background: #FFF; font-size:12px; color:#333333;}
table{font-size:12px;}

.tb_1{
 background-color:#ffffff;
 border:1px solid #C9DDF0;
 margin:5px 0px 5px 5px;
 width:768px;
 float:left;
}

 .tb_2{
 width:980px;
 background-color:#ffffff;
 border:1px solid #C9DDF0;
 margin:15px auto;
 clear:both;
}

 .tb_3{
 background-color:#ffffff;
 border:1px solid #C9DDF0;
 margin:10px auto;
 padding:0px;
 clear:both;
}

.tb_4{
 border:0px solid #C9DDF0;
 margin:5px 0px 5px 5px;
 border-collapse:collapse;
 font-size:12px;
 text-align:left;
 width:530px;
}

.tb_4 td{border-bottom: 1px dotted #C9DDF0;padding-left:6px;empty-cells:show;}


.tr_1{
 padding-left:5px;
 padding-top:5px;
 font-weight:bold;
 font-size:14px;
 height:24px;
 text-align:center;
 background-color:#F3F9FE;
}

.tr_2{
 text-align:center;
}



.td_1{
 text-align:left;
}
.td_2{
 text-align:center;
}
.td_3{
 text-align:right;
}

.right{
	display:inline;
	float:right
}
.clear{
	clear:both;
	height:0px;
}
.wrap{
	width:950px;;
	margin:0 auto;
}
.bord{
	border:#b0bec7 1px solid;
}


.t_button
{
	display: inline-table;
	display: -moz-inline-box;
	display: inline-block;
	margin: 1px;
	border-style: solid;
	border-width: 1px;
	border-color: #999999;
	border-top-color: #cccccc;
	border-left-color: #cccccc;
	background-color: #eeeeee;
	color: #333333;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 100%;
	white-space: nowrap;
	height:21px;
	line-height:21px;
	padding:0 3px;
}
.t_button:LINK
{
	text-decoration: none;
	color: #333333;
	background-color: #eeeeee;
}

.t_button:VISITED
{
	text-decoration: none;
	color: #333333;
	background-color: #eeeeee;
}
</style>
</HEAD>
<body>

<%
 '检查文件是否存在
Set Fs = Server.CreateObject("Scripting.FileSystemObject")
If Fs.FileExists(server.mappath("Install.lock")) Then
%>
<table class="tb_3" width="600">
          <tr class="tr_1"> 
            <td >数据库在线安装工具<br>(适用独立主机或VPS，虚拟主机请用虚拟主机管理面板安装)</td>
          </tr>
          
            <tr>
              <td style="margin:5px;font-size:12px;text-align:center">

Install.lock文件存在，无法进行数据库新安装<br><br>
请删除此文件后刷新本页面即可进行数据库安装工作<br><br>
操作完成后，会重新生成Install.lock文件，操作前必须删除此文件<br><br>
<a href="#" class="t_button" onClick="location.href='?RanStr=' + Math.random()">刷新本页面</a>

 </td>
            </tr>

</table>  



<%
Else
%>

<script>


function setupcheck(){ 

var dbserver = document.getElementById('dbserver').value;
var dbuser = document.getElementById('dbuser').value;
var dbname = document.getElementById('dbname').value;
var dbsavepath = document.getElementById('dbsavepath').value;

var i_count=0;

if(!document.getElementById("dbpath"))
{
 window.alert("数据库备份文件不存在");
 return false;
}
else
{
var check_length = document.form_dbrecover.dbpath.length;

if(typeof check_length == 'undefined')
{
 if(document.form_dbrecover.dbpath.checked)
 {
  i_count=1;
 }
}
else
{
 for(var i=0;i<check_length;i++)
 {
  if (document.form_dbrecover.dbpath[i].checked)
  {
   i_count=i_count+1;
  }
 }
}

}

if(i_count==0){
 window.alert("请选择要安装哪个数据库备份文件");
 return false;
}

if(dbserver==""){
 alert ('请填写数据库超级用户名');
 document.form_dbrecover.dbserver.focus();
 return false;
}

if(dbname==""){
 alert ('请填写要安装到哪个数据库');
 document.form_dbrecover.dbname.focus();
 return false;
}

if (/^[a-zA-Z][a-zA-Z0-9_]*$/.test(dbname)==false){
 alert ('数据库名只能是大小写字母、数字和下划线，且第一个字符必须是大小字母');
 document.form_dbrecover.dbname.focus();
 return false;
}

if (/[\\]$/i.test(dbsavepath)==false){
 alert ('安装时数据库文件存放路径最后一个字符必须是\\');
 document.form_dbrecover.dbsavepath.focus();
 return false;
}



return true;
}
</script>


<form name="form_dbrecover" id="form_dbrecover" method="post" action="?Action=dbrecoversave">
<table class="tb_3">
          <tr class="tr_1"> 
            <td >数据库在线安装工具<br>(适用独立主机或VPS，虚拟主机请用虚拟主机管理面板安装)</td>
          </tr>
          
          <tr>
    <td>
你可以选择进行以下两种操作：
<br><br>
一、<a href="?Action=adminpwdlockfilemodifysave" class="t_button"  onClick="return confirm('确定不安装数据库直接生成Install.lock模板修复锁定文件吗?')">点击这里不安装数据库,直接生成Install.lock安装锁定文件</a>
<br><br><br>
二、使用下面的三个步骤进行数据库安装，数据库安装后会重新生成Install.lock安装锁定文件<br><br></td>
  </tr>
  <tr>
    <td><strong>第1步：选择需要安装的数据库备份文件(一般为bak扩展名格式)</strong></td>
  </tr>
  <tr>
    <td>

<%
foldername=server.mappath("data")
path=foldername
If Instr(path,"\data")=0 Then Call AlertBack("不能浏览这个目录！",1)
ShowFolderList(path) 



Function ShowFolderList(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 
%>
<table style="width:100%">
                  <tr> 
                    <td>文件名称</td>
                    
          <td>大小</td>
                    

                    <td>修改时间</td>
                  </tr>
                  <% 
'列出目录 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
                  <tr> 
                    <td><%= f1.name%></td>
                    <td> 
                        <%MySize=f1.size/1024
	  If MySize<1024 Then Response.write FormatNumber(MySize,2,-1,0,0)&"K"
	  If MySize>=1024 Then Response.write FormatNumber(MySize/1024,2,-1,0,0)&"M"%>                    </td>

                    <td><%= f1.datelastmodified%></td>
                  </tr>
                  <% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"
'列出文件 
Set fc = f.Files 
For Each f1 in fc 
%>
                  <tr> 
                    <td>
<input type="radio" name="dbpath" id="dbpath" value="<%= path&"\"&f1.name%>" />
<%= f1.name%></td>
                    <td>
                        <%MySize=f1.size/1024
	  If MySize<1024 Then Response.write  FormatNumber(MySize,2,-1,0,0)&"K"
	  If MySize>=1024 Then Response.write  FormatNumber(MySize/1024,2,-1,0,0)&"M"%>                    </td>

                    <td><%= f1.datelastmodified%></td>
                  </tr>
                  <% 
Next 
set fso=nothing 
%>
        </table>
<%End Function %>		</td>
  </tr>
  <tr>
    <td><strong>第2步：填写数据库资料</strong></td>
  </tr>
  
  <tr>
    <td>数据库服务器地址(如localhost)：<br>
      <input name="dbserver" type="text" id="dbserver" value="localhost" style="width:300px;"><br><br>
      </td>
    </tr>

  <tr>
    <td>数据库管理员名(需有管理员权限,如默认的sa用户)：<br>
      <input name="dbuser" type="text" id="dbuser" value="sa" style="width:300px;"><br><br>
      </td>
    </tr>
    
  <tr>
    <td>数据库管理员密码：<br>
      <input name="pwd" type="password" id="pwd" value="" style="width:300px;"><br><br>
      </td>
    </tr>
    
  <tr>
    <td>把备份安装到哪个数据库上(如果数据库不存在则会自动新建,存在则会覆盖)：<br>
      <input name="dbname" type="text" id="dbname" value="" style="width:300px;"><br><br>
      </td>
    </tr>
    
  <tr>
    <td>安装时数据库文件存放路径，需服务器上存在的目录(必须以\结尾，如d:\)：<br>
      <input name="dbsavepath" type="text" id="dbsavepath" value="<%=server.mappath("data")&"\"%>" style="width:300px;"><br><br>
      </td>
    </tr>
    

  <tr>
    <td><strong>第3步：确认安装</strong></td>
  </tr>
  <tr>
    <td>
	
<input type="submit" name="submit" id="submit" value="点击安装数据库同时生成Install.lock安装锁定文件" class="t_button" style="width:300px;"  onclick="return setupcheck();">

</td>
</tr>
</table>
</form>

<%
End If
%>