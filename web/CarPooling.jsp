<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="IIITD, carpooling,one stop portal, IIIT-DELHI">

        <title>Car Pooling</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">

                <!--logo start-->
                <a href="index.html" class="logo"><b><bean:message key="welcome.title.carpooling"/></b></a>
                <!--logo end-->

                <ul class="nav navbar-right top-nav">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Kireet <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->      

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-5 main-chart">
                            <div id="mainForm" style="margin-left: -40%;margin-top: -4%" >
                                <h2 style="text-align: center">Share A New Ride</h2>
                                <html:form action="registercar.do" focus="userId" styleClass="form-horizontal">
                                    <div class="form-group">
                                        <label for="InputName" class="col-sm-2 control-label" ><bean:message key="register.username"/></label>
                                        <div class="col-sm-5"><html:text property="userId" styleClass="form-control"/></div>
                                        <b style="color: red"><html:errors property="userId"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="UserEmail" class="col-sm-2 control-label" ><bean:message key="register.email"/></label>
                                        <div class="col-sm-5"><html:text property="email" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="email"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="from" class="col-sm-2 control-label" ><bean:message key="register.from"/></label>
                                        <div class="col-sm-5"><html:text property="from" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="from"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="destination" class="col-sm-2 control-label" ><bean:message key="register.destination"/></label>
                                        <div class="col-sm-5"><html:text property="destination" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="destination"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="seatsAvailable" class="col-sm-2 control-label" ><bean:message key="register.seats"/></label>
                                        <div class="col-sm-5"><html:text property="seatsAvailable" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="seatsAvailable"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="charge" class="col-sm-2 control-label" ><bean:message key="register.charge"/></label>
                                        <div class="col-sm-5"><html:text property="charge" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="charge"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="contact" class="col-sm-2 control-label" ><bean:message key="register.contact"/></label>
                                        <div class="col-sm-5"><html:text property="contact" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="contact"/></b>
                                    </div>

                                    <div class="form-group" style="margin-left: 130px;">
                                        <div class="col-sm-5">
                                            <html:submit styleClass="form-control">
                                                <bean:message key="register.submit"/>
                                            </html:submit>
                                        </div>
                                    </div>
                                </html:form>
                            </div>


                        </div>


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  
                        <div class="col-lg-7 ds" style="margin-top: 1.6%;">
                            <!--COMPLETED ACTIONS DONUTS CHART-->
                            <h3>Available Rides (click For Details)</h3>

                            <!-- First Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Second Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>3 Hours Ago</muted><br/>
                                    <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Third Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>7 Hours Ago</muted><br/>
                                    <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fourth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>11 Hours Ago</muted><br/>
                                    <a href="#">Mark Twain</a> commented your post.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fifth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>18 Hours Ago</muted><br/>
                                    <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
                <footer class="site-footer" style="width: 119%;margin-left: -19%;line-height: 2.56">
                    <div class="text-center">
                        2015 - IIIT-DELHI
                        <a href="index.html#" class="go-top">
                            <i class="fa fa-angle-up"></i>
                        </a>
                    </div>
                </footer>
                <!-- js placed at the end of the document so the pages load faster -->

                <script src="assets/js/bootstrap.min.js"></script>
                <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
                <script src="assets/js/jquery.scrollTo.min.js"></script>
                <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
                <script src="assets/js/jquery.sparkline.js"></script>


                <!--common script for all pages-->
                <script src="assets/js/common-scripts.js"></script>


                </body>
                </html>
