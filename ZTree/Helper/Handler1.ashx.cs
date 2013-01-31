using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;


namespace ZTree.Helper
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
  
public class Handler1 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string method = context.Request["action"];
        if (method == "GetProvince")
        {
     //这种返回的是简单的JSON格式，要匹配这种格式要在页面上
          //设置成简单的JSON格式
          //var setting = {
           // data: {
          //      simpleData: {
          //          enable: true
          //      }
          //  }
        //}
     context.Response.Write("[{id:1, pId:0, name:\"中国\", open:true},{id:101, pId:1, name:\"北京\"},{id:102, pId:1, name:\"上海\"},{id:2, pId:0, name:\"美国\", open:false},{id:201, pId:2, name:\"洛杉矶\"},{id:206, pId:2, name:\"纽约\"}]");
     //这种是标准的JSON格式
      //var zNodes =[
      //      { name:"父节点1 - 展开", open:true,
      //          children: [
      //              { name:"父节点11 - 折叠",
      //                  children: [
      //                      { name:"叶子节点111"},
      //                      { name:"叶子节点112"},
      //                      { name:"叶子节点113"},
      //                      { name:"叶子节点114"}
      //                  ]},
      //              { name:"父节点12 - 折叠",
      //                  children: [
      //                      { name:"叶子节点121"},
      //                      { name:"叶子节点122"},
      //                      { name:"叶子节点123"},
      //                      { name:"叶子节点124"}
      //                  ]},
      //              { name:"父节点13 - 没有子节点", isParent:true}
      //          ]},
      //      { name:"父节点2 - 折叠",
      //          children: [
      //              { name:"父节点21 - 展开", open:true,
      //                  children: [
      //                      { name:"叶子节点211"},
      //                      { name:"叶子节点212"},
      //                      { name:"叶子节点213"},
      //                      { name:"叶子节点214"}
      //                  ]},
      //              { name:"父节点22 - 折叠",
      //                  children: [
      //                      { name:"叶子节点221"},
      //                      { name:"叶子节点222"},
      //                      { name:"叶子节点223"},
      //                      { name:"叶子节点224"}
      //                  ]},
      //              { name:"父节点23 - 折叠",
      //                  children: [
      //                      { name:"叶子节点231"},
      //                      { name:"叶子节点232"},
      //                      { name:"叶子节点233"},
      //                      { name:"叶子节点234"}
      //                  ]}
      //          ]},
      //      { name:"父节点3 - 没有子节点", isParent:true}
      //  ];
        }       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
}