<?php if (!isset($tbData)) require dirname(__FILE__) . '/../tb/install_error.tpl'; ?>
<?php if ($products) { ?>
	<style type="text/css">
		#<?php echo $extension; ?>-content<?php echo $module; ?> .jcarousel-skin-<?php echo $extension; ?> .jcarousel-container-vertical { width: <?php echo $width; ?>; height: <?php echo $height; ?>; padding: 40px 20px; }
		#<?php echo $extension; ?>-content<?php echo $module; ?> .jcarousel-skin-<?php echo $extension; ?> .jcarousel-container-horizontal { width: <?php echo $width; ?>; height: <?php echo $height; ?>; padding: 0px 40px; }
		.jcarousel-skin-<?php echo $extension; ?> .jcarousel-clip-vertical { width: <?php echo $width; ?>; }
		#<?php echo $extension; ?>-list ?> { width: 100%; border: 1px solid #E7E7E7; background-color: #FFF; }
		#<?php echo $extension; ?>-list:hover { background-color: #F8F8F8; }
		.oca_button_small, a.oca_button_small:visited { margin-top: 3px; background:url('<?php echo $button; ?>') no-repeat left center transparent; padding: 5px; text-decoration: none; cursor: pointer; }
	</style>
	<?php if ($position == 'content_top' || $position == 'content_bottom') { ?>
		<div class="s_module_bestseller s_module_content">
			<h2 class="s_title_1"><span><?php echo $heading_title; ?></span></h2>
			<div class="s_listing s_grid_view <?php echo $tbData->common['products_per_row']; ?> clearfix">
				<div id="<?php echo $extension; ?>-content<?php echo $module; ?>">
					<ul id="<?php echo $extension; ?><?php echo $module; ?>" class="jcarousel-skin-<?php echo $extension; ?>">
						<?php foreach ($products as $product) { ?>
							<li style="text-align: center; padding: 10px; width: 220px;">
								<div style="text-align: center; padding: 10px; width: 220px;">  
									<?php if ($product['thumb']) { ?>
										<div style="text-align: center;">
											<?php if ($product['product_href']) { ?>
												<ahref="<?php echo $product['product_href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
											<?php } else { ?>
												<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
											<?php } ?>
										</div>
									<?php } ?>
									<div class="s_item_info" style="clear: both;">
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
											<p class="s_rating s_rating_5"><span style="width: <?php echo $product['rating'] * 2 ; ?>0%;" class="s_percent"></span></p>
										<?php } ?>
										<?php if ($product['description']) { ?>
											<div><p align="left"><?php echo $product['description']; ?></p></div>
										<?php } ?>
									</div>
								</div>
							</li>
						<?php } ?>
					</ul>
				</div>
			</div>
		</div>
	<?php } else { ?>
		<div class="s_box clearfix">
			<h2><?php echo $heading_title; ?></h2>
			<div id="<?php echo $extension; ?>-content<?php echo $module; ?>">
				<ul id="<?php echo $extension; ?><?php echo $module; ?>" class="jcarousel-skin-<?php echo $extension; ?>" style="width:100%;">
					<?php foreach ($products as $product) { ?>
						<li style="width:100%;">
							<div style="margin: 0px; margin-bottom: 10px; padding: 0px; width:100%;">
								<table id="<?php echo $extension . '-list'; ?>" style="border: 1px solid #E7E7E7; width: 100%;">
									<tr>
										<?php if ($product['thumb']) { ?>
											<td valign="middle" width="<?php echo $image_width; ?>">
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
						</li>
					<?php } ?>
				</ul>
			</div>
		</div>
	<?php } ?>
<?php } ?>

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('#<?php echo $extension; ?><?php echo $module; ?>').jcarousel({
			vertical: <?php echo $vertical; ?>,
			visible: <?php echo $visible; ?>,
			scroll: <?php echo $scroll; ?>,
			auto: <?php echo $auto_scroll; ?>,
			wrap: '<?php echo $wrap; ?>',
			
			initCallback: function(jc, state) { 
				if (state == 'init') { 
					jc.startAutoOrig = jc.startAuto; 
					jc.startAuto = function() { 
						if (!jc.paused) { 
							jc.startAutoOrig(); 
						} 
					} 
					jc.pause = function() { 
						jc.paused = true; 
						jc.stopAuto(); 
					}; 
					jc.play = function() { 
						jc.paused = false; 
						jc.startAuto(); 
					}; 
					$('li.jcarousel-item').mouseover(function() { 
						jc.pause(); 
					}); 
					$('li.jcarousel-item').mouseout(function() { 
						jc.play(); 
					}); 
				} 
				jc.play(); 
			} 
		});
	});
</script>