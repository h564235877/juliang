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
If Request("RecCodeType")="" Then RecCodeType=1 Else RecCodeType=CInt(ChkStr(Request("RecCodeType"),2))
%>

<script src="../../js/clipboard.min.js"></script>
<ul class="tab">
<li><a href="?Action=<%=Action%>&RecCodeType=1"<%If RecCodeType=1 Then Response.write " class='selected'"%>><span>CPA注册接口</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=2"<%If RecCodeType=2 Then Response.write " class='selected'"%>><span>CPS订单接口</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=3"<%If RecCodeType=3 Then Response.write " class='selected'"%>><span>CPS订单查询接口</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=4"<%If RecCodeType=4 Then Response.write " class='selected'"%>><span>CPS订单确认接口</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=5"<%If RecCodeType=5 Then Response.write " class='selected'"%>><span>点击确认及计算PV代码</span></a></li>
</ul>


<%If RecCodeType=1 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPA注册接口</td>
</tr>
<tr> 
<td>
checkcode:定单接口验证码，格式：md5(lowusername&接口密钥)，其中&为asp里字符串进行和并的符号，PHP里为.号，广告开启了URL验证这个值则必须</td>
</tr>

<tr> 
<td>方法1:(Iframe方式调用 ,修改你网站的用户注册页面,注册成功后执行此代码,再转向注册成功后的页面,作用为推荐注册的用户为点数用户名参数名为username(必须),checkcode(如果广告里开启了Url验证这个也必须))</td>
</tr>
<tr> 
<td><textarea id="rec1" cols="80" rows="3"><iframe src='<%=AdPath%>cf.aspx?action=lowreg&lowusername=&checkcode=' frameBorder=0 width=0 height=0 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea> 
<input type="button" value="复制" id="copy1" data-clipboard-target="#rec1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copy1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>

</td>
</tr>
  
<tr>
<td>方法2:url方式调用 ,用户在注册页面注册后，在进入的页面投放下面的代码，进入的页面的url里带用户名，用户名参数名为username(必须),checkcode(如果广告里开启了Url验证这个也必须)</td>
</tr>
<tr> 
<td>
<textarea id="rec2" cols="80" rows="10">
<script> 
var lowusername="";
var checkcode="";
myurl = window.location.href; 
pos = myurl.indexOf("?")
if(pos>0){
 parastr = myurl.substring(pos+1);
 if (myurl.indexOf("&")==-1){ 
   pos = parastr.indexOf("="); 
   if(parastr.substring(0,pos).toLowerCase()=="username"){
    lowusername=parastr.substring(pos+1); 
   }
 }
 else{
  para = parastr.split("&"); 
  for(i=0;i<para.length;i++){ 
   mystr = para[i];
   pos = mystr.indexOf("="); 
   if(mystr.substring(0,pos).toLowerCase()=="username"){
    lowusername=mystr.substring(pos+1); 
   }
   if(mystr.substring(0,pos).toLowerCase()=="checkcode"){
    checkcode=mystr.substring(pos+1); 
   }
  } 
 }
}
if(lowusername!=""){
 document.write("<iframe src='<%=AdPath%>cf.aspx?action=lowreg&lowusername="+lowusername+"&checkcode="+checkcode+"' frameBorder=0 width=0 height=0 marginheight=0 marginwidth=0 scrolling=no></iframe>");
}
</script></textarea>

<input type="button" value="复制" id="copy2" data-clipboard-target="#rec2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copy2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>

</td>
</tr>
</table>
<%End If%>


<%If RecCodeType=2 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPS订单接口</td>
</tr>
<tr>
<td><p>请把成功付费消费的定单用参数传递到以下接口：<br>
<textarea id="rec1" cols="80" rows="6"><iframe src='<%=AdPath%>cf.aspx?action=orderadd&adusername=<%=AdUserName%>&ad_id=&ordercode=&orderuser=&orderusertype=&ordercent=&ordertcrate=&tcobject=&tctype=&checkcode=&goodsname=&goodstotal=&goodstime=&goodstime=&exname=&excode=&exstate=&excontent=&orderdesc=' frameBorder=0 width=350 height=12 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea>

<input type="button" value="复制" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>

<p>参数说明：<br>
1.ad_id:导入到哪个CPS广告的ID号<br>
2.ordercode:订单号码<br>
3.orderuser:订单用户的用户名<br>
4.orderusertype:订单用户的用户名类型，1为英文用户名，2为数字ID<br>
5.ordercent:订单金额，数字，以元为单位<br>
6.ordertcrate:定单提成比率例数字，0-100之间为空时，为系统默认提成比率<%=RsSet("UserOrderTcRate")%>%<br>
7.tcobject:定单提成给谁，1订单人的推荐人，2定单人自己<br>
8.tctype:定单提成类型，1即时提成，2等待确认<br>
9.checkcode:定单接口验证码，格式如下<br />
asp或asp.net格式：md5(ad_id&ordercode&orderuser&orderusertype&ordercent&ordertcrate&tcobject&tctype&接口密钥)<br />
php格式：md5($ad_id.$ordercode.$orderuser.$orderusertype.$ordercent.$ordertcrate.$tcobject.$tctype.$接口密钥)<br /><br />
以上1-9为必填写参数且md5加密里各参数顺序不能混乱，以下为可选参数，存在则会更新<br><br />
10.goodsname:商品名称<br>
11.goodstotal:商品总购买数量<br>
12.goodstime:商品购买时间,填写的话格式如:1970-1-1 0:0:0<br>
13.exname:快递名称<br>
14.excode:快递单号<br>
15.exstate:快递状态<br>
16.excontent:快递进度<br>
17.orderdesc:订单其它描述<br>
</td>
</tr>
</table>
<%End If%>

