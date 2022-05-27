</div><!-- end container -->
<div id="footer-wrap">
<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <!--<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>-->
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
	<div class="column">
    <h3 class="large">Cricket Mega Mart</h3>
      <p><a href='&#109;ailto&#58;i&#37;6Efo&#37;&#52;0crick%65t&#109;e&#103;&#97;&#37;&#54;&#68;a&#114;%74&#46;com'>i&#110;fo&#64;&#99;&#114;i&#99;&#107;&#101;tm&#101;gamar&#116;&#46;c&#111;&#109;</a><br />
		(210) 488-7417</p>
        <div id="social">
          <a href="#" target="_blank"><img src="catalog/view/theme/hub/image/facebook.png" alt="Facebook" /></a>
          <a href="#" target="_blank"><img src="catalog/view/theme/hub/image/twitter.png" alt="Twitter" /></a>
        </div><!-- end social -->
  </div>
<div id="copyright">
<p>Copyright &copy; 2013 Cricket Mega Mart - All Rights Reserved - Web Hosting and Design by Web Hosting Hub</p>
</div><!-- end copyright -->
</div><!-- end footer -->
</div><!-- end footer-wrap -->
</body></html>