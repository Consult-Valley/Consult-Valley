<?php if ($products) { ?>
	<div class="box">
		<div class="box-heading"><?php echo $heading_title; ?></div>
		<div class="box-content">
			<style type="text/css">
				#<?php echo $extension; ?>-list ?> { width: 100%; border: 1px solid #E7E7E7; background-color: #FFF; }
				#<?php echo $extension; ?>-list:hover { background-color: #F8F8F8; }
				.oca_button_small, a.oca_button_small:visited { margin-top: 3px; background:url('<?php echo $button; ?>') no-repeat left center transparent; padding: 5px; text-decoration: none; cursor: pointer; }
			</style>
			<div class="box-product" style="Overflow-y:hidden; Overflow-x:hidden;">
				<?php foreach ($products as $product) { ?>
					<div style="margin: 0px; margin-bottom: 10px; padding: 0px; width:100%;">
						<table id="<?php echo $extension . '-list'; ?>" style="border: 1px solid #E7E7E7; width: 100%;">
							<tr>
								<?php if ($product['thumb']) { ?>
									<td valign="middle" width="<?php echo $width; ?>">
										<?php if ($product['product_href']) { ?>
											<div class="image"><a href="<?php echo $product['product_href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
										<?php } else { ?>
											<div class="image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></div>
										<?php } ?>
									</td>
								<?php } ?>
								<td valign="middle">
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
									<?php if ($product['price'] || $product['cart']) { ?>
										<div class="price">
											<?php if ($product['price']) { ?>
												<?php if (!$product['special']) { ?>
													<?php echo $product['price']; ?>
												<?php } else { ?>
													<?php if ($version >= 151) { ?>
														<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
													<?php } else { ?>
														<s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
													<?php } ?>
												<?php } ?>
											<?php } ?>
											<?php if ($product['cart']) { ?>
												 <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="oca_button_small" title="<?php echo $button_cart; ?>"></a>
											<?php } ?>
										</div>
									<?php } ?>
									<?php if ($product['description']) { ?>
										<div><p align="left"><?php echo $product['description']; ?></p></div>
									<?php } ?>
								</td>
							</tr>
						</table>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
<?php } ?>

<script type="text/javascript">
	$('#<?php echo $extension; ?>-list').mouseover(function() { 
		$('.<?php echo $extension; ?><?php echo $module; ?>').<?php echo $extension; ?>('pause'); 
	});
	
	$('#<?php echo $extension; ?>-list').mouseout(function() { 
		$('.<?php echo $extension; ?><?php echo $module; ?>').<?php echo $extension; ?>('resume'); 
	});
</script>