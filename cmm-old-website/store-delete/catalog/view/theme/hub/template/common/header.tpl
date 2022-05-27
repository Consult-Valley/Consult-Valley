<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/hub/stylesheet/stylesheet.css" />
<link href='http://fonts.googleapis.com/css?family=Raleway:400,500,600,700' rel='stylesheet' type='text/css' />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="header-wrap">
<div id="header">
	<div id="welcome-links">
         <div id="welcome">
            <?php if (!$logged) { ?>
            <?php echo $text_welcome; ?>
            <?php } else { ?>
            <?php echo $text_logged; ?>
            <?php } ?>
          </div>
          <div id="contact-info">
          	<p>Contact Us Today! <a href='ma&#105;lto&#58;Hi&#109;ansh&#117;&#64;c&#114;&#105;c&#107;e&#116;&#109;e%67am&#97;&#114;t&#46;%&#54;3&#111;&#109;'>&#72;im&#97;&#110;sh&#117;&#64;cr&#105;cketmegamart&#46;com</a>   |   (210) 488-7417</p>
          </div><!-- end contact-info -->
    </div><!-- end welcome-links -->
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
 
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
</div><!-- end header -->
<div id="menu-wrap">
<!--<?php if ($categories) { ?>
<div id="menu">
  <ul>
  	<li><a href="<?php echo $home; ?>">Home</a></li>
    <li><a href="about_us">About Us</a></li>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
    <li><a href="Company_Policies">Company Policies</a></li>
    <li><a href="index.php?route=information/contact">Contact</a></li>
  </ul>
</div>
<?php } ?>  -->


<div id="menu">
  <ul>
  	<li><a href="<?php echo $home; ?>">Home</a></li>
    <li><a href="Products-Carousel">Products</a></li>
    <li><a href="Company_Policies">Company Policies</a></li>
    <li><a href="index.php?route=information/contact">Contact</a></li>
    <li><a href="about_us">About Us</a></li>
  </ul>
</div><!-- end menu  -->

</div><!-- end menu-wrap  --> 
</div><!-- end header-wrap  -->
<div id="container">
<?php if ($error) { ?>   
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<div id="notification"></div>
