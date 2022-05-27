<!doctype html> 
<!--
      //===========================================//
     // Advanced Product Display                  //
    // Author: Joel Reeds                        //
   // Company: OpenCart Addons                  //
  // Website: http://opencartaddons.com        //
 // Contact: webmaster@opencartaddons.com     //
//===========================================//
-->
<?php echo $header; ?>	
<?php if ($ocversion >= 150) { ?>			
	<div id="content">
		<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
<?php } ?>	
	<?php if ($success) { ?>
        <div class="success"><?php echo $success; ?></div>
    <?php } ?>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
		<div class="box">
			<?php if ($ocversion < 150) { ?>
				<div class="left"></div>
				<div class="right"></div>
			<?php } ?>
			<div class="heading">
				<?php if ($ocversion < 150) { ?>
					<h1 style="background-image: url('view/image/module.png');"><?php echo $heading_title; ?></h1>
				<?php } else { ?>
					<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
				<?php } ?>
				<div class="buttons"><a onclick="$('#form').attr('action', '<?php echo $action; ?>&apply=true'); $('#form').submit();" class="button"><span><?php echo $button_apply; ?></span></a><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
			</div>
			<div class="content">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
					<div class="oca-information" style="width: 100%;">
						<div class="oca-header"><?php echo $text_help; ?> <div class="oca-remove"><a href="http://opencartaddons.com" target="_blank"><img src="view/image/oca_logo.png" alt="OpenCart Addons" height="17px"/></a></div></div>
						<div class="oca-rate" style="border: 1px solid #DDDDDD; height: 300px; padding: 5px; overflow: auto;">
							<div id="help" class="htabs">
								<?php if ($ocversion >= 150) { $htabs = 'href'; } else { $htabs = 'tab'; } ?>
								<a <?php echo $htabs; ?>="#help-module_general"><?php echo $text_general_settings; ?></a>
								<a <?php echo $htabs; ?>="#help-module_layout"><?php echo $text_layout_settings; ?></a>
								<a <?php echo $htabs; ?>="#help-module_product"><?php echo $text_product_settings; ?></a>
								<a <?php echo $htabs; ?>="#help-module_display"><?php echo $text_display_settings; ?></a>
								<a <?php echo $htabs; ?>="#help-module_troubleshoot"><?php echo $text_troubleshoot; ?></a>
							</div>
							<?php if ($ocversion >= 150) { $htabs_content = 'htabs-content'; } else { $htabs_content = 'htabs_page'; } ?>
							<div id="help-module_general" class="<?php echo $htabs_content; ?>">
								<?php echo $help_module_general_settings; ?>
							</div>
							<div id="help-module_layout" class="<?php echo $htabs_content; ?>">
								<?php echo $help_module_layout_settings; ?>
							</div>
							<div id="help-module_product" class="<?php echo $htabs_content; ?>">
								<?php echo $help_module_product_settings; ?>
							</div>
							<div id="help-module_display" class="<?php echo $htabs_content; ?>">
								<?php echo $help_module_display_settings; ?>
							</div>
							<div id="help-module_troubleshoot" class="<?php echo $htabs_content; ?>">
								<?php echo $help_module_troubleshoot; ?>
							</div>
						</div>
					</div>
					
					<?php $module_row = 1; ?>
					<?php if (!empty(${$extension . '_module'})) { ?>
						<?php foreach (${$extension . '_module'} as $data) { ?>
							<div id="module-row<?php echo $module_row; ?>" class="oca-rate">
								<div class="oca-head"><?php echo substr($data['module_name'], 0, 100); if (strlen($data['module_name']) > 100) { echo '...'; } ?> <div class="oca-remove"><a onclick="if (confirm('<?php echo $text_confirm_delete; ?>')) { $('#module-row<?php echo $module_row; ?>').remove(); }"><img src="view/image/oca_remove.png" alt="<?php echo $button_remove_module; ?>" /></a></div></div>
								<div class="oca-content">
									<table class="oca-table">
										<thead>
											<tr>
												<td class="left" colspan="4" style="border-bottom: 1px solid #DDDDDD;"><?php echo $entry_module_description; ?> <input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][module_name]" value="<?php echo $data['module_name']; ?>" size="115" /></td>
											</tr>
											<tr>
												<td class="center" width="25%"><?php echo $text_general_settings; ?></td>
												<td class="center" width="25%"><?php echo $text_layout_settings; ?></td>
												<td class="center" width="25%"><?php echo $text_product_settings; ?></td>
												<td class="center" width="25%"><?php echo $text_display_settings; ?></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="center" style="vertical-align:top;">
													<div class="oca-entry"><?php echo $entry_status; ?></div>
													<div class="oca-input">
														<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][status]">
															<?php if ($data['status']) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
															<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
															<?php } ?>
														</select>
													</div>
													<div class="oca-entry"><?php echo $entry_cache; ?></div>
													<div class="oca-input">
														<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][cache]">
															<?php if ($data['cache']) { ?>
																<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
																<option value="0"><?php echo $text_disabled; ?></option>
															<?php } else { ?>
																<option value="1"><?php echo $text_enabled; ?></option>
																<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
															<?php } ?>
														</select>
													</div>
													<div class="oca-entry"><?php echo $entry_header; ?></div>
													<div class="oca-input">
														<?php foreach ($languages as $language) { ?>
															<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][header][<?php echo $language['code']; ?>]" value="<?php echo $data['header'][$language['code']]; ?>" size="25" /><br />
														<?php } ?>
													</div>
													<div class="oca-entry"><?php echo $entry_sort_order; ?></div>
													<div class="oca-input">
														<input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $data['sort_order']; ?>" size="5" />
													</div>
													<div class="oca-entry"><?php echo $entry_stores; ?></div>
													<div class="oca-input">
														<div class="scrollbox" style="width:100%; text-align:left;">
															<?php $class = 'odd'; ?>
															<div class="<?php echo $class; ?>">
																<?php if (!empty($data['stores']) && in_array(0, $data['stores'])) { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][stores][]" value="0" checked="checked" />
																	<?php echo $this->config->get('config_name'); ?>
																<?php } else { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][stores][]" value="0" />
																	<?php echo $this->config->get('config_name'); ?>
																<?php } ?>
															</div>
															<?php foreach ($stores as $store) { ?>
																<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
																<div class="<?php echo $class; ?>">
																	<?php if (!empty($data['stores']) && in_array($store['store_id'], $data['stores'])) { ?>
																		<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][stores][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
																		<?php echo $store['name']; ?>
																	<?php } else { ?>
																		<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][stores][]" value="<?php echo $store['store_id']; ?>" />
																		<?php echo $store['name']; ?>
																	<?php } ?>
																</div>
															<?php } ?>
														</div>
														<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
													</div>
													<div class="oca-entry"><?php echo $entry_customer_groups; ?></div>
													<div class="oca-input">
														<div class="scrollbox" style="width:100%; text-align:left;">
															<?php $class = 'even'; ?>
															<div class="<?php echo $class; ?>">
																<?php if (!empty($data['customer_groups']) && in_array(0, $data['customer_groups'])) { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][customer_groups][]" value="0" checked="checked" />
																	<i><?php echo $text_guest_checkout; ?></i>
																<?php } else { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][customer_groups][]" value="0" />
																	<i><?php echo $text_guest_checkout; ?></i>
																<?php } ?>
															</div>
															<?php foreach ($customer_groups as $customer_group) { ?>
																<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
																<div class="<?php echo $class; ?>">
																<?php if (!empty($data['customer_groups']) && in_array($customer_group['customer_group_id'], $data['customer_groups'])) { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][customer_groups][]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
																	<?php echo $customer_group['name']; ?>
																<?php } else { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][customer_groups][]" value="<?php echo $customer_group['customer_group_id']; ?>" />
																	<?php echo $customer_group['name']; ?>
																	<?php } ?>
																</div>
															<?php } ?>
														</div>
														<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
													</div>
												</td>
												<td class="center" style="vertical-align:top;">
													<div class="oca-entry"><?php echo $entry_categories; ?></div>
													<div class="oca-input">
														<div class="scrollbox" style="width:100%; text-align:left;">		
															<?php $class = 'even'; ?>
															<div class="<?php echo $class; ?>">
																<?php if (!empty($data['categories']) && in_array(0, $data['categories'])) { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][categories][]" value="0" checked="checked" />
																	<i><?php echo $text_all_categories; ?></i>
																<?php } else { ?>
																	<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][categories][]" value="0" />
																	<i><?php echo $text_all_categories; ?></i>
																<?php } ?>
															</div>
															<?php foreach ($categories as $category) { ?>
																<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
																<div class="<?php echo $class; ?>">
																	<?php if (!empty($data['categories']) && in_array($category['category_id'], $data['categories'])) { ?>
																		<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][categories][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
																		<?php echo $category['name']; ?>
																	<?php } else { ?>
																		<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][categories][]" value="<?php echo $category['category_id']; ?>" />
																		<?php echo $category['name']; ?>
																	<?php } ?>
																</div>
															<?php } ?>
														</div>
														<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
													</div>
													<div class="oca-entry"><?php echo $entry_layout; ?></div>
													<div class="oca-input">
														<div style="<?php if (!$vqmod) { echo 'display: none;'; } ?>">
															<div class="scrollbox" style="width:100%; text-align:left;">		
																<?php $class = 'even'; ?>
																<div class="<?php echo $class; ?>">
																	<?php if (!empty($data['layouts']) && in_array(0, $data['layouts'])) { ?>
																		<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][layouts][]" value="0" checked="checked" />
																		<i><?php echo $text_all_layouts; ?></i>
																	<?php } else { ?>
																		<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][layouts][]" value="0" />
																		<i><?php echo $text_all_layouts; ?></i>
																	<?php } ?>
																</div>
																<?php foreach ($layouts as $layout) { ?>
																	<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
																	<div class="<?php echo $class; ?>">
																		<?php if (!empty($data['layouts']) && in_array($layout['layout_id'], $data['layouts'])) { ?>
																			<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][layouts][]" value="<?php echo $layout['layout_id']; ?>" checked="checked" />
																			<?php echo $layout['name']; ?>
																		<?php } else { ?>
																			<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][layouts][]" value="<?php echo $layout['layout_id']; ?>" />
																			<?php echo $layout['name']; ?>
																		<?php } ?>
																	</div>
																<?php } ?>
															</div>
															<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
															<input type="hidden" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][layout_id]" value="1">
														</div>
														<div style="<?php if ($vqmod) { echo 'display: none;'; } ?>">
															<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][layout_id]">
																<?php foreach ($layouts as $layout) { ?>
																	<?php if ($layout['layout_id'] == $data['layout_id']) { ?>
																		<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
																	<?php } else { ?>
																		<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
																	<?php } ?>
																<?php } ?>
															</select>
														</div>
													</div>
													<div class="oca-entry"><?php echo $entry_position; ?></div>
													<div class="oca-input">
														<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][position]">
															<?php foreach ($positions as $position) { ?>
																<?php if ($position['id'] == $data['position']) { ?>
																	<option value="<?php echo $position['id']; ?>" selected="selected"><?php echo $position['name']; ?></option>
																<?php } else { ?>
																	<option value="<?php echo $position['id']; ?>"><?php echo $position['name']; ?></option>
																<?php } ?>
															<?php } ?>
														</select>
													</div>
												</td>
												<td class="center" style="vertical-align:top;">
													<div class="oca-entry"><?php echo $entry_module_type; ?></div>
													<div class="oca-input" align="center">
														<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][module_type]" onchange="toggleModule(<?php echo $module_row; ?>, $(this).val())">
															<?php foreach ($module_types as $module_type) { ?>
																<?php if ($module_type['id'] == $data['module_type']) { ?>
																	<option value="<?php echo $module_type['id']; ?>" selected="selected"><?php echo $module_type['name']; ?></option>
																<?php } else { ?>
																	<option value="<?php echo $module_type['id']; ?>"><?php echo $module_type['name']; ?></option>
																<?php } ?>
															<?php } ?>
														</select>
													</div>
													<div id="oca-featured<?php echo $module_row; ?>" <?php if ($data['module_type'] !== '0') { echo 'style="display: none;"'; } ?>>
														<div class="oca-entry"><?php echo $entry_featured_products; ?></div>
														<div class="oca-input" align="center">
															<input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][featured][input]" value="" /><br/>
															<div id="featured-product-<?php echo $module_row; ?>" class="scrollbox"  style="width: 100%; text-align: left;">
																<?php $class = 'odd'; ?>
																<?php foreach (${$extension . '_featured_products_' . $module_row} as $product) { ?>
																	<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
																	<div id="featured-product-<?php echo $module_row; ?>-<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" />
																		<input type="hidden" value="<?php echo $product['product_id']; ?>" />
																	</div>
																<?php } ?>
															</div>
															<input type="hidden" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][featured_products]" value="<?php echo $data['featured_products']; ?>" />
														</div>														
													</div>
													<div id="oca-custom<?php echo $module_row; ?>" <?php if ($data['module_type'] !== '8') { echo 'style="display: none;"'; } ?>>
														<div class="oca-entry"><?php echo $text_custom_settings; ?></div>
														<div class="oca-input" align="center">
															<table class="oca-table-noborder">
																<thead>
																	<tr>
																		<td class="center"><?php echo $entry_sort; ?></td>
																		<td class="center"><?php echo $entry_order; ?></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="center">
																			<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][sort]">
																				<?php foreach ($sort_data as $sort) { ?>
																					<?php if ($sort == $data['sort']) { ?>
																						<option value="<?php echo $sort; ?>" selected="selected"><?php echo $sort; ?></option>
																					<?php } else { ?>
																						<option value="<?php echo $sort; ?>"><?php echo $sort; ?></option>
																					<?php } ?>
																				<?php } ?>
																			</select>
																		</td>
																		<td class="center">
																			<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][order]">
																				<?php if ($data['order'] == 'ASC') { ?>
																					<option value="ASC" selected="selected">Ascending</option>
																					<option value="DESC">Descending</option>
																				<?php } else { ?>
																					<option value="ASC">Ascending</option>
																					<option value="DESC" selected="selected">Descending</option>
																				<?php } ?>
																			</select>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="oca-entry"><?php echo $entry_price_range; ?></div>
													<div class="oca-input" align="center">
														<table class="oca-table-noborder">
															<thead>
																<tr>
																	<td class="center"><?php echo $text_min; ?></td>
																	<td class="center"><?php echo $text_max; ?></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][price_min]" value="<?php echo $data['price_min']; ?>" size="5" /></td>
																	<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][price_max]" value="<?php echo $data['price_max']; ?>" size="5" /></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="oca-entry"><?php echo $entry_quantity; ?></div>
													<div class="oca-input">
														<input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][quantity]" value="<?php echo $data['quantity']; ?>" size="5" />
													</div>
													<div class="oca-entry"><?php echo $entry_limit; ?></div>
													<div class="oca-input">
														<input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][limit]" value="<?php echo $data['limit']; ?>" size="5" />
													</div>
													<div class="oca-entry"><?php echo $entry_shuffle; ?></div>
													<div class="oca-input">
														<?php if (isset($data['shuffle']) && $data['shuffle']) { ?>
															<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][shuffle]" value="1" checked="checked" />
														<?php } else { ?>
															<input type="checkbox" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][shuffle]" value="1" />
														<?php } ?>
													</div>
												</td>
												<td class="center" style="vertical-align:top;">
													<div class="oca-entry"><?php echo $entry_visible; ?></div>
													<div class="oca-input" align="center">
														<table class="oca-table-noborder">
															<thead>
																<tr>
																	<td class="left"></td>
																	<td class="center"><?php echo $text_on; ?></td>
																	<td class="center"><?php echo $text_off; ?></td>
																</tr>
															</thead>
															<tbody>
																<?php foreach ($visibilities as $visible) { ?>
																	<tr>
																		<td class="left"><?php echo $visible['name']; ?></td>
																		<?php if ($data['visibility_' . $visible['id']]) { ?>
																			<td class="center"><input type="radio" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][visibility_<?php echo $visible['id']; ?>]" value="1" checked="checked" /></td>
																			<td class="center"><input type="radio" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][visibility_<?php echo $visible['id']; ?>]" value="0" /></td>
																		<?php } else { ?>
																			<td class="center"><input type="radio" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][visibility_<?php echo $visible['id']; ?>]" value="1" /></td>
																			<td class="center"><input type="radio" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][visibility_<?php echo $visible['id']; ?>]" value="0" checked="checked" /></td>
																		<?php } ?>
																	</tr>
																<?php } ?>
															</tbody>
														</table>
													</div>
													<div class="oca-entry"><?php echo $entry_image; ?></div>
													<div class="oca-input" align="center">
														<table class="oca-table-noborder">
															<thead>
																<tr>
																	<td class="center"><?php echo $text_width; ?></td>
																	<td class="center"><?php echo $text_height; ?></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $data['image_width']; ?>" size="5" /></td>
																	<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $data['image_height']; ?>" size="5" /></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="oca-entry"><?php echo $entry_description; ?></div>
													<div class="oca-input">
														<input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][description]" value="<?php echo $data['description']; ?>" size="5" />
													</div>
													<div class="oca-entry"><?php echo $entry_display_type; ?></div>
													<div class="oca-input" align="center">
														<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][display_type]" onchange="toggleDisplay(<?php echo $module_row; ?>, $(this).val())">
															<?php foreach ($display_types as $display_type) { ?>
																<?php if ($display_type['id'] == $data['display_type']) { ?>
																	<option value="<?php echo $display_type['id']; ?>" selected="selected"><?php echo $display_type['name']; ?></option>
																<?php } else { ?>
																	<option value="<?php echo $display_type['id']; ?>"><?php echo $display_type['name']; ?></option>
																<?php } ?>
															<?php } ?>
														</select>
													</div>
													<div id="oca-carousel<?php echo $module_row; ?>" <?php if ($data['display_type'] !== '2') { echo 'style="display: none;"'; } ?>>
														<div class="oca-entry"><?php echo $text_carousel_settings; ?></div>
														<div class="oca-input" align="center">
															<table class="oca-table-noborder">
																<thead>
																	<tr>
																		<td class="center"><?php echo $entry_carousel_visible; ?></td>
																		<td class="center"><?php echo $entry_carousel_scroll; ?></td>
																		<td class="center"><?php echo $entry_carousel_auto_scroll; ?></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][carousel_visible]" value="<?php echo $data['carousel_visible']; ?>" size="5" /></td>
																		<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][carousel_scroll]" value="<?php echo $data['carousel_scroll']; ?>" size="5" /></td>
																		<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][carousel_auto_scroll]" value="<?php echo $data['carousel_auto_scroll']; ?>" size="5" /></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="oca-entry"><?php echo $entry_carousel_wrap; ?></div>
														<div class="oca-input" align="center">
															<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][carousel_wrap]">
																<?php foreach ($carousel_wraps as $wrap) { ?>
																	<?php if ($wrap == $data['carousel_wrap']) { ?>
																		<option value="<?php echo $wrap; ?>" selected="selected"><?php echo $wrap; ?></option>
																	<?php } else { ?>
																		<option value="<?php echo $wrap; ?>"><?php echo $wrap; ?></option>
																	<?php } ?>
																<?php } ?>
															</select>
														</div>
														<div class="oca-entry"><?php echo $entry_carousel_size; ?></div>
														<div class="oca-input" align="center">
															<table class="oca-table-noborder">
																<thead>
																	<tr>
																		<td class="center"><?php echo $text_width; ?></td>
																		<td class="center"><?php echo $text_height; ?></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][carousel_width]" value="<?php echo $data['carousel_width']; ?>" size="5" /></td>
																		<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][carousel_height]" value="<?php echo $data['carousel_height']; ?>" size="5" /></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div id="oca-slideshow<?php echo $module_row; ?>" <?php if ($data['display_type'] !== '3') { echo 'style="display: none;"'; } ?>>
														<div class="oca-entry"><?php echo $text_slideshow_settings; ?></div>
														<div class="oca-input" align="center">
															<table class="oca-table-noborder">
																<thead>
																	<tr>
																		<td class="center"><?php echo $entry_slideshow_effect; ?></td>
																		<td class="center"><?php echo $entry_slideshow_speed; ?></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="center">
																			<select name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][slideshow_effect]">
																				<?php foreach ($slideshow_effects as $slideshow_effect) { ?>
																					<?php if ($slideshow_effect == $data['slideshow_effect']) { ?>
																						<option value="<?php echo $slideshow_effect; ?>" selected="selected"><?php echo $slideshow_effect; ?></option>
																					<?php } else { ?>
																						<option value="<?php echo $slideshow_effect; ?>"><?php echo $slideshow_effect; ?></option>
																					<?php } ?>
																				<?php } ?>
																			</select>
																		</td>
																		<td class="center"><input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][slideshow_speed]" value="<?php echo $data['slideshow_speed']; ?>" size="5" /></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="oca-entry"><?php echo $entry_slideshow_height; ?></div>
														<div class="oca-input">
															<input type="text" name="<?php echo $extension; ?>_module[<?php echo $module_row; ?>][slideshow_height]" value="<?php echo $data['slideshow_height']; ?>" size="5" />
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<?php $module_row++; ?>
						<?php } ?>
					<?php } ?>
					<div id="oca-foot" class="oca-module">
						<div class="oca-footer">
							<div class="buttons"><a onclick="$('#form').attr('action', '<?php echo $action; ?>&apply=true'); $('#form').submit();" class="button"><span><?php echo $button_apply; ?></span></a> <a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></div>
						</div>
					</div>
				</form>
				<center><?php echo $text_contact; ?></center>
			</div>
		</div>
	</div>
