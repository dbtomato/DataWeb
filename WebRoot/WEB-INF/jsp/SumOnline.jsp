<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
    <link href="<%=request.getContextPath()%>/scripts/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/scripts/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/scripts/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/js/echarts.js"></script>
    <script src="<%=request.getContextPath()%>/scripts/js/bootstrap-datetimepicker.js"></script>
    
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
        <li class="active"><a href="#">在线数据</a></li>
        <li><a href="#">留存数据</a></li>
        <li><a href="#">所有用户等级数据</a></li>
        <li><a href="#">新增用户各等级角色数据</a></li>
        <li><a href="#">货币</a></li>
        <li><a href="#">经验值产出</a></li>
      </ul>
      
      
<form class="navbar-form navbar-left" role="search">
       <div class="form-group">
                <div class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="选择查询时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
        <input type="hidden" id="dtp_input2" value="" /><br/>
            </div>
        <button type="submit" class="btn btn-default">提交</button>
      </form>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">登出</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<script type="text/javascript">
$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0
    });
</script>

<!-- 主内容  -->
</br></br>
<div class="container">

<div class="row">
  <div  id="OnlineSum" class="col-md-6" style="height:300px;">
  </div>
  <div  id="RoleSum" class="col-md-6" style="height:300px;"></div>
  <div  id="LevelDis" class="col-md-6" style="height:300px;"></div>
  <div  id="LevelMixDis" class="col-md-6" style="height:300px;"></div>
</div> 
<script type="text/javascript">
var myChart = echarts.init(document.getElementById("OnlineSum"));
var myChart1 = echarts.init(document.getElementById("RoleSum"));
var myChart2 = echarts.init(document.getElementById("LevelDis"));
var myChart3 = echarts.init(document.getElementById("LevelMixDis"));
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
    
    
    
 //折线图option   
     brokenLine = {
    title : {
        text: '实时在线人数',
        subtext: '在线人数',
        x:'center'
    },
     toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
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


//圆饼图option
 pie = {
    title : {
        text: '创建角色比例',
        subtext: '角色比例',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
     toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            saveAsImage : {show: true}
        }
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




//柱状图option
histogram= {
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
     toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'直接访问',
            type:'bar',
            barWidth: '60%',
            data:[10, 52, 200, 334, 390, 330, 220]
        }
    ]
};


//mixHistogram

mixHistogram = {
    title : {
        text: '某地区蒸发量和降水量',
        subtext: '纯属虚构'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['蒸发量','降水量']
    },
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'蒸发量',
            type:'bar',
            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        },
        {
            name:'降水量',
            type:'bar',
            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
            markPoint : {
                data : [
                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        }
    ]
};





myChart.setOption(brokenLine);
myChart1.setOption(pie);
myChart2.setOption(histogram);
myChart3.setOption(mixHistogram);

    setInterval(function () {
        del();
    }, 5000);

</script>
 </div>
</body>
</html>

