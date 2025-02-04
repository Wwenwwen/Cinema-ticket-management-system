<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|用户管理-${title!""}</title>
<#include "../common/header.ftl"/>
<style>
td{
	vertical-align:middle;
}
</style>
</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">

      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-toolbar clearfix">
                <form class="pull-right search-bar" method="get" action="list" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      手机号 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">手机号</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${mobile!""}" name="mobile" placeholder="请输入手机号">
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                  </div>
                </form>
                <#include "../common/third-menu.ftl"/>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>头像</th>
                        <th>手机号</th>
                        <th>昵称</th>
                        <th>状态</th>
                        <th>性别</th>
                        <th>余额</th>
                        <th>添加时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as account>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${account.id}" data-status="${account.status}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	<img src="/photo/view?filename=${account.headPic}" width="60px" height="60px">
                        </td>
                        <td style="vertical-align:middle;">${account.mobile}</td>
                        <td style="vertical-align:middle;">${account.nickname!""}</td>
                        <td style="vertical-align:middle;">
                        	<#if account.status == 1>
                        	<font class="text-success">正常</font>
                        	<#else>
                        	<font class="text-warning">冻结</font>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if account.sex == 1>
                        	<font class="text-success">男</font>
                        	<#elseif user.sex == 2>
                        	<font class="text-info">女</font>
                        	<#else>
                        	<font class="text-warning">未知</font>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;" align="center">${account.balance}</td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${account.createTime}</font></td>
                      </tr>
                    </#list>
                    <#else>
                    <tr align="center"><td colspan="8">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?mobile=${mobile!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                  <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                  <#else>
                  <li><a href="list?mobile=${mobile!""}&currentPage=${showPage}">${showPage}</a></li>
                  </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?mobile=${mobile!""}&currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                  <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                </#if>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

//打开编辑页面
function edit(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行编辑！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	var status = $("input[type='checkbox']:checked").attr('data-status');
	$.confirm({
        title: '编辑用户状态',
        content: '' +
        '<form action="" class="formName">' +
        '<div class="form-group">' +
        '<label>请选择用户状态</label>' +
        '<select class="status form-control" required><option value="1">正常</option><option value="0">冻结</option></select>' +
        '</div>' +
        '</form>',
        buttons: {
            formSubmit: {
                text: '提交',
                btnClass: 'btn-blue',
                action: function () {
                    var newStatus = this.$content.find('.status').val();
                    if(status == newStatus){
                    	showWarningMsg('您没有做任何修改！');
                    	return;
                    }
                    ajaxRequest('edit','post',{id:id,status:newStatus},function(rst){
                    	showSuccessMsg('编辑成功',function(){
                    		window.location.reload();
                    	})
                    })
                }
            },
            cancel: {
                text: '取消'
            },
        },
        onContentReady: function () {
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                e.preventDefault();
                jc.$$formSubmit.trigger('click');
            });
        }
    });
}

//打开充值金额页面
function editBalance(url){
  if($("input[type='checkbox']:checked").length != 1){
    showWarningMsg('请选择一条数据进行编辑！');
    return;
  }
  var id = $("input[type='checkbox']:checked").val();
  var balance = $("input[type='checkbox']:checked").attr('data-balance');
  $.confirm({
    title: '用户充值',
    content: '' +
    '<form action="" class="formName">' +
    '<div class="form-group">' +
    '<label>请选择充值金额</label>' +
    '<input type="text" class="balance form-control" required>' +
    '</div>' +
    '</form>',
    buttons: {
      formSubmit: {
        text: '提交',
        btnClass: 'btn-blue',
        action: function () {
          var newBalance = this.$content.find('.balance').val();
          if(balance == newBalance){
            showWarningMsg('您没有做任何修改！');
            return;
          }
          ajaxRequest('editBalance','post',{id:id,balance:newBalance},function(rst){
            showSuccessMsg('充值成功',function(){
              window.location.reload();
            })
          })
        }
      },
      cancel: {
        text: '取消'
      },
    },
    onContentReady: function () {
      var jc = this;
      this.$content.find('form').on('submit', function (e) {
        e.preventDefault();
        jc.$$formSubmit.trigger('click');
      });
    }
  });
}

</script>
</body>
</html>