<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心-用户余额|XXXX电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="XXXX电影票,XXXX电影票网,XXXX电影院,XXXX影票,XXXX电影,电影票，电影"/>
    <meta name="description" content="XXXX电影票网是XXXX最大的电影票在线选座平台，同时XXXX电影票网还提供电影排期，影院信息查询、XXXX本土电影行业资讯等服务。看电影，来XXXX电影票选座"/>
    <#include "../common/head-css.ftl"/>
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-user-center">
    <div class="container fn-clear">
        <div class="menu-usercenter">
    	<#include "../common/account-menu.ftl"/>
		</div>
        <div class="box-con account-usercenter">
            <div class="account-info">
                <h3>账户余额</h3>
                <p class="fn-clear"><span class="fn-left pt">当前余额：</span><em id="account" class="fn-left pt">${bysj_account.balance}点</em></p>
            </div>
            
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">

$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "useraccount") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});  
</script>
</body>
</html>