<?php if ($ocversion >= 150) { ?>
	</div>
<?php } ?>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	html  = '<div id="module-row'+ module_row +'" class="oca-rate">';
	html += '	<div class="oca-head"><?php echo $text_module; ?> '+ module_row +' <div class="oca-remove"><a onclick="if (confirm(\'<?php echo $text_confirm_delete; ?>\')) { $(\'#module-row'+ module_row +'\').remove(); }"><img src="view/image/oca_remove.png" alt="<?php echo $button_remove_module; ?>" /></a></div></div>';
	html += '	<div class="oca-content">';
	html += '		<table class="oca-table">';
	html += '			<thead>';
	html += '				<tr>';
	html += '					<td class="left" colspan="4" style="border-bottom: 1px solid #DDDDDD;"><?php echo $entry_module_description; ?> <input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][module_name]" value="<?php echo $text_module; ?> '+ module_row +'" size="115" /></td>';
	html += '				</tr>';
	html += '				<tr>';
	html += '					<td class="center" width="25%"><?php echo $text_general_settings; ?></td>';
	html += '					<td class="center" width="25%"><?php echo $text_layout_settings; ?></td>';
	html += '					<td class="center" width="25%"><?php echo $text_product_settings; ?></td>';
	html += '					<td class="center" width="25%"><?php echo $text_display_settings; ?></td>';
	html += '				</tr>';
	html += '			</thead>';
	html += '			<tbody>';
	html += '				<tr>';
	html += '					<td class="center" style="vertical-align:top;">';
	html += '						<div class="oca-entry"><?php echo $entry_status; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<select name="<?php echo $extension; ?>_module['+ module_row +'][status]">';
	html += '								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '								<option value="0"><?php echo $text_disabled; ?></option>';
	html += '							</select>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_cache; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<select name="<?php echo $extension; ?>_module['+ module_row +'][cache]">';
	html += '								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '								<option value="0"><?php echo $text_disabled; ?></option>';
	html += '							</select>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_header; ?></div>';
	html += '						<div class="oca-input">';
										<?php foreach ($languages as $language) { ?>
	html += '								<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo str_replace("'", "&#39;", $language['name']); ?>" /> <input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][header][<?php echo $language['code']; ?>]" value="Advanced Product Display" size="25" /><br />';
										<?php } ?>
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_sort_order; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][sort_order]" value="" size="5" />';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_stores; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<div class="scrollbox" style="width:100%; text-align:left;">';
											<?php $class = 'odd'; ?>
	html += '								<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][stores][]" value="0" checked="checked" /><?php echo str_replace("'", "&#39;", $this->config->get('config_name')); ?></div>';
											<?php foreach ($stores as $store) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
	html += '									<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][stores][]" value="<?php echo $store['store_id']; ?>" checked="checked" /><?php echo str_replace("'", "&#39;", $store['name']); ?></div>';
											<?php } ?>
	html += '							</div>';
	html += '							<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_customer_groups; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<div class="scrollbox" style="width:100%; text-align:left;">';
											<?php $class = 'even'; ?>
	html += '								<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][customer_groups][]" value="0" checked="checked" /><i><?php echo $text_guest_checkout; ?></i></div>';
											<?php foreach ($customer_groups as $customer_group) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
	html += '									<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][customer_groups][]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" /><?php echo str_replace("'", "&#39;", $customer_group['name']); ?></div>';
											<?php } ?>
	html += '							</div>';
	html += '							<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
	html += '						</div>';
	html += '					</td>';
	html += '					<td class="center" style="vertical-align:top;">';
	html += '						<div class="oca-entry"><?php echo $entry_categories; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<div class="scrollbox" style="width:100%; text-align:left;">';		
											<?php $class = 'even'; ?>
	html += '								<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][categories][]" value="0" checked="checked" /><i><?php echo $text_all_categories; ?></i></div>';
											<?php foreach ($categories as $category) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
	html += '									<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][categories][]" value="<?php echo $category['category_id']; ?>" /><?php echo str_replace("'", "&#39;", $category['name']); ?></div>';
											<?php } ?>
	html += '							</div>';
	html += '							<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_layout; ?></div>';
	html += '						<div class="oca-input" align="center">';
	html += '		 					<div style="<?php if (!$vqmod) { echo 'display: none;'; } ?>">';
	html += '		  						<div class="scrollbox" style="width:100%; text-align:left;">';		
												<?php $class = 'even'; ?>
	html += '		   							<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][layouts][]" value="0" checked="checked" /><i><?php echo $text_all_layouts; ?></i></div>';
												<?php foreach ($layouts as $layout) { ?>
													<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
	html += '		    							<div class="<?php echo $class; ?>"><input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][layouts][]" value="<?php echo $layout['layout_id']; ?>" /><?php echo str_replace("'", "&#39;", $layout['name']); ?></div>';
												<?php } ?>
	html += '		  						</div>';
	html += '		  						<a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').attr(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
	html += '		 					</div>';
	html += '		 					<div style="<?php if ($vqmod) { echo 'display: none;'; } ?>">';
	html += '		  						<select name="<?php echo $extension; ?>_module['+ module_row +'][layout_id]">';
												<?php foreach ($layouts as $layout) { ?>
	html += '		    							<option value="<?php echo $layout['layout_id']; ?>"><?php echo str_replace("'", "&#39;", $layout['name']); ?></option>';
												<?php } ?>
	html += '		  						</select>';
	html += '		 					</div>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_position; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<select name="<?php echo $extension; ?>_module['+ module_row +'][position]">';
											<?php foreach ($positions as $position) { ?>
	html += '									<option value="<?php echo $position['id']; ?>"><?php echo $position['name']; ?></option>';
											<?php } ?>
	html += '							</select>';
	html += '						</div>';
	html += '					</td>';
	html += '					<td class="center" style="vertical-align:top;">';
	html += '						<div class="oca-entry"><?php echo $entry_module_type; ?></div>';
	html += '						<div class="oca-input" align="center">';
	html += '							<select name="<?php echo $extension; ?>_module['+ module_row +'][module_type]" onchange="toggleModule('+ module_row +', $(this).val())">';
											<?php foreach ($module_types as $module_type) { ?>
	html += '									<option value="<?php echo $module_type['id']; ?>"><?php echo str_replace("'", "&#39;", $module_type['name']); ?></option>';
											<?php } ?>
	html += '							</select>';
	html += '						</div>';
	html += '						<div id="oca-featured'+ module_row +'">';
	html += '							<div class="oca-entry"><?php echo $entry_featured_products; ?></div>';
	html += '							<div class="oca-input" align="center">';
	html += '								<input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][featured][input]" value="" /><br/>';
	html += '								<div id="featured-product-'+ module_row +'" class="scrollbox" style="width: 100%; text-align: left;"></div>';
	html += '								<input type="hidden" name="<?php echo $extension; ?>_module['+ module_row +'][featured_products]" value="" />';
	html += '							</div>';											
	html += '						</div>';
	html += '						<div id="oca-custom'+ module_row +'" style="display: none;">';
	html += '							<div class="oca-entry"><?php echo $text_custom_settings; ?></div>';
	html += '							<div class="oca-input" align="center">';
	html += '								<table class="oca-table-noborder">';
	html += '									<thead>';
	html += '										<tr>';
	html += '											<td class="center"><?php echo $entry_sort; ?></td>';
	html += '											<td class="center"><?php echo $entry_order; ?></td>';
	html += '										</tr>';
	html += '									</thead>';
	html += '									<tbody>';
	html += '										<tr>';
	html += '											<td class="center">';
	html += '												<select name="<?php echo $extension; ?>_module['+ module_row +'][sort]">';
																<?php foreach ($sort_data as $sort) { ?>
	html += '														<option value="<?php echo $sort; ?>"><?php echo $sort; ?></option>';
																<?php } ?>
	html += '												</select>';
	html += '											</td>';
	html += '											<td class="center">';
	html += '												<select name="<?php echo $extension; ?>_module['+ module_row +'][order]">';
	html += '													<option value="ASC" selected="selected">Ascending</option>';
	html += '													<option value="DESC">Descending</option>';
	html += '												</select>';
	html += '											</td>';
	html += '										</tr>';
	html += '									</tbody>';
	html += '								</table>';
	html += '							</div>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_price_range; ?></div>';
	html += '						<div class="oca-input" align="center">';
	html += '							<table class="oca-table-noborder">';
	html += '								<thead>';
	html += '									<tr>';
	html += '										<td class="center"><?php echo $text_min; ?></td>';
	html += '										<td class="center"><?php echo $text_max; ?></td>';
	html += '									</tr>';
	html += '								</thead>';
	html += '								<tbody>';
	html += '									<tr>';
	html += '										<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][price_min]" value="" size="5" /></td>';
	html += '										<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][price_max]" value="" size="5" /></td>';
	html += '									</tr>';
	html += '								</tbody>';
	html += '							</table>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_quantity; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][quantity]" value="" size="5" />';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_limit; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][limit]" value="5" size="5" />';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_shuffle; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<input type="checkbox" name="<?php echo $extension; ?>_module['+ module_row +'][shuffle]" value="1" />';
	html += '						</div>';
	html += '					</td>';
	html += '					<td class="center" style="vertical-align:top;">';
	html += '						<div class="oca-entry"><?php echo $entry_visible; ?></div>';
	html += '						<div class="oca-input" align="center">';
	html += '							<table class="oca-table-noborder">';
	html += '								<thead>';
	html += '									<tr>';
	html += '										<td class="left"></td>';
	html += '										<td class="center"><?php echo $text_on; ?></td>';
	html += '										<td class="center"><?php echo $text_off; ?></td>';
	html += '									</tr>';
	html += '								</thead>';
	html += '								<tbody>';
												<?php foreach ($visibilities as $visible) { ?>
	html += '										<tr>';
	html += '											<td class="left"><?php echo $visible['name']; ?></td>';
	html += '											<td class="center"><input type="radio" name="<?php echo $extension; ?>_module['+ module_row +'][visibility_<?php echo $visible['id']; ?>]" value="1" checked="checked" /></td>';
	html += '											<td class="center"><input type="radio" name="<?php echo $extension; ?>_module['+ module_row +'][visibility_<?php echo $visible['id']; ?>]" value="0" /></td>';
	html += '										</tr>';
												<?php } ?>
	html += '								</tbody>';
	html += '							</table>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_image; ?></div>';
	html += '						<div class="oca-input" align="center">';
	html += '							<table class="oca-table-noborder">';
	html += '								<thead>';
	html += '									<tr>';
	html += '										<td class="center"><?php echo $text_width; ?></td>';
	html += '										<td class="center"><?php echo $text_height; ?></td>';
	html += '									</tr>';
	html += '								</thead>';
	html += '								<tbody>';
	html += '									<tr>';
	html += '										<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][image_width]" value="80" size="5" /></td>';
	html += '										<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][image_height]" value="80" size="5" /></td>';
	html += '									</tr>';
	html += '								</tbody>';
	html += '							</table>';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_description; ?></div>';
	html += '						<div class="oca-input">';
	html += '							<input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][description]" value="200" size="5" />';
	html += '						</div>';
	html += '						<div class="oca-entry"><?php echo $entry_display_type; ?></div>';
	html += '						<div class="oca-input" align="center">';
	html += '							<select name="<?php echo $extension; ?>_module['+ module_row +'][display_type]" onchange="toggleDisplay('+ module_row +', $(this).val())">';
											<?php foreach ($display_types as $display_type) { ?>
	html += '									<option value="<?php echo $display_type['id']; ?>"><?php echo str_replace("'", "&#39;", $display_type['name']); ?></option>';
											<?php } ?>
	html += '							</select>';
	html += '						</div>';
	html += '						<div id="oca-carousel'+ module_row +'" style="display: none;">';
	html += '							<div class="oca-entry"><?php echo $text_carousel_settings; ?></div>';
	html += '							<div class="oca-input" align="center">';
	html += '								<table class="oca-table-noborder">';
	html += '									<thead>';
	html += '										<tr>';
	html += '											<td class="center"><?php echo $entry_carousel_visible; ?></td>';
	html += '											<td class="center"><?php echo $entry_carousel_scroll; ?></td>';
	html += '											<td class="center"><?php echo $entry_carousel_auto_scroll; ?></td>';
	html += '										</tr>';
	html += '									</thead>';
	html += '									<tbody>';
	html += '										<tr>';
	html += '											<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][carousel_visible]" value="5" size="5" /></td>';
	html += '											<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][carousel_scroll]" value="5" size="5" /></td>';
	html += '											<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][carousel_auto_scroll]" value="5" size="5" /></td>';
	html += '										</tr>';
	html += '									</tbody>';
	html += '								</table>';
	html += '							</div>';
	html += '							<div class="oca-entry"><?php echo $entry_carousel_wrap; ?></div>';
	html += '							<div class="oca-input" align="center">';
	html += '								<select name="<?php echo $extension; ?>_module['+ module_row +'][carousel_wrap]">';
												<?php foreach ($carousel_wraps as $wrap) { ?>
	html += '										<option value="<?php echo $wrap; ?>"><?php echo $wrap; ?></option>';
												<?php } ?>
	html += '								</select>';
	html += '							</div>';
	html += '							<div class="oca-entry"><?php echo $entry_carousel_size; ?></div>';
	html += '							<div class="oca-input" align="center">';
	html += '								<table class="oca-table-noborder">';
	html += '									<thead>';
	html += '										<tr>';
	html += '											<td class="center"><?php echo $text_width; ?></td>';
	html += '											<td class="center"><?php echo $text_height; ?></td>';
	html += '										</tr>';
	html += '									</thead>';
	html += '									<tbody>';
	html += '										<tr>';
	html += '											<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][carousel_width]" value="880px" size="5" /></td>';
	html += '											<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][carousel_height]" value="200px" size="5" /></td>';
	html += '										</tr>';
	html += '									</tbody>';
	html += '								</table>';
	html += '							</div>';
	html += '						</div>';
	html += '						<div id="oca-slideshow'+ module_row +'" style="display: none;">';
	html += '							<div class="oca-entry"><?php echo $text_slideshow_settings; ?></div>';
	html += '							<div class="oca-input" align="center">';
	html += '								<table class="oca-table-noborder">';
	html += '									<thead>';
	html += '										<tr>';
	html += '											<td class="center"><?php echo $entry_slideshow_effect; ?></td>';
	html += '											<td class="center"><?php echo $entry_slideshow_speed; ?></td>';
	html += '										</tr>';
	html += '									</thead>';
	html += '									<tbody>';
	html += '										<tr>';
	html += '											<td class="center">';
	html += '												<select name="<?php echo $extension; ?>_module['+ module_row +'][slideshow_effect]">';
																<?php foreach ($slideshow_effects as $slideshow_effect) { ?>
	html += '														<option value="<?php echo $slideshow_effect; ?>"><?php echo str_replace("'", "&#39;", $slideshow_effect); ?></option>';
																<?php } ?>
	html += '												</select>';
	html += '											</td>';
	html += '											<td class="center"><input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][slideshow_speed]" value="5" size="5" /></td>';
	html += '										</tr>';
	html += '									</tbody>';
	html += '								</table>';
	html += '							</div>';
	html += '							<div class="oca-entry"><?php echo $entry_slideshow_height; ?></div>';
	html += '							<div class="oca-input">';
	html += '								<input type="text" name="<?php echo $extension; ?>_module['+ module_row +'][slideshow_height]" value="200px" size="5" />';
	html += '							</div>';
	html += '						</div>';
	html += '					</td>';
	html += '				</tr>';
	html += '			</tbody>';
	html += '		</table>';
	html += '	</div>';
	html += '</div>';
	
	$('#oca-foot').before(html);
	
	featuredautocomplete(module_row);
	
	module_row++;
}

