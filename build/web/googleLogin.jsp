<html>
<head>
  <title>Google+ Sign-in button demo: rendering with JavaScript</title>
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
var loginFinished = function(authResult)
{
  if (authResult)
  {
    console.log(authResult);
  }

  gapi.client.load('oauth2', 'v2', function()
  {
    gapi.client.oauth2.userinfo.get()
      .execute(function(resp)
      {
        // Shows user email
        alert(resp.name);
        console.log(resp.email);
      });
  });

};

var options = {
  'callback': loginFinished,
  'approvalprompt': 'force',
  'clientid': '970036490678-c0i2m4bm28haugtico98km6mn18dlv9v.apps.googleusercontent.com',
  'scope': 'https://www.googleapis.com/auth/userinfo.profile',
  'cookiepolicy': 'single_host_origin'
};

var renderBtn = function()
{
  gapi.signin.render('renderMe', options);
}
  </script>

</head>
<body onload ="renderBtn()">
   <div id="renderMe"></div>  
</body>
</html>