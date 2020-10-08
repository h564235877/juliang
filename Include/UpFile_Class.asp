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
'文件上传类
Class UpFile_Class

Dim Form,File
Dim AllowExt_	'允许上传类型(白名单)
Dim NoAllowExt_	'不允许上传类型(黑名单)
Dim IsDebug_ '是否显示出错信息
Private	oUpFileStream	'上传的数据流
Private isErr_		'错误的代码,0或true表示无错
Private ErrMessage_	'错误的字符串信息
Private isGetData_	'指示是否已执行过GETDATA过程

'------------------------------------------------------------------
'类的属性
Public Property Get Version
	Version="无惧上传类 Version V2.0"
End Property

Public Property Get isErr		'错误的代码,0或true表示无错
	isErr=isErr_
End Property

Public Property Get ErrMessage		'错误的字符串信息
	ErrMessage=ErrMessage_
End Property

Public Property Get AllowExt		'允许上传类型(白名单)
	AllowExt=AllowExt_
End Property

Public Property Let AllowExt(Value)	'允许上传类型(白名单)
	AllowExt_=LCase(Value)
End Property

Public Property Get NoAllowExt		'不允许上传类型(黑名单)
	NoAllowExt=NoAllowExt_
End Property

Public Property Let NoAllowExt(Value)	'不允许上传类型(黑名单)
	NoAllowExt_=LCase(Value)
End Property

Public Property Let IsDebug(Value)	'是否设置为调试模式
	IsDebug_=Value
End Property


'----------------------------------------------------------------
'类实现代码

'初始化类
Private Sub Class_Initialize
	isErr_ = 0
	NoAllowExt=""		'黑名单,可以在这里预设不可上传的文件类型,以文件的后缀名来判断,不分大小写,每个每缀名用;号分开,如果黑名单为空,则判断白名单
	NoAllowExt=LCase(NoAllowExt)
	AllowExt=""		'白名单,可以在这里预设可上传的文件类型,以文件的后缀名来判断,不分大小写,每个后缀名用;号分开
	AllowExt=LCase(AllowExt)
	isGetData_=false
End Sub

'类结束
Private Sub Class_Terminate	
	on error Resume Next
	'清除变量及对像
	Form.RemoveAll
	Set Form = Nothing
	File.RemoveAll
	Set File = Nothing
	oUpFileStream.Close
	Set oUpFileStream = Nothing
	if Err.number<>0 then OutErr("清除类时发生错误!")
End Sub

