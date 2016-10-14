<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
    <script src="<%=request.getContextPath()%>/scripts/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/echarts.js"></script>
</head>
<body>
 <div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
var dom = document.getElementById("main");
var myChart = echarts.init(document.getElementById('main'));
var option = null;
 function del(){
    $.ajax( {
        type: "POST",
        url:'<%=request.getContextPath()%>/SumOnline.do',
        dataType: "json",
        //dataType:"text",
        //dataType:"script",
        success : function(data) {
       
        },
        error :function(){
            alert("操作失败");
        }
    });
    }
    
    
    
    
    option = {
    title : {
        text: '创建角色比例',
        subtext: '角色比例',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: ['屠苏','晴雪','尹千觞','紫胤真人']
    },
    series : [
        {
            name: '访问来源',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:335, name:'屠苏'},
                {value:310, name:'晴雪'},
                {value:234, name:'尹千觞'},
                {value:135, name:'紫胤真人'}
     
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};




myChart.setOption(option);



    
</script>


<input type="button" onclick="del()" value="删除"/>








    
</body>
</html>