<%If RecCodeType=3 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPS订单查询接口</td>
</tr>
<tr>
<td><p>查询订单是否在推广系统里存在：<br>
<textarea id="rec1" cols="80" rows="5"><iframe src='<%=AdPath%>cf.aspx?action=orderquery&adusername=<%=adusername%>&orderuser=&orderusertype=&ordercode=&ordercent=&ordertcrate=&tcobject=&tctype=&goodsname=&goodstime=' frameBorder=0 width=170 height=12 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea>

<input type="button" value="复制" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>
          
<p>参数说明：<br>
1.ordercode:订单号码<br>
2.orderusertype:订单用户的用户名类型，1为英文用户名，2为数字ID
<br>	
<br>
</td>
</tr>

</table>
<%End If%>


<%If RecCodeType=4 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPS订单确认接口</td>
</tr>
<tr>
<td><p>等待确认的订单可以用这个接口确认：<br>
<textarea id="rec1" cols="80" rows="5"><iframe src='<%=AdPath%>cf.aspx?action=orderaffirm&ordercode=&checkcode=' frameBorder=0 width=170 height=12 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea>

<input type="button" value="复制" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>
          
<p>参数说明：<br>
1.ordercode:订单号码<br>
2.checkcode:定单接口验证码，格式：md5(ordercode&接口密钥)，其中&为asp里字符串进行和并的符号，PHP里为.号，各参数顺序不能混乱<br>		
<br>
</td>
</tr>

</table>
<%End If%>


<%If RecCodeType=5 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>点击确认及计算PV总数接口代码</td>
</tr>
<tr> 
<td>调用方法1：广告主在页面上请加上下面的代码，javascript调用方式,能产生PV数：PV总数接口代码，对应开启了需要确认的广告的广告链接必须加上ad_id={ad_id}的参数标签</td>
</tr>
<tr>
<td>
<textarea id="rec1" cols="80" rows="10"><script> 
var ad_id="";
myurl = window.location.href; 
pos = myurl.indexOf("?")
if(pos>0){
 parastr = myurl.substring(pos+1);
 if (myurl.indexOf("&")==-1){ 
   pos = parastr.indexOf("="); 
   if(parastr.substring(0,pos).toLowerCase()=="ad_id"){
    ad_id=parastr.substring(pos+1); 
   }
 }
 else{
  para = parastr.split("&"); 
  for(i=0;i<para.length;i++){ 
   mystr = para[i];
   pos = mystr.indexOf("="); 
   if(mystr.substring(0,pos).toLowerCase()=="ad_id"){
    ad_id=mystr.substring(pos+1); 
   }
  } 
 }
}
if(ad_id!=""){
 document.write("<scr"+"ipt src='<%=AdPath%>cf.aspx?action=adaffirm&adusername=<%=adusername%>&ad_id="+ad_id+"&delaytime=&adaffirmstep=&adaffirmselfstr=&adaffirmtime=&adaffirmcheckcode=&otherclass=&otherflag=' charset='gbk'></scr"+"ipt>");
}
</script></textarea>

<input type="button" value="复制" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>
          
<p>参数说明：<br>
1.adusername：广告主名称<br>
2.ad_id：广告ID(自动获取url里的ad_id参数值不必填写)<br>
3.delaytime:延时确认的秒数，为空时则不延时即时确认点击，非必选项<br>
4.adaffirmstep:当前是第几步确认 ,为空时将不做步骤验证，最大支持3个顺序确认步骤，非必选项<br>
5.adaffirmselfstr:自己定义的参数，非必选项<br>
6.adaffirmtime:距离1970-1-1秒数，为空时为不验证，非必选项<br>
7.adaffirmcheckcode:验证码,Md5(AdUserName & AD_ID & DelayTime & AdAffirmStep & AdAffirmSelfStr & AdAffirmTime & 用户IP & 广告主密钥)，非必选项<br>
8.otherclass:其它统计分类名，非必选项<br>
9.otherflag:其它统计的标识，非必选项<br>

</td>
</tr>
<tr> 
<td>调用方法2：在广告页面的链接上按下面方法做，不能产生PV数</td>
</tr>

<tr>
<td>
<textarea id="rec2" cols="80" rows="5"><%=AdPath%>cf.aspx?action=adaffirmdo&adusername=<%=adusername%>&ad_id=&delaytime=&adaffirmstep=&adaffirmselfstr=&adaffirmtime=&adaffirmcheckcode=&otherclass=&otherflag=&reurl=</textarea>

<input type="button" value="复制" id="copy2" data-clipboard-target="rec2" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy2") );
</script>
          
<p>参数说明：<br>
1.reurl:确认点击后转向到哪个URL，留空则不转向，必选项<br>
</td>
</tr>
</table>
<%End If%>