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
        <meta name="keyword" content="IIITD, Complaint portal, IIIT-DELHI">

        <title>IIIT-D complaint portal</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>
        <script type="text/javascript">
           $(function () {
               $('#closeButton').click(function () {
                   $('#showComplaintsdetail').hide();
                   return false;
               });
           });
       </script>
        <script type="text/javascript">
               $(function () {
                   $('#plusOne').click(function () {
                       
                       $.ajax(
                           {
                               type: "get",
                               url: 'PlusOneServlet',
                               success: function (result)
                               {
                                   var ele = document.getElementById("plusData");
                                   ele.innerHTML = "";
                                   ele.innerHTML += "<b>Total Count:" + result + "</b>";
                                   
                               }
                           });
                       
                   });
                   });
           
       </script>
    <script type="text/javascript">
    function getPlusCount(id)
    {
        
        
        $.ajax(
                           {
                               type: "get",
                               url: 'PlusOneServlet',
                               success: function (result)
                               {
                                   var ele = document.getElementById(id);
                                   ele.innerHTML = "";
                                   ele.innerHTML += "<b>Total Count:" + id +" <br/>  "+'${userName}'+ "</b>";
                                   
                               }
                           });
        return "#";
    }
       </script>   
       
       
       <script type="text/javascript">
    function getMore(id)
    {
        var ele=document.getElementById("temporary");
        ele.innerHTML="";
        var ele1=document.getElementById("showComplaintsdetail")
        ele1.style.display="block";
        ele.innerHTML+=''+id;
        return "#";
    }
       </script>

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
                <a href="index.jsp" class="logo"><b><bean:message key="welcome.title.complaint"/></b></a>
                
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                      
                        <!-- inbox dropdown start-->
                        <li id="header_inbox_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-theme">5</span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have 5 new messages</p>
                                </li>
                                
                                
                                <li>
                                    <a href="index.html#">
                                        <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
                                        <span class="subject">
                                            <span class="from">Dan Rogers</span>
                                            <span class="time">2 hrs.</span>
                                        </span>
                                        <span class="message">
                                            Love your new Dashboard.
                                        </span>
                                    </a>
                                </li>
                                
                                <li>
                                    <a href="index.html#">See all messages</a>
                                </li>
                            </ul>
                        </li>
                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>
                <ul class="nav navbar-right top-nav">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${userName} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="LogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
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
                                <h2 style="text-align: center">Register A New Complaint</h2>
                                <html:form action="register.do" focus="userId" styleClass="form-horizontal">
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
                                        <label for="complaintType" class="col-sm-2 control-label" ><bean:message key="register.complainttype"/></label>
                                        <div class="col-sm-5"><html:select property="complaintType" styleClass="form-control" >
                                                <b style="color: red"><html:errors property="complaintType"/></b>
                                                <html:option value="internet">Internet</html:option>
                                                <html:option value="safai">Safai</html:option>
                                                <html:option value="mess">Mess</html:option>
                                                <html:option value="security">Security</html:option>
                                            </html:select></div>
                                        
                                                                            </div>
                                    <div class="form-group">
                                        <label for="UserEmail" class="col-sm-2 control-label" ><bean:message key="register.since"/></label>
                                        <div class="col-sm-5"><html:text styleId="datepicker" property="since" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="since"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="ComplaintText" class="col-sm-2 control-label" ><bean:message key="register.subject"/></label>
                                        <div class="col-sm-5"><html:text property="subject" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="subject"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label for="ComplaintText" class="col-sm-2 control-label" ><bean:message key="register.complaint"/></label>
                                        <div class="col-sm-6"><html:textarea property="message" styleClass="form-control" /></div>
                                        <b style="color: red"><html:errors property="message"/></b>
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

                        <div id="showComplaintsdetail">
                                <div id="permanent">
                                    <input type="button" name="close" id="closeButton" value="X" style="float:right"/>
                                </div>    
                                <div id="temporary">
                                   
                                </div>
                                
                            </div>
                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  
                        <div class="col-lg-3 ds" style="margin-top: 2%;height: 500px;overflow: auto">
                            <!--COMPLETED ACTIONS DONUTS CHART-->
                            <h3>ALL COMPLAINTS</h3>

                            <!-- First Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">James Brown</a> subscribed to your newsletter.
                                    <a href="#" onClick="javascript:document.location.href=getPlusCount(1234);"><b>+1</b></a>  <a href="#" onClick="javascript:document.location.href=getMore(1234);"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;more</b></a>
                                    <p id="1234"></p>
                                    </p>
                                </div>
                            </div>
                            <!-- Second Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">James Brown</a> subscribed to your newsletter.
                                    <a href="#" onClick="javascript:document.location.href=getPlusCount(5678);"><b>+1</b></a>  <a href="#" onClick="javascript:document.location.href=getMore(5678);"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;more</b></a>
                                    <p id="5678"></p>
                                    </p>
                                </div>
                            </div>
                            
                            
                        </div>
                        <div class="col-lg-3 ds" style="margin-left: 3%;margin-top: 2%;height: 500px;overflow: auto">
                            <!--COMPLETED ACTIONS DONUTS CHART-->
                            <h3>YOUR COMPLAINTS</h3>

                            <!-- First Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">James Brown</a> subscribed to your newsletter.
                                      <a href="#" onClick="javascript:document.location.href=getMore(1234);"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;more</b></a>
                                    <p id="plusData"></p>
                                    </p>
                                </div>
                            </div>                            
                            
                        </div>
                    </div>
                </section>
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
