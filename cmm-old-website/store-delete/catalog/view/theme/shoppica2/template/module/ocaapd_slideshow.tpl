<?php if (!isset($tbData)) require dirname(__FILE__) . '/../tb/install_error.tpl'; ?>
<?php if ($products) { ?>
	<?php if ($position == 'content_top' || $position == 'content_bottom') { ?>
		<div class="s_module_bestseller s_module_content">
			<h2 class="s_title_1"><span><?php echo $heading_title; ?></span></h2>
			<div class="s_listing s_grid_view <?php echo $tbData->common['products_per_row']; ?> clearfix">
				<div class="<?php echo $extension; ?><?php echo $module; ?>">
					<?php foreach ($products as $product) { ?>
						<div>
							<div class="s_item product_<?php echo $product['product_id']; ?>">
								<?php if ($product['thumb']) { ?>
									<?php if ($product['product_href']) { ?>
										<a class="s_thumb" href="<?php echo $product['product_href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
									<?php } else { ?>
										<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
									<?php } ?>
								<?php } ?>
								<div class="s_item_info">
									<?php if ($product['name']) { ?>
										<?php if ($product['product_href']) { ?>
											<h3><a href="<?php echo $product['product_href']; ?>"><?php echo $product['name']; ?></a></h3>
										<?php } else { ?>
											<h3><?php echo $product['name']; ?></h3>
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
									<?php if ($product['price']) { ?>
										<div class="s_price_holder s_size_<?php echo $tbData->common['price_size']; ?> <?php echo 's_' . $tbData->common['price_design']; ?>">
											<?php if (!$product['special']) { ?>
												<p class="s_price"><?php echo $tbData->priceFormat($product['price']); ?></p>
											<?php } else { ?>
												<p class="s_price s_promo_price"><span class="s_old_price"><?php echo $tbData->priceFormat($product['price']); ?></span><?php echo $tbData->priceFormat($product['special']); ?></p>
											<?php } ?>
										</div>
									<?php } ?>
									<?php if ($product['rating']) { ?>
										<p class="s_rating s_rating_5"><span style="width: <?php echo $product['rating'] * 2 ; ?>0%;" class="s_percent"></span></p>
									<?php } ?>
									<?php if ($tbData->common['checkout_enabled'] || $tbData->common['wishlist_enabled'] || $tbData->common['compare_enabled']) { ?>
										<div class="s_actions">
											<?php if ($product['cart'] && $tbData->common['checkout_enabled']) { ?>
												<a class="s_button_add_to_cart" href="javascript:;" onclick="addToCart('<?php echo $product['product_id']; ?>');"><span class="s_icon_16"><span class="s_icon"></span><?php echo $button_cart; ?></span></a>
											<?php } ?>
											<?php if ($tbData->common['wishlist_enabled']) { ?>
												<a class="s_button_wishlist s_icon_10" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span class="s_icon s_add_10"></span><?php echo $tbData->text_wishlist; ?></a>
											<?php } ?>
											<?php if ($tbData->common['compare_enabled']) { ?>
												<a class="s_button_compare s_icon_10" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span class="s_icon s_add_10"></span><?php echo $tbData->text_compare; ?></a>
											<?php } ?>
										</div>
									<?php } ?>
									<?php if ($product['description']) { ?>
										<div><p align="left"><?php echo $product['description']; ?></p></div>
									<?php } ?>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	<?php } else { ?>
		<div class="s_box clearfix">
			<h2><?php echo $heading_title; ?></h2>
			<div class="<?php echo $extension; ?><?php echo $module; ?>">
				<?php foreach ($products as $product) { ?>
					<div style="width: 100%;">
						<div class="s_item s_size_1 clearfix">
							<?php if ($product['thumb']) { ?>
								<?php if ($product['product_href']) { ?>
									<a class="s_thumb" href="<?php echo $product['product_href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
								<?php } else { ?>
									<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
								<?php } ?>
							<?php } ?>
							<?php if ($product['name']) { ?>
								<?php if ($product['product_href']) { ?>
									<h3><a href="<?php echo $product['product_href']; ?>"><?php echo $product['name']; ?></a></h3>
								<?php } else { ?>
									<h3><?php echo $product['name']; ?></h3>
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
							<?php if ($product['price']) { ?>
								<p>
									<?php if ($product['product_href']) { ?>
										<a href="<?php echo $product['product_href']; ?>">
									<?php } ?>
									<?php if (!$product['special']) { ?>
										<span class="s_main_color"><?php echo $product['price']; ?></span>
									<?php } else { ?>
										<span class="s_old"><?php echo $product['price']; ?></span> <span class="s_secondary_color"><?php echo $product['special']; ?></span>
									<?php } ?>
									<?php if ($product['product_href']) { ?>
										</a>
									<?php } ?>
								</p>
							<?php } ?>
							<?php if ($product['rating']) { ?>
								<div class="s_rating_holder clearfix">
									<p class="s_rating s_rating_small s_rating_5 left"><span style="width: <?php echo $product['rating'] * 2 ; ?>0%;" class="s_percent"></span></p><span class="left">&nbsp;<?php echo $product['rating']; ?>/5</span>
								</div>
							<?php } ?>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
	<?php } ?>
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