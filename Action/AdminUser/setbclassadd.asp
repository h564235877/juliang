<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回一级配置列表</a>
    <form name="form1" method="post" action="../../AdminUser.aspx?Action=setbclassaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
    <tr class="tr_1">
      <td colspan="2">设置增加</td>
    </tr>

      
      <tr>
        <td class="td_r">设置位置标识：</td>
        <td><input name="SetBClassFlag" type="text" id="SetBClassFlag" value="" size="40">
          (*正确的标识格式中只能含有英文字母，数字和下划线)</td>
      </tr>
      <tr>
        <td class="td_r">设置位置描述：</td>
        <td><input name="SetBClassDesc" type="text" id="SetBClassDesc" value="" size="40">
          &nbsp;*</td>
      </tr>
	  <tr>
	    <td class="td_r">设置的类型：</td>
	    <td><input name="SetType" type="radio" value="1" />
	      内部
        <input name="SetType" type="radio" value="2" checked="checked" />
        外部 *</td>
      </tr>
      <tr>
        <td class="td_r">排序数字：</td>
        <td><input name="SetTaxis" type="text" id="SetTaxis" value="0" size="40">
          &nbsp;*</td>
      </tr>
	  <tr>
        <td class="td_r">需更新的缓存名称：</td>
        <td><input name="AppName" type="text" id="AppName" value="" size="40">
</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" name="submit" value="增加" class="btn btn-primary"></td>
      </tr>
    
</table></form>