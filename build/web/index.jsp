<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <link href="mainCss/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <link href="mainCss/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="mainCss/css/nivo-lightbox.css" rel="stylesheet" />
    <link href="mainCss/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
    <link href="mainCss/css/animate.css" rel="stylesheet" />
    <!-- Squad theme CSS -->
    <link href="mainCss/css/style.css" rel="stylesheet">
    <link href="color/default.css" rel="stylesheet">  
    <title>One Stop Portal</title>
    <style type="text/css">
        html, body { margin: 0; padding:0;}
        #signin-button {
            padding: 5px;
        }
        #oauth2-results pre { margin: 0; padding:0; width: 600px;}
        .hide { display: none;}
        .show { display: block;}
    </style>

    <script src="https://apis.google.com/js/client:platform.js" type="text/javascript"></script>
    <script type="text/javascript">
        var loginFinished = function (authResult)
        {
            if (authResult)
            {
                console.log(authResult);
            }

            gapi.client.load('oauth2', 'v2', function ()
            {
                gapi.client.oauth2.userinfo.get()
                        .execute(function (resp)
                        {
                            // Shows user email
                            window.location = "/OneStopPortal/CreateSessionServlet?name=" + resp.email;
                            console.log(resp.email);
                        });
            });

        };

        var options = {
            'callback': loginFinished,
            'approvalprompt': 'force',
            'clientid': '970036490678-c0i2m4bm28haugtico98km6mn18dlv9v.apps.googleusercontent.com',
            'scope': 'https://www.googleapis.com/auth/userinfo.email',
            'cookiepolicy': 'single_host_origin'
        };

        var renderBtn = function ()
        {
            gapi.signin.render('renderMe', options);
        }
    </script>

</head>
<body onload ="renderBtn()" data-spy="scroll">
    <section id="intro" class="intro" style="background-image: url('mainCss/images/img-bg.jpg');">
        <div class="slogan">
            <h1>College Portal</h1>
            <div id="renderMe"></div>  
        </div>
    </section>

    <section id="about" class="home-section text-center bg-gray">
        <div class="heading-about marginbot-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">

                        <div class="section-heading">
                            <h2>About us</h2>
                            <p>M.tech students</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container">

            <div class="row">
                <div class="col-xs-6 col-sm-3 col-md-2">

                    <div class="team boxed-grey">
                        <div class="inner">
                            <h5>Anjli Chikara</h5>
                            <p class="subtitle">Design Head, </p>
                            <div class="avatar"><img src="img/team/1.jpg" alt="" class="img-responsive" /></div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-6 col-sm-3 col-md-2">

                    <div class="team boxed-grey">
                        <div class="inner">
                            <h5>Kireet Pant</h5>
                            <p class="subtitle">Bootstrap, Struts</p>
                            <div class="avatar"><img src="img/team/2.jpg" alt="" class="img-responsive" /></div>
                        </div>

                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2">

                    <div class="team boxed-grey">
                        <div class="inner">
                            <h5>Vibhor</h5>
                            <p class="subtitle">Struts, Databases</p>
                            <div class="avatar"><img src="img/team/3.jpg" alt="" class="img-responsive" /></div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-6 col-sm-3 col-md-2">

                    <div class="team boxed-grey">
                        <div class="inner">
                            <h5>Anurag Rana</h5>
                            <p class="subtitle">Coder</p>
                            <div class="avatar"><img src="img/team/4.jpg" alt="" class="img-responsive" /></div>
                        </div>
                    </div>

                </div>
                <div class="col-xs-6 col-sm-3 col-md-2">

                    <div class="team boxed-grey">
                        <div class="inner">
                            <h5>Akansha Mishra</h5>
                            <p class="subtitle">Coder </p>
                            <div class="avatar"><img src="img/team/4.jpg" alt="" class="img-responsive" /></div>
                        </div>
                    </div>

                </div>
            </div>		
        </div>
    </section>
    <!-- /Section: about -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12">

                    <p>Copyright &copy; 2014 Ninestars - by <a href="http://bootstraptaste.com">Bootstraptaste</a></p>
                </div>
            </div>	
        </div>
    </footer>

    <!-- Core JavaScript Files -->
    <script src="mainCss/js/jquery.min.js"></script>
    <script src="mainCss/js/bootstrap.min.js"></script>
    <script src="mainCss/js/jquery.easing.min.js"></script>	
    <script src="mainCss/js/classie.js"></script>
    <script src="mainCss/js/gnmenu.js"></script>
    <script src="mainCss/js/jquery.scrollTo.js"></script>
    <script src="mainCss/js/nivo-lightbox.min.js"></script>
    <script src="mainCss/js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="mainCss/js/custom.js"></script>

</body>
</html>
