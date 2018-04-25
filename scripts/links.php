<?php
	function add_link_with_picture($link, $picture)
	{
		echo '<div class="publink">';
		echo '<a href="'.$link.'"><img src="img/'.$picture.'.gif" alt="'.$picture.'" border="0" width="32px" height="32px" /></a>';
		echo '</div>';
	}
?>