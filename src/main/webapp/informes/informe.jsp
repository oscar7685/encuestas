<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Cátedra Unesco para la Lectura y la Escritura</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes">
        <meta name="description" content="Avalon Admin Theme">
        <meta name="author" content="The Red Team">

        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,700' rel='stylesheet' type='text/css'>
        <style type="text/css">
            .morris-hover{position:absolute;z-index:1000;}
            .morris-hover.morris-default-style{border-radius:10px;padding:6px;color:#666;background:rgba(255, 255, 255, 0.8);border:solid 2px rgba(230, 230, 230, 0.8);font-family:sans-serif;font-size:12px;text-align:center;}
            .morris-hover.morris-default-style .morris-hover-row-label{font-weight:bold;margin:0.25em 0;}
            .morris-hover.morris-default-style .morris-hover-point{white-space:nowrap;margin:0.1em 0;} 
        </style>
        <!--[if lt IE 10]>
            <script src="assets/js/media.match.min.js"></script>
            <script src="assets/js/placeholder.min.js"></script>
        <![endif]-->

        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">        <!-- Font Awesome -->
        <link href="assets/css/styles.css" type="text/css" rel="stylesheet">                                     <!-- Core CSS with all styles -->

        <!-- <link href="assets/plugins/jstree/dist/themes/avalon/style.min.css" type="text/css" rel="stylesheet">    <!-- jsTree -->
        <link href="assets/plugins/codeprettifier/prettify.css" type="text/css" rel="stylesheet">                <!-- Code Prettifier -->
        <!-- <link href="assets/plugins/iCheck/skins/minimal/blue.css" type="text/css" rel="stylesheet">              <!-- iCheck -->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
        <!--[if lt IE 9]>
            <link href="assets/css/ie8.css" type="text/css" rel="stylesheet">
            <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
            <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
            <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!-- The following CSS are included as plugins and can be removed if unused-->

    </head>

    <body class="infobar-offcanvas">

        <header id="topnav" class="navbar navbar-default navbar-fixed-top clearfix" role="banner">


            <a id="leftmenu-trigger" class="" data-toggle="tooltip" data-placement="right" title="Toggle Sidebar"></a>
            <a class="navbar-brand" href="index.html">Avalon</a>
            <a id="rightmenu-trigger" class="" data-toggle="tooltip" data-placement="left" title="Toggle Infobar"></a>


            <div class="yamm navbar-left navbar-collapse collapse in">
                <ul class="nav navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/"><strong>Inicio</strong></a></li>
                </ul>
            </div>


        </header>

        <div id="wrapper">
            <div id="layout-static">
                <div class="static-content-wrapper">
                    <div class="static-content">
                        <div class="page-content">
                            <div class="page-heading">            
                                <h1>Informe por Pregunta</h1>
                            </div>
                            <div class="container-fluid">
                                <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${pregunta.getTipo() != '5'}">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h2>${pregunta.pregunta}</h2>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div id="div${pregunta.idpregunta}">
                                                                <c:choose>
                                                                    <c:when test="${pregunta.getTipo() == '3' || pregunta.getTipo() == '4' || pregunta.getTipo() == '2'}">
                                                                        <c:forEach items="${RespuestasPreguntasAbiertas.get(iter.index)}" var="respuestaxx" varStatus="respuestaStatus">
                                                                            ${respuestaxx} ,
                                                                        </c:forEach>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div>
                                                                <c:choose>
                                                                    <c:when test="${pregunta.getTipo() == '1'}">
                                                                        <table class="table">
                                                                            <th>Respuesta/Orden</th>
                                                                                <c:set var="aux5" value="0"></c:set>
                                                                                <c:set var="auxheader" value="0"></c:set>
                                                                                <c:forEach items="${pregunta.respuestaList}" var="resf" varStatus="resStat">
                                                                                <th>${resStat.index + 1}</th>    
                                                                                    <c:set var="auxheader" value="${resStat.index}"></c:set>
                                                                                </c:forEach>
                                                                                <c:choose>
                                                                                    <c:when test="${pregunta.otro == 'true'}">
                                                                                    <th>${auxheader + 2}</th>        
                                                                                    </c:when>
                                                                                </c:choose>
                                                                                <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                                                                                <tr>
                                                                                    <td>${respuesta.respuesta}</td>

                                                                                    <c:set var="aux" value="0"></c:set>
                                                                                    <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                                                                                        <td> ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}</td>

                                                                                        <c:set var="aux" value="${otraStatus.index}"></c:set>
                                                                                    </c:forEach>    
                                                                                    <c:choose>
                                                                                        <c:when test="${pregunta.otro == 'true'}">
                                                                                            <td>  ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(aux+1)} </td>
                                                                                        </c:when>
                                                                                    </c:choose>   
                                                                                </tr>           
                                                                                <c:set var="aux5" value="${iter2.index}"></c:set>
                                                                            </c:forEach>
                                                                            <c:choose>
                                                                                <c:when test="${pregunta.otro == 'true'}">
                                                                                    <tr>
                                                                                        <td>${pregunta.labelOtro}</td>
                                                                                        <c:set var="aux7" value="0"></c:set>
                                                                                        <c:forEach items="${pregunta.respuestaList}" var="otra2" varStatus="otraStatus2">
                                                                                            <td>${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(aux5+1).get(otraStatus2.index)}</td>
                                                                                            <c:set var="aux7" value="${otraStatus2.index}"></c:set>
                                                                                        </c:forEach>
                                                                                        <td>${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(aux5+1).get(aux7+1)}</td>
                                                                                    </tr>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </table>
                                                                    </c:when>
                                                                    <c:when test="${pregunta.getTipo() == '7'}">
                                                                        <table class="table">
                                                                            <thead>
                                                                            <th>Respuesta/Orden</th>

                                                                            <c:forEach items="${pregunta.respuestaList}" var="resf2" varStatus="resStat2">
                                                                                <th>${resStat2.index + 1}</th>    
                                                                                </c:forEach>
                                                                                </thead>
                                                                            <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td>${respuesta.respuesta}</td>

                                                                                <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                                                                                    <td>${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}</td>
                                                                                </c:forEach>    
                                                                                </tr>
                                                                                </tbody>        
                                                                            </c:forEach>
                                                                        </table>   

                                                                            <%--  total Respuestas: ${totalrespuestas.get(iter.index)} <br/>--%>
                                                                        </c:when> 
                                                                    </c:choose>
                                                            </div>    
                                                        </div>
                                                    </div>
                                                </div>

                                            </div> 
                                        </c:when>
                                    </c:choose>


                                </c:forEach>



                            </div> <!-- .container-fluid -->
                        </div> <!-- #page-content -->
                    </div>
                    <footer role="contentinfo">
                        <div class="clearfix">
                            <ul class="list-unstyled list-inline pull-left">
                                <li><h6 style="margin: 0;"> &copy; 2014 Avalon</h6></li>
                            </ul>
                            <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
                        </div>
                    </footer>
                </div>
            </div>
        </div>


        <div class="infobar-wrapper">
            <div class="infobar">

                <div class="infobar-options">
                    <h2>Infobar</h2>
                </div>

                <div id="widgetarea">


                    <div class="widget" id="widget-sparkline">
                        <div class="widget-heading">
                            <a href="javascript:;" data-toggle="collapse" data-target="#sparklinestats"><h4>Sparkline Stats</h4></a>
                        </div>
                        <div class="widget-body collapse in" id="sparklinestats">
                            <ul class="sparklinestats">
                                <li>
                                    <div class="pull-left">
                                        <h5 class="title">Total Revenue</h5>
                                        <h3>$241,750 <span class="badge badge-success">+13.6%</span></h3>
                                    </div>
                                    <div class="pull-right">
                                        <div class="sparkline" id="infobar-revenuestats"></div>
                                    </div>
                                </li>
                                <li>
                                    <div class="pull-left">
                                        <h5 class="title">Products Sold</h5>
                                        <h3>11,562 <span class="badge badge-success">+19.2%</span></h3>
                                    </div>
                                    <div class="pull-right">
                                        <div class="sparkline" id="infobar-unitssold"></div>
                                    </div>
                                </li>
                                <li>
                                    <div class="pull-left">
                                        <h5 class="title">Total Orders</h5>
                                        <h3>1,249 <span class="badge badge-danger">-10.5%</span></h3>
                                    </div>
                                    <div class="pull-right">
                                        <div class="sparkline" id="infobar-orders"></div>
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>

                    <div class="widget" id="widget-weather">
                        <div class="widget-heading">
                            <a href="javascript:;" data-toggle="collapse" data-target="#weatherwidget"><h4>Weather</h4></a>
                        </div>
                        <div class="widget-body collapse in" id="weatherwidget">
                            <div class="weather-container">
                                <div class="weather-widget"></div>
                            </div>
                        </div>
                    </div>

                    <div class="widget">
                        <div class="widget-heading">
                            <a href="javascript:;" data-toggle="collapse" data-target="#recentactivity"><h4>Recent Activity</h4></a>
                        </div>
                        <div class="widget-body collapse in" id="recentactivity">
                            <ul class="recent-activities">
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_11.png" class="img-responsive img-circle">
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Jean Alanis</a> invited 3 unconfirmed members to <a href="#">Sed ut perspiciatis unde</a></span>
                                        <span class="time">Sep 16, 2014 at 10:06 AM</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="activityicon activity-success">
                                        <i class="fa fa-cloud"></i>
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Stacy Villani</a> and <a href="#" class="person">Leroy Greenlee</a> added new files to <a href="#">Dicta sunt explicabo</a></span>
                                        <span class="time">Sep 12, 2014 at 11:06 PM</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_07.png" class="img-responsive img-circle">
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Shannon Schmucker</a> is now following <a href="#" class="person">Anthony Ware</a></span>
                                        <span class="time">Sep 06, 2014 at 1:46 AM</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_01.png" class="img-responsive img-circle">
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Roxann Hollingworth</a> commented on <a href="#">Natus error sit voluptatem</a></span>
                                        <span class="time">Sep 02, 2014 at 7:50 PM</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_04.png" class="img-responsive img-circle">
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Mitchell Kosak</a> added <a href="#" class="person">Bruce Ory</a> to <a href="#">Accusantium doloremque laudantium</a></span>
                                        <span class="time">Sep 02, 2014 at 8:35 AM</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="activityicon activity-inverse">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#">4 new users</a> requested to join group</span>
                                        <span class="time">Aug 29, 2014 at 05:34 PM</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_09.png" class="img-responsive img-circle">
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Rodney Moody</a> created new thread <a href="#">Vero eos et accusamus</a></span>
                                        <span class="time">Aug 13, 2014 at 1:23 PM</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="activityicon activity-info">
                                        <i class="fa fa-comment-o"></i>
                                    </div>
                                    <div class="content">
                                        <span class="msg">Anonymous user commented on <a href="#">Totam rem aperiam</a></span>
                                        <span class="time">Aug 11, 2014 at 12:01 PM</span>

                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_05.png" class="img-responsive img-circle">
                                    </div>
                                    <div class="content">
                                        <span class="msg"><a href="#" class="person">Pricilla Panella</a> is now following <a href="#" class="person">Ricky Marengo</a></span>
                                        <span class="time">Jul 25, 2014 at 3:11 PM</span>
                                    </div>
                                </li>
                                <li class="seeall">
                                    <a href="#" class="pull-right">See all activities</a>
                                </li>
                            </ul>
                        </div>
                    </div>



                    <!-- <div class="widget">
                        <div class="widget-heading">
                            <a href="javascript:;" data-toggle="collapse" data-target="#storagespace"><h4>Storage Space</h4></a>
                        </div>
                        <div class="widget-body collapse in" id="storagespace">
                            <div class="" style="padding: 20px 0">
                                <div class="clearfix">
                                    <div class="progress-title pull-left">1.31 GB used</div>
                                    <div class="progress-percentage pull-right">87.3%</div>
                                </div>
                                <div class="progress progress-lg">
                                    <div class="progress-bar progress-bar-success" style="width: 50%"></div>
                                    <div class="progress-bar progress-bar-warning" style="width: 25%"></div>
                                    <div class="progress-bar progress-bar-danger" style="width: 12.3%"></div>
                                </div>
                            </div>
                        </div>
                    </div> -->

                    <!-- <div class="widget">
                        <div class="widget-heading">
                            <a href="javascript:;" data-toggle="collapse" data-target="#contactdetails"><h4>Contact Details</h4></a>
                        </div>
                        <div class="widget-body collapse in" id="contactdetails">
                            <div class="contactdetails">
                                <div class="avatar">
                                    <img src="assets/demo/avatar/avatar_11.png" class="img-responsive img-circle">
                                </div>
                                <span class="contact-name">Joseph Vasquez</span>
                                <span class="contact-status">Client Representative</span>
                                <ul class="details">
                                    
                                    <li><a href="#"><i class="fa fa-fw fa-envelope-o"></i>&nbsp;p.bateman@gmail.com</a></li>
                                    <li><i class="fa fa-fw fa-phone"></i>&nbsp;+1 234 567 890</li>
                                    <li><i class="fa fa-fw fa-map-marker"></i>&nbsp;Hollywood Hills, California</li>
                                    
                                </ul>
            
                        </div>
                    </div> -->


                    <!-- <div class="widget">
                        <div class="widget-heading">
                            <a href="javascript:;" data-toggle="collapse" data-target="#contact-list"><h4>Contact List</h4></a>
                        </div>
                        <div class="widget-body collapse in" id="contact-list">
                            <ul class="contact-list">
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_06.png" class="img-responsive img-circle" />
                                    </div>
                                    <div class="details">
                                        <div class="clearfix">
                                            <a href="#" class="contact-name pull-left">Jessie Pinkman</a>
                                            
                                                <div class="contact-profiles">
                                                    <a href="javascript:;" class="dropdown-toggle profile-list" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa pull-right fa-envelope-o" style="color: #cccccc;"></i>Email</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-skype" style="color: #12a5f4;"></i>Skype</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-twitter" style="color: #00aced;"></i>Twitter</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-linkedin" style="color: #007bb6;"></i>LinkedIn</a></li>
                                                    </ul>
                                                </div>
                                                
                                            
                                        </div>
                                        <span class="contact-details">Senior Developer</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_01.png" class="img-responsive img-circle" />
                                    </div>
                                    <div class="details">
                                        <div class="clearfix">
                                            <a href="#" class="contact-name pull-left">Emma Watson</a>
                                            
                                                <div class="contact-profiles">
                                                    <a href="javascript:;" class="dropdown-toggle profile-list" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa pull-right fa-envelope-o" style="color: #cccccc;"></i>Email</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-skype" style="color: #12a5f4;"></i>Skype</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-twitter" style="color: #00aced;"></i>Twitter</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-linkedin" style="color: #007bb6;"></i>LinkedIn</a></li>
                                                    </ul>
                                                </div>
                                                
                                            
                                        </div>
                                        <span class="contact-details">Graphic Designer</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_09.png" class="img-responsive img-circle" />
                                    </div>
                                    <div class="details">
                                        <div class="clearfix">
                                            <a href="#" class="contact-name pull-left">David Luke</a>
                                            
                                                <div class="contact-profiles">
                                                    <a href="javascript:;" class="dropdown-toggle profile-list" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa pull-right fa-envelope-o" style="color: #cccccc;"></i>Email</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-skype" style="color: #12a5f4;"></i>Skype</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-twitter" style="color: #00aced;"></i>Twitter</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-linkedin" style="color: #007bb6;"></i>LinkedIn</a></li>
                                                    </ul>
                                                </div>
                                                
                                            
                                        </div>
                                        <span class="contact-details">Client Representative</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_11.png" class="img-responsive img-circle" />
                                    </div>
                                    <div class="details">
                                        <div class="clearfix">
                                            <a href="#" class="contact-name pull-left">John Arren</a>
                                            
                                                <div class="contact-profiles">
                                                    <a href="javascript:;" class="dropdown-toggle profile-list" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa pull-right fa-envelope-o" style="color: #cccccc;"></i>Email</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-skype" style="color: #12a5f4;"></i>Skype</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-twitter" style="color: #00aced;"></i>Twitter</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-linkedin" style="color: #007bb6;"></i>LinkedIn</a></li>
                                                    </ul>
                                                </div>
                                                
                                            
                                        </div>
                                        <span class="contact-details">Project Manager</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_05.png" class="img-responsive img-circle" />
                                    </div>
                                    <div class="details">
                                        <div class="clearfix">
                                            <a href="#" class="contact-name pull-left">Ben Stiller</a>
                                            
                                                <div class="contact-profiles">
                                                    <a href="javascript:;" class="dropdown-toggle profile-list" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa pull-right fa-envelope-o" style="color: #cccccc;"></i>Email</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-skype" style="color: #12a5f4;"></i>Skype</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-twitter" style="color: #00aced;"></i>Twitter</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-linkedin" style="color: #007bb6;"></i>LinkedIn</a></li>
                                                    </ul>
                                                </div>
                                                
                                            
                                        </div>
                                        <span class="contact-details">Senior Designer</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="avatar">
                                        <img src="assets/demo/avatar/avatar_08.png" class="img-responsive img-circle" />
                                    </div>
                                    <div class="details">
                                        <div class="clearfix">
                                            <a href="#" class="contact-name pull-left">Jeofry Thompson</a>
                                            
                                                <div class="contact-profiles">
                                                    <a href="javascript:;" class="dropdown-toggle profile-list" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </a>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa pull-right fa-envelope-o" style="color: #cccccc;"></i>Email</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-skype" style="color: #12a5f4;"></i>Skype</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-twitter" style="color: #00aced;"></i>Twitter</a></li>
                                                        <li><a href="#"><i class="fa pull-right fa-linkedin" style="color: #007bb6;"></i>LinkedIn</a></li>
                                                    </ul>
                                                </div>
                                                
                                            
                                        </div>
                                        <span class="contact-details">Developer</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div> -->




                </div>
            </div>
        </div>



        <!-- Switcher -->
        <div class="demo-options">
            <div class="demo-options-icon"><i class="fa fa-spin fa-fw fa-smile-o"></i></div>
            <div class="demo-heading">Demo Settings</div>

            <div class="demo-body">
                <div class="tabular">
                    <div class="tabular-row">
                        <div class="tabular-cell">Fixed Header</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="success" data-off-color="default" name="demo-fixedheader" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row">
                        <div class="tabular-cell">Boxed Layout</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" data-size="mini" data-on-color="success" data-off-color="default" name="demo-boxedlayout" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row">
                        <div class="tabular-cell">Collapse Leftbar</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" data-size="mini" data-on-color="success" data-off-color="default" name="demo-collapseleftbar" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row">
                        <div class="tabular-cell">Collapse Rightbar</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="success" data-off-color="default" name="demo-collapserightbar" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row hide" id="demo-horizicon">
                        <div class="tabular-cell">Horizontal Icons</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="primary" data-off-color="warning" data-on-text="S" data-off-text="L" name="demo-horizicons" ></div>
                    </div>
                </div>

            </div>

            <div class="demo-body">
                <div class="option-title">Header Colors</div>
                <ul id="demo-header-color" class="demo-color-list">
                    <li><span class="demo-white"></span></li>
                    <li><span class="demo-black"></span></li>
                    <li><span class="demo-midnightblue"></span></li>
                    <li><span class="demo-primary"></span></li>
                    <li><span class="demo-info"></span></li>
                    <li><span class="demo-alizarin"></span></li>
                    <li><span class="demo-grape"></span></li>
                    <li><span class="demo-violet"></span></li>                
                    <li><span class="demo-indigo"></span></li> 
                </ul>
            </div>

            <div class="demo-body">
                <div class="option-title">Sidebar Colors</div>
                <ul id="demo-sidebar-color" class="demo-color-list">
                    <li><span class="demo-white"></span></li>
                    <li><span class="demo-black"></span></li>
                    <li><span class="demo-midnightblue"></span></li>
                    <li><span class="demo-primary"></span></li>
                    <li><span class="demo-info"></span></li>
                    <li><span class="demo-alizarin"></span></li>
                    <li><span class="demo-grape"></span></li>
                    <li><span class="demo-violet"></span></li>                
                    <li><span class="demo-indigo"></span></li> 
                </ul>
            </div>

            <div class="demo-body hide" id="demo-boxes">
                <div class="option-title">Boxed Layout Options</div>
                <ul id="demo-boxed-bg" class="demo-color-list">
                    <li><span class="pattern-brickwall"></span></li>
                    <li><span class="pattern-dark-stripes"></span></li>
                    <li><span class="pattern-rockywall"></span></li>
                    <li><span class="pattern-subtle-carbon"></span></li>
                    <li><span class="pattern-tweed"></span></li>
                    <li><span class="pattern-vertical-cloth"></span></li>
                    <li><span class="pattern-grey_wash_wall"></span></li>
                    <li><span class="pattern-pw_maze_black"></span></li>
                    <li><span class="patther-wild_oliva"></span></li>
                    <li><span class="pattern-stressed_linen"></span></li>
                    <li><span class="pattern-sos"></span></li>
                </ul>
            </div>

        </div>
        <!-- /Switcher -->
        <!-- Load site level scripts -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script> 

        <!--<script src="assets/js/jquery-1.10.2.min.js"></script> 							<!-- Load jQuery -->
        <!--<script src="assets/js/jqueryui-1.9.2.min.js"></script> 							<!-- Load jQueryUI -->
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script> 				<!-- Load Bootstrap -->
        <!-- End loading page level scripts-->
       <!-- <script src="<%=request.getContextPath()%>/assets/plugins/sparklines/jquery.sparklines.min.js"></script>  	<!-- Sparkline -->
        <script src="<%=request.getContextPath()%>/assets/js/application2.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/raphael.min.js"></script> <!-- Load Raphael as Dependency -->
        <script src="<%=request.getContextPath()%>/assets/js/morris.min.js"></script>  <!-- Load Morris.js -->


        <script type="text/javascript">
            var datosTF1vsTF2, datos9, datos1, datos6;
            $(function() {
            <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
                <c:choose>
                    <c:when test="${pregunta.getTipo() == '0'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datosTF1vsTF2 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datosTF1vsTF2,
                            hoverCallback: function(index, options, content) {
                                return(content);
                            },
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            //padding: 100,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>
                    <c:when test="${pregunta.getTipo() == '9'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datos9 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datos9,
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            //padding: 100,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>


                    <c:when test="${pregunta.getTipo() == '1'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datos1 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datos1,
                            xkey: 'y',
                            ykeys: ['a'],
                            //padding: 100,
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>
                        
                        <c:when test="${pregunta.getTipo() == '6'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datos6 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datos6,
                            xkey: 'y',
                            ykeys: ['a'],
                            //padding: 100,
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>

                        

                </c:choose>
            </c:forEach>
            });
        </script>
    </body>
</html>