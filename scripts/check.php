<?php
	function check_page($page)
	{
		$page_name = substr(
         $_SERVER['PHP_SELF'],
         strrpos($_SERVER['PHP_SELF'], '/')+1,
         strrpos($_SERVER['PHP_SELF'],'.')-1
    );
		if ($page_name != 'index.php')
		{
			header('Location: index.php?page='.$page);
		}
	}
?>