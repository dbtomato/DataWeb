<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
     <link href="<%=request.getContextPath()%>/scripts/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/scripts/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/echarts.js"></script>
</head>
<body>

<!-- 导航条  -->
<nav class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">数据展示</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">流式计算数据</a></li>
        <li><a href="#">静态数据</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">登出</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



<!-- 主内容  -->
</br></br>
<div class="container">
<div class="row">
  <div  id="OnlineSum" class="col-md-6" style="height:300px;"></div>
  <div  id="RoleSum" class="col-md-6" style="height:300px;"></div>
</div> 
<script type="text/javascript">
var myChart = echarts.init(document.getElementById("OnlineSum"));
var myChart1 = echarts.init(document.getElementById("RoleSum"));
var option = null;
var option1=null;
var xl=[];
var yl=[];
 function del(){
    $.ajax( {
        type: "POST",
        url:'<%=request.getContextPath()%>/SumOnline.do',
        dataType: "json",
        //dataType:"text",
        //dataType:"script",
        success : function(data) {

        var d=new Date();
        var dtime=d.getHours()+':'+d.getMinutes()+':'+d.getSeconds();
  
        xl.push(dtime);
        yl.push(Math.floor(Math.random()*10+1));
        
        if(xl.length>8){
        xl.shift();
        yl.shift();
        }
               myChart.setOption(
                {
                    xAxis: {
                        data:xl
                        
                           },
                    series: [{
                        data: yl
                            }]
                });
       
        },
        error :function(){
            alert("操作失败");
        }
    });
    }
    
    
    
    
    option = {
    title : {
        text: '实时在线人数',
        subtext: '在线人数',
        x:'center'
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data:[]
    },
    yAxis: {
        boundaryGap: [0, '50%'],
        type: 'value'
    },
    series: [
        {
            name:'成交',
            type:'line',
            smooth:true,
            symbol: 'none',
            stack: 'a',
            areaStyle: {
                normal: {}
            },
            data: []
        }
    ]
};



 option1 = {
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
            name: '创建人数',
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
myChart1.setOption(option1);

    setInterval(function () {
        del();
    }, 5000);

</script>
 </div>
</body>
</html>

