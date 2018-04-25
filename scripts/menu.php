<?php
	function return_page($get_variable)
	{
		if (isset($_GET[$get_variable]))
			$return_page = htmlentities($_GET[$get_variable]);
		else
			$return_page= 'Home';
		return $return_page;
	}
	
	function display_menu($page)
	{
		$menu_items = array("Home", "Research", "Software", "Films", "Contact");
		echo '<ul>';
		foreach ($menu_items as $menu_item_id => $menu_item_name)
		if ($page == $menu_item_name)
				echo '<li><a class="currentlink" href="index.php?page='.$menu_item_name.'">'.$menu_items[$menu_item_id].'</a></li>';
		else
				echo '<li><a href="index.php?page='.$menu_item_name.'">'.$menu_items[$menu_item_id].'</a></li>';
		echo '</ul>';
	}
	
	function display_menu_external_links()
	{
		$menu_link_url = array("http://www.tem.uoc.gr/" => "Applied Math Dept.", "http://www.iacm.forth.gr/" => "IACM/FORTH", "http://www.acmac.uoc.gr/" => "Archimedes Center (ACMAC)", "http://www.uoc.gr/" => "University of Crete");
		echo '<ul>';
		foreach ($menu_link_url as $menu_link_url_id => $menu_link_url_value)
			echo '<li><a href="'.$menu_link_url_id.'">'.$menu_link_url_value.'</a></li>';
		echo '</ul>';
	}
?>
