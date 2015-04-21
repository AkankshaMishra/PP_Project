<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <title>Complaint Portal Admin</title>

        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        
        <script type="text/javascript">
           $(function () {
               $('#closeButton').click(function () {
                   $('#showComplaintsdetail').hide();
                   return false;
               });
           });
       </script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <script type="text/javascript">
            function changeStatus(id)
            {
                var x = document.getElementById(id).selectedIndex;
                var status=document.getElementsByTagName("option")[x].value;
                $.ajax(
                        {
                            type: "get",
                            url: 'ComplaintDetails?complaintID='+ id + '&status=' +status,
                            success: function (result)
                            {
                                alert(result);
                            }
                        });
                return "#";
            }
        </script>
        <script type="text/javascript">
            function getMore(id)
            {
                var x = document.getElementById(id).selectedIndex;
                var status=document.getElementsByTagName("option")[x].value;
                $.ajax(
                        {
                            type: "get",
                            url: 'GetFullInFo?complaintID='+ id ,
                            success: function (result)
                            {
                                var ele=document.getElementById("temporary");
                                ele.innerHTML="";
                                var ele1=document.getElementById("showComplaintsdetail")
                                ele1.style.display="block";
                                ele.innerHTML+=''+result;
                            }
                        });
                return "#";
            }
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
                <a href="index.html" class="logo"><b><bean:message key="welcome.title.complaintadmin"/></b></a>
                <!--logo end-->

                <ul class="nav navbar-right top-nav">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Ashutosh Bramha <b class="caret"></b></a>
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
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">

                    <div class="row" style="margin-top: -2%">
                        <div class="col-lg-11 main-chart" style="margin-left: -5%">
                            <h3>Complaints for IT Department</h3>
                            <div id="showComplaintsdetail">
                                <div id="permanent">
                                    <input type="button" name="close" id="closeButton" value="X" style="float:right"/>
                                </div>    
                                <div id="temporary">
                                   
                                </div>
                                
                            </div>
                            <div id="showComplaints" style="background-color: white;height: 70%;padding:20px;overflow: auto">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Complaint No</th>
                                            <th>UserName</th>
                                            <th>Complaint Type</th>
                                            <th>Current Status</th>
                                            <th>Get More Info</th>
                                            <th>Change Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ids}" var="p" varStatus="counter">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>John</td>
                                            <td>Carter</td>
                                            <td>In process</td>
                                            <th><a href="#" onClick="javascript:document.location.href = getMore(${p.id});"><b>Click For More</b></a></th>
                                            <th><select id="${p.id}">
                                                    <option value="InProgress">In Progress</option>
                                                    <option value="Done">Done</option>
                                                    <option value="WillTakeTime">Will Take Time</option>
                                                </select> <input type="button" name="close" value="Update" onClick="javascript:document.location.href = changeStatus(${p.id});"/> </th>
                                        </tr>
                                        </c:forEach>
                                        
                                    </tbody>
                                </table>


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