function featuredautocomplete(module_row) {
	$('input[name=\'<?php echo $extension; ?>_module[' + module_row + '][featured][input]\']').autocomplete({
		delay: 0,
		source: function(request, response) {
			<?php if ($ocversion == 1513 || $ocversion >= 152) { ?>
				$.ajax({
					url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
					dataType: 'json',
					success: function(data) {		
						response($.map(data, function(item) {
							return {
								label: item.name,
								value: item.product_id
							}
						}));
					}
				});
			<?php } else { ?>
				$.ajax({
					url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>',
					type: 'POST',
					dataType: 'json',
					data: 'filter_name=' +  encodeURIComponent(request.term),
					success: function(data) {		
						response($.map(data, function(item) {
							return {
								label: item.name,
								value: item.product_id
							}
						}));
					}
				});
			<?php } ?>	
		}, 
		select: function(event, ui) {
			$('#featured-product-' + module_row + '' + ui.item.value).remove();
			
			$('#featured-product-' + module_row + '').append('<div id="featured-product-' + module_row + '' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');

			$('#featured-product-' + module_row + ' div:even').attr('class', 'even');
			$('#featured-product-' + module_row + ' div:odd').attr('class', 'odd');
			
			data = $.map($('#featured-product-' + module_row + ' input'), function(element){
				return $(element).attr('value');
			});
							
			$('input[name=\'<?php echo $extension; ?>_module[' + module_row + '][featured_products]\']').attr('value', data.join());
						
			return false;
		}
	});

	$('#featured-product-' + module_row + ' div img').live('click', function() {
		$(this).parent().remove();
		
		$('#featured-product-' + module_row + ' div:even').attr('class', 'even');		
		$('#featured-product-' + module_row + ' div:odd').attr('class', 'odd');

		data = $.map($('#featured-product-' + module_row + ' input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'<?php echo $extension; ?>_module[' + module_row + '][featured_products]\']').attr('value', data.join());	
	});
}
//--></script>

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery(".oca-content").hide();
		jQuery(".oca-head").click(function() {
			jQuery(this).next(".oca-content").slideToggle(500);
		});
	});
