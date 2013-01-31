<%@ Page Title="主页" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ZTree._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<link href="Styles/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var setting = {
          //设置成简单的JSON格式
          data: {
				simpleData: {
					enable: true
				}
			},
        async: {
            //异步加载
            enable: true,
            url: getUrl
        },
        callback: {
            beforeExpand: beforeExpand,
            onAsyncSuccess: onAsyncSuccess,
            onAsyncError: onAsyncError
        }
    };

    function createTree() {    
        $.ajax({
            url: '/Helper/Handler1.ashx?action=GetProvince', //url  action是方法的名称
            data: { id: "0" },
            type: 'POST',
            dataType: "text", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
            ContentType: "application/json; charset=utf-8",
            success: function (data) {
                alert(data);
                $.fn.zTree.init($("#treeDemo"), setting, eval('(' + data + ')'));
            },
            error: function (msg) {
                alert("error");
                alert("数据加载失败！");
            }
        });
    }

    function getUrl(treeId, treeNode) {       
        var param = "id=" + treeNode.id;
        return "Handler.ashx?action=GetProvince&" + param;
    }
    function beforeExpand(treeId, treeNode) {
        if (!treeNode.isAjaxing) {
            return true;
        } else {
            alert("zTree 正在下载数据中，请稍后展开节点。。。");
            return false;
        }
    }

    function onAsyncSuccess(event, treeId, treeNode, msg) { }
    function onAsyncError() {
        alert("数据加载失败");
    }

    $(document).ready(function () {
        createTree();
    });
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        欢迎使用 ASP.NET!
    </h2>
    <p>
        若要了解关于 ASP.NET 的详细信息，请访问 <a href="http://www.asp.net/cn" title="ASP.NET 网站">www.asp.net/cn</a>。
    </p>
    <p>
        您还可以找到 <a href="http://go.microsoft.com/fwlink/?LinkID=152368"
            title="MSDN ASP.NET 文档">MSDN 上有关 ASP.NET 的文档</a>。
    </p>
    <div>
        <ul id="treeDemo" class="ztree" style="width:260px; overflow:auto;"></ul>
    </div>
</asp:Content>
