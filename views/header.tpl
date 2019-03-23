<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="images/favicon.ico?v=2" type="image/x-icon" />
    <meta charset="utf-8" />
    <title>tvstreamrecord {{version}}</title>

    <link rel="manifest" href="manifest.webmanifest" />
    <script async src="https://cdn.jsdelivr.net/npm/pwacompat@2.0.6/pwacompat.min.js" integrity="sha384-GOaSLecPIMCJksN83HLuYf9FToOiQ2Df0+0ntv7ey8zjUHESXhthwvq9hXAZTifA" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="default" />
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" type="text/css" href="css/{{style}}" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui-timepicker-addon.min.css" />
    <link rel="stylesheet" type="text/css" href="css/dataTables.jqueryui.min.css"/>
    <!--<link rel="stylesheet" type="text/css" href="css/select.jqueryui.min.css"/>-->
    <link rel="stylesheet" type="text/css" href="css/jqueryFileTree.css" />
    <link rel="stylesheet" type="text/css" href="css/slickswitch.css" />
    <link rel="stylesheet" type="text/css" href="css/tvstreamrecord.basic.css" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-timepicker-addon.min.js"></script>
    <script type="text/javascript" src="js/jquery.slickswitch.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.jqueryui.min.js"></script>
%if not locale == 'default':
    <script type="text/javascript" src="js/i18n/jquery-ui-timepicker-{{locale}}.js"></script>
    <script type="text/javascript" src="js/i18n/jquery.ui.datepicker-{{locale}}.js"></script>
%end
    <script type="text/javascript" src="js/jqueryFileTree.js"></script>
    <script type="text/javascript" src="js/tvstreamrecord.basic.js?v=140"></script>
    <script type="text/javascript" src="js/preloader.js"></script>
</head>

<body>
    <div id="datepicker_local" style="display: none;"></div>
    <div id="timepicker_local" style="display: none;"></div>

    <div id="mybody" class="" language="{{language}}">

        <div id="menus">
            <div id="logo">
                <a href="http://pavion.github.io/tvstreamrecord/"><img id="img_logo" alt="logo" src="images/tvstreamrecordlogo.png"></a>
            </div>
            <div id="loaderImage"></div>
            <div id="tabs" class="">
                <div id="menu-toggle" class="menuentry">☰</div>
                <div id="mainmenu" class="">
                    <div id="menu-0" class="menuentry"><a class="" href="/records">§Records§</a></div>
                    <div id="menu-1" class="menuentry"><a class="" href="/list">§Channels§</a></div>
                    <div id="menu-2" class="menuentry"><a class="" href="/epgchart">§EPG Chart§</a></div>
                    <div id="menu-3" class="menuentry"><a class="" href="/epglist">§EPG List§</a></div>
                    <div id="menu-4" class="menuentry"><a class="" href="/config">§Config§</a></div>
                    <div id="menu-5" class="menuentry"><a class="" href="/log">§Log§</a></div>
                    <div id="menu-6" class="menuentry"><a class="" href="/about">§About§</a></div>
%if logout:
                    <div id="menu-7" class=""><a class="" href="/logoff">X</a></div>
%end
                </div>
            </div>
%from datetime import datetime
%if datetime.now().month == 12:
            <div style="float: right; margin: -6px -192px 0 0; z-index: 999;"><img src="images/mc.png"></div>
%end
        </div>
