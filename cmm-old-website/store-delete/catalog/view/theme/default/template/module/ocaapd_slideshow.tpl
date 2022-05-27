<?php if ($products) { ?>
	<div class="box">
		<div class="box-heading"><?php echo $heading_title; ?></div>
		<div class="box-content">  
			<div class="box-product" style="Overflow-y:hidden; Overflow-x:hidden;">
				<div class="<?php echo $extension; ?><?php echo $module; ?>" style="text-align: center; width: 100%; margin: 0px;">
					<?php foreach ($products as $product) { ?>
						<div style="text-align: center; width: 100%;">  
							<?php if ($product['thumb']) { ?>
								<?php if ($product['product_href']) { ?>
									<div class="image"><a href="<?php echo $product['product_href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
								<?php } else { ?>
									<div class="image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></div>
								<?php } ?>
							<?php } ?>
							<?php if ($product['name']) { ?>
								<?php if ($product['product_href']) { ?>
									<div class="name"><a href="<?php echo $product['product_href']; ?>"><?php echo $product['name']; ?></a></div>
								<?php } else { ?>
									<div class="name"><?php echo $product['name']; ?></div>
								<?php } ?>
							<?php } ?>
							<?php if ($product['model']) { ?>
								<span style="color: #BBB;"><?php echo $product['model']; ?></span>
							<?php } ?>
							<?php if ($product['manufacturer']) { ?>
								<div style="display: block; color: #BBB; text-decoration: none;">
									<?php if ($product['manufacturer_href']) { ?>
										<a style="display: block; color: #BBB; text-decoration: none;" href="<?php echo $product['manufacturer_href']; ?>" style="color: #BBB;"><?php echo $product['manufacturer']; ?></a>
									<?php } else { ?>
										<?php echo $product['manufacturer']; ?>
									<?php } ?>
								</div>
							<?php } ?>
							<?php if ($product['rating']) { ?>
								<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['rating']; ?>" /></div>
							<?php } ?>
							<?php if ($product['price']) { ?>
								<div class="price">
									<?php if (!$product['special']) { ?>
										<?php echo $product['price']; ?>
									<?php } else { ?>
										<?php if ($version >= 151) { ?>
											<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
										<?php } else { ?>
											<s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
										<?php } ?>
									<?php } ?>
								</div>
							<?php } ?>
							<?php if ($product['cart']) { ?>
								<div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
							<?php } ?>
							<?php if ($product['description']) { ?>
								<div><p align="left"><?php echo $product['description']; ?></p></div>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
<?php } ?>

<script type="text/javascript">
	$(document).ready(function() {
		$('.<?php echo $extension; ?><?php echo $module; ?>').<?php echo $extension; ?>({
			fx: '<?php echo $effect; ?>',
			timeout: '<?php echo $speed; ?>',
			height: '<?php echo $height; ?>'
        }); 
    }); 
	
	$('.<?php echo $extension; ?><?php echo $module; ?>').mouseover(function() { 
		$('.<?php echo $extension; ?><?php echo $module; ?>').<?php echo $extension; ?>('pause'); 
	});
	
	$('.<?php echo $extension; ?><?php echo $module; ?>').mouseout(function() { 
		$('.<?php echo $extension; ?><?php echo $module; ?>').<?php echo $extension; ?>('resume'); 
	});
</script>