</script>

<script type="text/javascript">
	function toggleModule(row, value) {
		if (value == 8) {
			$('#oca-custom'+ row).fadeIn('slow');
		} else {
			$('#oca-custom'+ row).hide();
		}
		if (value == 0) {
			$('#oca-featured'+ row).fadeIn('slow');
		} else {
			$('#oca-featured'+ row).hide();
		}
	}
	
	function toggleDisplay(row, value) {
		if (value == 2) {
			$('#oca-carousel'+ row).fadeIn('slow');
		} else {
			$('#oca-carousel'+ row).hide();
		}
		if (value == 3) {
			$('#oca-slideshow'+ row).fadeIn('slow');
		} else {
			$('#oca-slideshow'+ row).hide();
		}
	}
</script>

<script type="text/javascript"><!--
	<?php if ($ocversion >= 150) { ?>
		$('#help a').tabs();
	<?php } else { ?>
		$.tabs('#help a'); 
	<?php } ?>
//--></script> 

<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php if (!empty(${$extension . '_module'})) { ?>
	<?php foreach (${$extension . '_module'} as $data) { ?>

		$('input[name=\'<?php echo $extension; ?>_module[<?php echo $module_row; ?>][featured][input]\']').autocomplete({
			delay: 0,
			source: function(request, response) {
				<?php if ($ocversion == 1513 || $ocversion >= 152) { ?>
					$.ajax({
						url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
						dataType: 'json',
						success: function(data) {		
							response($.map(data, function(item) {
								return {
									label: item.name,
									value: item.product_id
								}
							}));
						}
					});
				<?php } else { ?>
					$.ajax({
						url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>',
						type: 'POST',
						dataType: 'json',
						data: 'filter_name=' +  encodeURIComponent(request.term),
						success: function(data) {		
							response($.map(data, function(item) {
								return {
									label: item.name,
									value: item.product_id
								}
							}));
						}
					});
				<?php } ?>
			}, 
			select: function(event, ui) {
				$('#featured-product-<?php echo $module_row; ?>' + ui.item.value).remove();
				
				$('#featured-product-<?php echo $module_row; ?>').append('<div id="featured-product-<?php echo $module_row; ?>' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');

				$('#featured-product-<?php echo $module_row; ?> div:even').attr('class', 'even');			
				$('#featured-product-<?php echo $module_row; ?> div:odd').attr('class', 'odd');
				
				data = $.map($('#featured-product-<?php echo $module_row; ?> input'), function(element){
					return $(element).attr('value');
				});
								
				$('input[name=\'<?php echo $extension; ?>_module[<?php echo $module_row; ?>][featured_products]\']').attr('value', data.join());
							
				return false;
			}
		});

		$('#featured-product-<?php echo $module_row; ?> div img').live('click', function() {
			$(this).parent().remove();
			
			$('#featured-product-<?php echo $module_row; ?> div:even').attr('class', 'even');
			$('#featured-product-<?php echo $module_row; ?> div:odd').attr('class', 'odd');

			data = $.map($('#featured-product-<?php echo $module_row; ?> input'), function(element){
				return $(element).attr('value');
			});
							
			$('input[name=\'<?php echo $extension; ?>_module[<?php echo $module_row; ?>][featured_products]\']').attr('value', data.join());	
		});
		<?php $module_row++; ?>
		
	<?php } ?>
<?php } ?>
//--></script> 

<?php echo $footer; ?> 