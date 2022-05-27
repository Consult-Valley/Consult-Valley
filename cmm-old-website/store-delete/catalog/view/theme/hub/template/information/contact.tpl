<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <p>Thank You very much for shopping at Cricket Mega Mart. We are committed to provide you with an enjoyable shopping experience. In case of any queries, you can reach us via email or phone. We will contact you within 2 business days to answer any questions that you may have.</p>
<p><b>Email:</b><br />
For general enquiries, please Email: <a href='&#109;ailto&#58;e&#37;6Equ&#37;69&#114;&#121;&#64;&#99;%&#55;2%6&#57;%6&#51;k&#101;t&#109;&#101;gamar%74&#46;com'>&#101;n&#113;uiry&#64;&#99;r&#105;cke&#116;m&#101;gamart&#46;com</a>,<br /> 
For any urgent matter, please Email: <a href='ma&#105;l&#116;o&#58;Hima&#110;%7&#51;&#37;6&#56;u&#64;&#99;r&#105;%&#54;&#51;%6&#66;etmeg%6&#49;&#109;&#97;&#37;&#55;&#50;t&#46;co%6&#68;'>&#72;&#105;manshu&#64;&#99;r&#105;cketm&#101;&#103;a&#109;a&#114;&#116;&#46;c&#111;m</a></p>

<p><b>Phone:</b><br />
(210) 488-7417 <span class="red">[9:00 AM to 5:00 PM Pacific Time]</span></p>

<p><b>Warehouse: </b><br />
1441 South State College Blvd.,<br />
Anaheim, CA, 92806<br />
<span class="red">Please note that this is not a store front. Advance appointment is required for visiting the warehouse.</span></p>
    
    <!--<h2><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content">
      	<div class="left">
        <b><?php echo $text_address; ?></b><br />
        <?php echo $store; ?><br />
        <?php echo $address; ?>
      </div>
      <div class="right">
        <?php if ($telephone) { ?>
        <b><?php echo $text_telephone; ?></b><br />
        <?php echo $telephone; ?><br />
        <br />
        <?php } ?>
        <?php if ($fax) { ?>
        <b><?php echo $text_fax; ?></b><br />
        <?php echo $fax; ?>
        <?php } ?>
      </div>
    </div>
    </div>-->
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>