<!--修改订单状态页面ftl-->
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/admin/X-admin-2.2/css/font.css">
    <link rel="stylesheet" href="/admin/X-admin-2.2/css/xadmin.css">
    <script type="text/javascript" src="/admin/X-admin-2.2/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/admin/X-admin-2.2/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <input type="hidden" name="orderId" value="${Order.id!""}">

            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    订单流水号：</label>
                <div class="layui-input-inline">
                    <input type="text"  value="${Order.orderNo!""}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="parentId" class="layui-form-label">
                    <span class="x-red">*</span>订单状态：</label>
                <div class="layui-input-inline">
                    <select id="state" name="state" class="valid">
                        <#if Order.state == 0>
                            <option value="0" selected="selected">未支付</option>
                            <option value="1">已支付，待发货</option>
                            <option value="2">已取消</option>
                            <option value="3">已送达，待签收</option>
                            <option value="4">已签收</option>
                            <option value="5">已发货</option>
                        <#elseif Order.state == 1>
                            <option value="0">未支付</option>
                            <option value="1" selected="selected">已支付，待发货</option>
                            <option value="2">已取消</option>
                            <option value="3">已送达，待签收</option>
                            <option value="4">已签收</option>
                            <option value="5">已发货</option>
                        <#elseif Order.state == 2>
                            <option value="0">未支付</option>
                            <option value="1">已支付，待发货</option>
                            <option value="2" selected="selected">已取消</option>
                            <option value="3">已送达，待签收</option>
                            <option value="4">已签收</option>
                            <option value="5">已发货</option>
                        <#elseif Order.state == 3>
                            <option value="0">未支付</option>
                            <option value="1">已支付，待发货</option>
                            <option value="2">已取消</option>
                            <option value="3" selected="selected">已送达，待签收</option>
                            <option value="4">已签收</option>
                            <option value="5">已发货</option>
                        <#elseif Order.state == 4>
                            <option value="0">未支付</option>
                            <option value="1">已支付，待发货</option>
                            <option value="2">已取消</option>
                            <option value="3">已送达，待签收</option>
                            <option value="4" selected="selected">已签收</option>
                            <option value="5">已发货</option>
                        <#elseif Order.state == 5>
                            <option value="0">未支付</option>
                            <option value="1">已支付，待发货</option>
                            <option value="2">已取消</option>
                            <option value="3">已送达，待签收</option>
                            <option value="4">已签收</option>
                            <option value="5" selected="selected">已发货</option>
                        </#if>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="edit" lay-submit="">
                    <i class="icon iconfont">&#xe747;</i>&nbsp;保存
                </button>
            </div>

        </form>
    </div>
</div>
<script type="text/javascript">

    layui.use(['form', 'layer'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            //监听提交
            form.on('submit(edit)',
                function(data) {
                    var editForm = data.field;
                    console.log(editForm);
                    //ajax异步提交数据
                    $.ajax({
                        url:'/admin/order/edit_state',
                        type:'post',
                        dataType:'json',
                        data:editForm,
                        success:function(data){
                            if(data.code == 0){
                                layer.alert(data.msg, {
                                        icon: 6
                                    },
                                    function() {
                                        // 获得frame索引
                                        var index = parent.layer.getFrameIndex(window.name);
                                        //关闭当前frame
                                        parent.layer.close(index);
                                        parent.parent.window.location.reload();
                                    });
                            }else{
                                layer.alert(data.msg, {icon: 5});
                            }
                        },
                        error:function(){
                            layer.alert('网络错误！修改订单状态失败！', {icon: 5});
                        }
                    });//end ajax

                    return false;

                });//end function(data)

        });//end function()




</script>
<script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>

</html>