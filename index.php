<?php
	require 'scripts/menu.php';
	$page = return_page('page');
	require 'scripts/links.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="Symeon Papadimitropoulos"/>
<title>Web site of Symeon Papadimitropoulos</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen,print" />
</head>
<body id="wrap">
<div id="datediv">
  <?php
			date_default_timezone_set('Europe/Helsinki');
			echo date("l, F d Y");
		?>
</div>
<div id="header">
  <h1>Symeon Papadimitropoulos</h1>
  <h2>Graduate student</h2>
</div>
<div id="contentwrap" class="clearfix">
  <div id="sidebar">
    <?php
				display_menu($page);
				display_menu_external_links();
			?>
  </div>
  <div id="content">
    <?php
				$content_file_to_include = './'.strtolower($page).'.php';
				if (file_exists($content_file_to_include))
				{
					include($content_file_to_include);
				}
				else
				{
					include('home.php');
				}
			?>
  </div>
</div>
<div id="footer" class="clearfix">
  <div id="leftfoot">
    <p>Dept. of Applied Mathematics, University of Crete, Heraklion<br/>
      GR-71003 Heraklion, Crete, Greece<br/>
      Tel: +30-2810-327241 </p>
  </div>
  <div id="rightfoot">
    <p> <a href="http://validator.w3.org/check?uri=referer"><img
      src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" height="31" width="88" border="0" /></a> &nbsp; <a href="http://jigsaw.w3.org/css-validator/check/referer"> <img style="border:0;width:88px;height:31px"
            src="http://jigsaw.w3.org/css-validator/images/vcss"
            alt="Valid CSS" /> </a> </p>
  </div>
</div>
</body>
</html>