'分析上传的数据
Public Sub GetData (MaxSize)
	 '定义变量
	on error Resume Next
	if isGetData_=false then 
		Dim RequestBinDate,sSpace,bCrLf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,oFileInfo
		Dim sFormValue,sFileName
		Dim iFindStart,iFindEnd
		Dim iFormStart,iFormEnd,sFormName
		'代码开始
		If Request.TotalBytes < 1 Then	'如果没有数据上传
			isErr_ = 1
			ErrMessage_="没有数据上传,这是因为直接提交网址所产生的错误!"
			OutErr("没有数据上传,这是因为直接提交网址所产生的错误!!")
			Exit Sub
		End If
		If MaxSize > 0 Then '如果限制大小
			If Request.TotalBytes > MaxSize Then
			isErr_ = 2	'如果上传的数据超出限制大小
			ErrMessage_="上传的数据超出限制大小!"
			OutErr("上传的数据超出限制大小!")
			Exit Sub
			End If
		End If
		Set Form = Server.CreateObject ("Scripting.Dictionary")
		Form.CompareMode = 1
		Set File = Server.CreateObject ("Scripting.Dictionary")
		File.CompareMode = 1
		Set tStream = Server.CreateObject ("ADODB.Stream")
		Set oUpFileStream = Server.CreateObject ("ADODB.Stream")
		if Err.number<>0 then OutErr("创建流对象(ADODB.STREAM)时出错,可能系统不支持或没有开通该组件")
		oUpFileStream.Type = 1
		oUpFileStream.Mode = 3
		oUpFileStream.Open 
		oUpFileStream.Write Request.BinaryRead (Request.TotalBytes)
		oUpFileStream.Position = 0
		RequestBinDate = oUpFileStream.Read 
		iFormEnd = oUpFileStream.Size
		bCrLf = ChrB (13) & ChrB (10)
		'取得每个项目之间的分隔符
		sSpace = MidB (RequestBinDate,1, InStrB (1,RequestBinDate,bCrLf)-1)
		iStart = LenB(sSpace)
		iFormStart = iStart+2
		'分解项目
		Do
			iInfoEnd = InStrB (iFormStart,RequestBinDate,bCrLf & bCrLf)+3
			tStream.Type = 1
			tStream.Mode = 3
			tStream.Open
			oUpFileStream.Position = iFormStart
			oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart
			tStream.Position = 0
			tStream.Type = 2
			tStream.CharSet = "gb2312"
			sInfo = tStream.ReadText			
			'取得表单项目名称
			iFormStart = InStrB (iInfoEnd,RequestBinDate,sSpace)-1
			iFindStart = InStr (22,sInfo,"name=""",1)+6
			iFindEnd = InStr (iFindStart,sInfo,"""",1)
			sFormName = Mid(sinfo,iFindStart,iFindEnd-iFindStart)
			'如果是文件
			If InStr (45,sInfo,"filename=""",1) > 0 Then
				Set oFileInfo = new FileInfo_Class
				'取得文件属性
				iFindStart = InStr (iFindEnd,sInfo,"filename=""",1)+10
				iFindEnd = InStr (iFindStart,sInfo,""""&vbCrLf,1)
				sFileName = Trim(Mid(sinfo,iFindStart,iFindEnd-iFindStart))
				oFileInfo.FileName = GetFileName(sFileName)
				oFileInfo.FilePath = GetFilePath(sFileName)
				oFileInfo.FileExt = GetFileExt(sFileName)
				iFindStart = InStr (iFindEnd,sInfo,"Content-Type: ",1)+14
				iFindEnd = InStr (iFindStart,sInfo,vbCr)
				oFileInfo.FileMIME = Mid(sinfo,iFindStart,iFindEnd-iFindStart)
				oFileInfo.FileStart = iInfoEnd
				oFileInfo.FileSize = iFormStart -iInfoEnd -2
				oFileInfo.FormName = sFormName
				file.add sFormName,oFileInfo
			else
			'如果是表单项目
				tStream.Close
				tStream.Type = 1
				tStream.Mode = 3
				tStream.Open
				oUpFileStream.Position = iInfoEnd 
				oUpFileStream.CopyTo tStream,iFormStart-iInfoEnd-2
				tStream.Position = 0
				tStream.Type = 2
				tStream.CharSet = "gb2312"
				sFormValue = tStream.ReadText
				If Form.Exists (sFormName) Then
					Form (sFormName) = Form (sFormName) & ", " & sFormValue
					else
					Form.Add sFormName,sFormValue
				End If
			End If
			tStream.Close
			iFormStart = iFormStart+iStart+2
			'如果到文件尾了就退出
		Loop Until (iFormStart+2) >= iFormEnd 
		if Err.number<>0 then OutErr("分解上传数据时发生错误,可能客户端的上传数据不正确或不符合上传数据规则")
		RequestBinDate = ""
		Set tStream = Nothing
		isGetData_=true
	end if
End Sub

'保存到文件,自动覆盖已存在的同名文件
Public Function SaveToFile(Item,Path)
	SaveToFile=SaveToFileEx(Item,Path,True)
End Function

'保存到文件,自动设置文件名
Public Function AutoSave(Item,Path)
	AutoSave=SaveToFileEx(Item,Path,false)
End Function

'保存到文件,OVER为真时,自动覆盖已存在的同名文件,否则自动把文件改名保存
Private Function SaveToFileEx(Item,Path,Over)
	On Error Resume Next
	Dim FileExt
	if file.Exists(Item) then
		Dim oFileStream
		Dim tmpPath
		isErr_=0
		Set oFileStream = CreateObject ("ADODB.Stream")
		oFileStream.Type = 1
		oFileStream.Mode = 3
		oFileStream.Open
		oUpFileStream.Position = File(Item).FileStart
		oUpFileStream.CopyTo oFileStream,File(Item).FileSize
		tmpPath=Mid(Path,1,InstrRev(Path,".")-1)
		FileExt=GetFileExt(Path)
		if Over then
			if isAllowExt(FileExt) then
				oFileStream.SaveToFile tmpPath & "." & FileExt,2
				if Err.number<>0 then OutErr("保存文件时出错,请检查路径,是否存在该上传目录!该文件保存路径为" & tmpPath & "." & FileExt)
				Else
				isErr_=3
				ErrMessage_="该后缀名的文件不允许上传!"
				OutErr("该后缀名的文件不允许上传")
			End if
			Else
			Path=GetFilePath(Path)
			dim fori
			fori=1
			if isAllowExt(File(Item).FileExt) then
				do
					fori=fori+1
					Err.Clear()
					tmpPath=Path&GetNewFileName()&"."&File(Item).FileExt
					oFileStream.SaveToFile tmpPath
				loop Until ((Err.number=0) or (fori>50))
				if Err.number<>0 then OutErr("自动保存文件出错,已经测试50次不同的文件名来保存,请检查目录是否存在!该文件最后一次保存时全路径为"&Path&GetNewFileName()&"."&File(Item).FileExt)
				Else
				isErr_=3
				ErrMessage_="该后缀名的文件不允许上传!"
				OutErr("该后缀名的文件不允许上传")
			End if
		End if
		oFileStream.Close
		Set oFileStream = Nothing
	else
		ErrMessage_="不存在该对象(如该文件没有上传,文件为空)!"
		OutErr("不存在该对象(如该文件没有上传,文件为空)")
	end if
	if isErr_=3 then SaveToFileEx="" else SaveToFileEx=GetFileName(tmpPath)
End Function

'取得文件数据
Public Function FileData(Item)
	isErr_=0
	if file.Exists(Item) then
		if isAllowExt(File(Item).FileExt) then
			oUpFileStream.Position = File(Item).FileStart
			FileData = oUpFileStream.Read (File(Item).FileSize)
			Else
			isErr_=3
			ErrMessage_="该后缀名的文件不允许上传"
			OutErr("该后缀名的文件不允许上传")
			FileData=""
		End if
	else
		ErrMessage_="不存在该对象(如该文件没有上传,文件为空)!"
		OutErr("不存在该对象(如该文件没有上传,文件为空)")
	end if
End Function


'取得文件路径
Public function GetFilePath(FullPath)
  If FullPath <> "" Then
    GetFilePath = Left(FullPath,InStrRev(FullPath, "\"))
    Else
    GetFilePath = ""
  End If
End function

'取得文件名
Public Function GetFileName(FullPath)
  If FullPath <> "" Then
    GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
    Else
    GetFileName = ""
  End If
End function

'取得文件的后缀名
Public Function GetFileExt(FullPath)
  If FullPath <> "" Then
    GetFileExt = LCase(Mid(FullPath,InStrRev(FullPath, ".")+1))
    Else
    GetFileExt = ""
  End If
End function

'取得一个不重复的序号
Public Function GetNewFileName()
	dim ranNum
	dim dtNow
	dtNow=Now()
	randomize
	ranNum=int(90000*rnd)+10000
	'以下这段由webboy提供
	GetNewFileName=year(dtNow) & right("0" & month(dtNow),2) & right("0" & day(dtNow),2) & right("0" & hour(dtNow),2) & right("0" & minute(dtNow),2) & right("0" & second(dtNow),2) & ranNum
End Function

Public Function isAllowExt(Ext)
	if NoAllowExt="" then
		isAllowExt=cbool(InStr(1,";"&AllowExt&";",LCase(";"&Ext&";")))
		else
		isAllowExt=not CBool(InStr(1,";"&NoAllowExt&";",LCase(";"&Ext&";")))
	end if
End Function
End Class

Public Sub OutErr(ErrMsg)
if IsDebug_=true then
	Response.Write ErrMsg
	Response.End
	End if
End Sub

'----------------------------------------------------------------------------------------------------
'文件属性类
Class FileInfo_Class
Dim FormName,FileName,FilePath,FileSize,FileMIME,FileStart,FileExt
End Class

%>
