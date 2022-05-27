<?php
      //===========================================//
     // Advanced Product Display                  //
    // Author: Joel Reeds                        //
   // Company: OpenCart Addons                  //
  // Website: http://opencartaddons.com        //
 // Contact: webmaster@opencartaddons.com     //
//===========================================//

class ControllerModuleOCAAPD extends Controller {
	private $extension 		= 'ocaapd';
	private $extensionType 	= 'module';
	
	private function getVersion() {
		if (defined('VERSION') && VERSION < 1.5) {
			$oc = 140;
		} elseif (defined('VERSION') && strpos(VERSION, '1.5.0') === 0) {
			$oc = 150;
		} elseif (defined('VERSION') && strpos(VERSION, '1.5.1') === 0) {
			$oc = 151;
		} else {
			$oc = '';
		}
		if (defined('VERSION') && VERSION >= 1.5 && !$oc) {
			$oc = 152;
		}
		return $oc;
	}
	
	protected function index($setting) {
		static $module = 0;
		
		if ($setting['status']) {
		
			$status = true;
			
			$product_data = array();
			
			$this->data['products'] = array();
			
			$this->data = array_merge($this->data, $this->load->language($this->extensionType . '/' . $this->extension));		
			$this->load->model('catalog/category');		
			$this->load->model('catalog/product');		
			$this->load->model('tool/image');
		
			if ($this->customer->isLogged()) {
				$customer_group_id = $this->customer->getCustomerGroupId();
			} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}
			
			$this->load->model('localisation/language');
			$config_language = $this->config->get('config_language');
			
			$language_code = isset($this->session->data['language']) ? $this->session->data['language'] : $config_language;
			
			if (isset($this->request->get['path'])) {
				$path = '';
				$parts = explode('_', (string)$this->request->get['path']);
				$category_id = array_pop($parts);
			} else {
				$category_id = 0;
			}
			
			if (isset($this->request->get['product_id'])) {
				$product_id = $this->request->get['product_id'];
			} else {
				$product_id = 0;
			}
			
			if (isset($this->request->get['information_id'])) {
				$information_id = $this->request->get['information_id'];
			} else {
				$information_id = 0;
			}
			
			$stores = isset($setting['stores']) ? $setting['stores'] : array();
			$customer_groups = isset($setting['customer_groups']) ? $setting['customer_groups'] : array();
			$languages = isset($setting['languages']) ? $setting['languages'] : array();
			$categories = isset($setting['categories']) ? $setting['categories'] : array();
			
			if (!in_array($this->config->get('config_store_id'), $stores)) {
				$status = false;
			}
			
			if (!in_array($customer_group_id, $customer_groups)) {
				$status = false;
			}
			
			if ($categories && !in_array(0, $categories)) {
				if ($product_id) {
					$product_categories = $this->model_catalog_product->getCategories($product_id);
					$cat_status = false;
					foreach ($product_categories as $product_category) {
						if (in_array($product_category['category_id'], $categories)) {
							$cat_status = true;
							break;
						}
					}
					if (!$cat_status) {
						$status = false;
					}
				} elseif ($category_id && !in_array($category_id, $categories)) {
					$status = false;
				}
			}
			
			if ($status) {
			
				$this->data['heading_title'] 	= !empty($setting['header'][$language_code]) ? $setting['header'][$language_code] : $this->data['heading_title'];
				
				if ($categories && in_array(0, $categories)) {
					$categories = false;
				}
				
				if ($product_id) {
					$product_info = $this->model_catalog_product->getProduct($product_id);
				} else {
					$product_info = '';
				}
				
				if ($product_info && $setting['price_max'] && strpos($setting['price_max'], '%')) {
					$price_max = $product_info['price'] * ($setting['price_max'] / 100);
				} else {
					$price_max = $setting['price_max'];
				}
				
				if ($product_info && $setting['price_min'] && strpos($setting['price_min'], '%')) {
					$price_min = $product_info['price'] * ($setting['price_min'] / 100);
				} else {
					$price_min = $setting['price_min'];
				}
				
				$module_types = array(2, 4, 7, 8);
				if (in_array($setting['module_type'], $module_types)) {
				
					$cache = $this->extension . '.' . $module . '.' . $setting['module_type'] . '.' . $this->config->get('config_store_id') . '.' . $customer_group_id . '.' . $category_id . '.' . $product_id . '.' . $information_id;
			
					$product_data = $this->cache->get($cache);
		
					if (!$product_data || !$setting['cache']) {
				
						$sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";
					
						if ($categories) {
							$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
						}
						
						$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
						
						if ($setting['module_type'] == 7) {
							$sql .= " AND p.date_available > NOW()";
						} else {
							$sql .= " AND p.date_available <= NOW()";
						}
						
						if ($setting['quantity']) {
							$sql .= " AND p.quantity >= '" . (int)$setting['quantity'] . "'";
						}
					
						if ($categories) {
							$sql .= " AND (";
							$x = 1;
							foreach ($categories as $category) {
								if ($x > 1) {
									$sql .= " OR p2c.category_id = '" . (int)$category . "'";
								} else {
									$sql .= "p2c.category_id = '" . (int)$category . "'";
								}
								$x++;
							}
							$sql .= ")";
						}
						
						if ($price_min) {
							$sql .= " AND p.price >= '" . (float)$price_min . "'";
						}
						
						if ($price_max) {
							$sql .= " AND p.price <= '" . (float)$price_max . "'";
						}
						
						if ($product_id) {
							$sql .= " AND p.product_id <> '" . (int)$product_id . "'";
						}
						
						$sql .= " GROUP BY p.product_id";
						
						if ($setting['module_type'] == 2) {
							$sql .= " ORDER BY p.date_added DESC";
						} elseif ($setting['module_type'] == 4) {
							$sql .= " ORDER BY p.viewed DESC";
						} elseif ($setting['module_type'] == 7) {
							$sql .= " ORDER BY p.sort_order ASC";
						} elseif ($setting['module_type'] == 8) {
							if ($setting['sort'] == 'random') {
								$sql .= " ORDER BY RAND()";
							} else {
								$sql .= " ORDER BY " . $this->db->escape($setting['sort']) . " " . $this->db->escape($setting['order']);	
							}
						}
						
						if ($setting['limit']) {
							$sql .= " LIMIT " . (int)$setting['limit'];
						} else {
							$sql .= " LIMIT 5";
						}
						
						$product_data = array();
					
						$query = $this->db->query($sql);
		
						foreach ($query->rows as $result) {
							$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
						}
			
						if ($setting['cache']) {
							$this->cache->set($cache, $product_data);
						}
						
					}
					
				} else {
					
					if ($setting['module_type'] == 0) {
					
						$cache = $this->extension . '.' . $module . '.' . $setting['module_type'] . '.' . $this->config->get('config_store_id') . '.' . $customer_group_id . '.' . $category_id . '.' . $product_id . '.' . $information_id;
			
						$product_data = $this->cache->get($cache);
			
						if (!$product_data || !$setting['cache']) {
						
							$product_data = array();
						
							$products = explode(',', $setting['featured_products']);
							foreach ($products as $product_id) {
								$product_data[$product_id] = $this->model_catalog_product->getProduct($product_id);
							}
							
							if ($setting['cache']) {
								$this->cache->set($cache, $product_data);
							}
							
						}
					
					} elseif ($setting['module_type'] == 1) {
					
						$cache = $this->extension . '.' . $module . '.' . $setting['module_type'] . '.' . $this->config->get('config_store_id') . '.' . $customer_group_id . '.' . $category_id . '.' . $product_id . '.' . $information_id;
			
						$product_data = $this->cache->get($cache);
	
						if (!$product_data || !$setting['cache']) { 
							
							$sql = "SELECT op.product_id, COUNT(*) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";
							
							if ($categories) {
								$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
							}
							
							$sql .= " WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
							
							if ($categories) {
								$sql .= " AND (";
								$x = 1;
								foreach ($categories as $category) {
									if ($x > 1) {
										$sql .= " OR p2c.category_id = '" . (int)$category . "'";
									} else {
										$sql .= "p2c.category_id = '" . (int)$category . "'";
									}
									$x++;
								}
								$sql .= ")";
							}
							
							if ($price_min) {
								$sql .= " AND p.price >= '" . (float)$price_min . "'";
							}
							
							if ($price_max) {
								$sql .= " AND p.price <= '" . (float)$price_max . "'";
							}
							
							if ($product_id) {
								$sql .= " AND p.product_id <> '" . (int)$product_id . "'";
							}
							
							$sql .= " GROUP BY op.product_id ORDER BY total DESC";
							
							if ($setting['limit']) {
								$sql .= " LIMIT " . (int)$setting['limit'];
							} else {
								$sql .= " LIMIT 5";
							}
							
							$product_data = array();
					
							$query = $this->db->query($sql);
							
							foreach ($query->rows as $result) { 		
								$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
							}
							
							if ($setting['cache']) {
								$this->cache->set($cache, $product_data);
							}
							
						}
					
					} elseif ($setting['module_type'] == 3) {
					
						$cache = $this->extension . '.' . $module . '.' . $setting['module_type'] . '.' . $this->config->get('config_store_id') . '.' . $customer_group_id . '.' . $category_id . '.' . $product_id . '.' . $information_id;
			
						$product_data = $this->cache->get($cache);
	
						if (!$product_data || !$setting['cache']) { 
							
							$sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";
														
							if ($categories) {
								$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
							}
							
							$sql .= " WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))";
							
							if ($categories) {
								$sql .= " AND (";
								$x = 1;
								foreach ($categories as $category) {
									if ($x > 1) {
										$sql .= " OR p2c.category_id = '" . (int)$category . "'";
									} else {
										$sql .= "p2c.category_id = '" . (int)$category . "'";
									}
									$x++;
								}
								$sql .= ")";
							}
							
							if ($price_min) {
								$sql .= " AND p.price >= '" . (float)$price_min . "'";
							}
							
							if ($price_max) {
								$sql .= " AND p.price <= '" . (float)$price_max . "'";
							}
							
							if ($product_id) {
								$sql .= " AND p.product_id <> '" . (int)$product_id . "'";
							}
							
							$sql .= " GROUP BY ps.product_id ORDER BY p.sort_order ASC";
							
							if ($setting['limit']) {
								$sql .= " LIMIT " . (int)$setting['limit'];
							} else {
								$sql .= " LIMIT 5";
							}
							
							$product_data = array();
					
							$query = $this->db->query($sql);
							
							foreach ($query->rows as $result) { 		
								$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
							}
							
							$this->cache->set($cache, $product_data);
							
						}
						
					} elseif ($setting['module_type'] == 5 && $product_id) {
					
						$cache = $this->extension . '.' . $module . '.' . $setting['module_type'] . '.' . $this->config->get('config_store_id') . '.' . $customer_group_id . '.' . $category_id . '.' . $product_id . '.' . $information_id;
			
						$product_data = $this->cache->get($cache);
						
						if (!$product_data || !$setting['cache']) {
						
							$product_data = array();
					
							foreach ($this->model_catalog_product->getProductRelated($product_id) as $result) {
								$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
							}
							
							if ($setting['cache']) {
								$this->cache->set($cache, $product_data);
							}
							
						}
						
					} elseif ($setting['module_type'] == 6) {
					
						$cache = $this->extension . '.' . $module . '.' . $setting['module_type'] . '.' . $this->config->get('config_store_id') . '.' . $customer_group_id . '.' . $category_id . '.' . $product_id . '.' . $information_id;
			
						$product_data = $this->cache->get($cache);
	
						if (!$product_data || !$setting['cache']) { 
							
							$sql = "SELECT DISTINCT op.product_id FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)";
							
							if ($categories) {
								$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
							}
							
							$sql .= " WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
							
							if ($categories) {
								$sql .= " AND (";
								$x = 1;
								foreach ($categories as $category) {
									if ($x > 1) {
										$sql .= " OR p2c.category_id = '" . (int)$category . "'";
									} else {
										$sql .= "p2c.category_id = '" . (int)$category . "'";
									}
									$x++;
								}
								$sql .= ")";
							}
							
							if ($price_min) {
								$sql .= " AND p.price >= '" . (float)$price_min . "'";
							}
							
							if ($price_max) {
								$sql .= " AND p.price <= '" . (float)$price_max . "'";
							}
							
							if ($product_id) {
								$sql .= " AND p.product_id <> '" . (int)$product_id . "'";
							}
							
							$sql .= " GROUP BY op.product_id ORDER BY o.date_added DESC";
							
							if ($setting['limit']) {
								$sql .= " LIMIT " . (int)$setting['limit'];
							} else {
								$sql .= " LIMIT 5";
							}
							
							$product_data = array();
					
							$query = $this->db->query($sql);
							
							foreach ($query->rows as $result) { 		
								$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
							}
							
							if ($setting['cache']) {
								$this->cache->set($cache, $product_data);
							}
							
						}
						
					} else {
					
						$product_data = array();
						
					}
					
				}
				
				if (isset($setting['shuffle'])) {
					$product_data = $this->array_shuffle($product_data);
				}
				
				if ($setting['module_type'] == 0 || $setting['module_type'] == 5) {
					if ($setting['limit']) {
						$product_data = array_slice($product_data, 0, $setting['limit']);
					} else {
						$product_data = array_slice($product_data, 0, 5);
					}
				}
				
				foreach ($product_data as $product) {
					
					$desc_max = ($setting['description']) ? $setting['description'] : 200;
					$desc_end = (strlen($product['description']) > $desc_max) ? '...' : '';
					
					$this->data['products'][] = array(
						'product_id' 		=> $product['product_id'],
						'thumb'   	 		=> ($product['image'] && $setting['visibility_0']) ? $this->model_tool_image->resize($product['image'], $setting['image_width'], $setting['image_height']) : false,
						'name'    	 		=> ($setting['visibility_1']) ? $product['name'] : false,
						'model'    	 		=> ($setting['visibility_2']) ? $product['model'] : false,
						'manufacturer'    	=> ($setting['visibility_3']) ? $product['manufacturer'] : false,
						'rating'     		=> ($setting['visibility_4'] && $this->config->get('config_review_status')) ? $product['rating'] : false,
						'price'   	 		=> ($setting['visibility_5'] && (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price'))) ? $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))) : false,
						'special' 	 		=> ((float)$product['special']) ? $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax'))) : false,
						'cart'	 	 		=> ($setting['visibility_6']) ? true : false,
						'description'	 	=> ($setting['visibility_7']) ? substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, $desc_max) . $desc_end : false,
						'product_href'    	=> ($setting['module_type'] == 7) ? false : $this->url->link('product/product', 'product_id=' . $product['product_id']),
						'manufacturer_href' => ($setting['visibility_3']) ? $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product['manufacturer_id']) : false
					);
					
				}
				
			}
			
			$this->data['position'] = $setting['position'];
				
			if ($setting['display_type'] == 0) {
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '.tpl';
				} else {
					$this->template = 'default/template/' . $this->extensionType . '/' . $this->extension . '.tpl';
				}
				
			} elseif ($setting['display_type'] == 1) {
			
				$this->data['width'] 		= $setting['image_width'];
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/image/oca_button_small.png')) {
					$this->data['button'] = 'catalog/view/theme/' . $this->config->get('config_template') . '/image/oca_button_small.png';
				} else {
					$this->data['button'] = 'catalog/view/theme/default/image/oca_button_small.png';
				}
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '_list.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '_list.tpl';
				} else {
					$this->template = 'default/template/' . $this->extensionType . '/' . $this->extension . '_list.tpl';
				}
				
			} elseif ($setting['display_type'] == 2 && count(array_unique($product_data, SORT_REGULAR)) > $setting['carousel_visible']) {
			
				$this->data['visible'] 		= $setting['carousel_visible'];
				$this->data['scroll'] 		= $setting['carousel_scroll'];
				$this->data['auto_scroll'] 	= $setting['carousel_auto_scroll'];
				$this->data['wrap'] 		= $setting['carousel_wrap'];
				$this->data['width'] 		= $setting['carousel_width'];
				$this->data['height'] 		= $setting['carousel_height'];
				$this->data['image_width'] 	= $setting['image_width'];
				
				if ($setting['position'] == 'column_left' || $setting['position'] == 'column_right') {
					$this->data['vertical'] = '1';
				} else {
					$this->data['vertical'] = '0';
				}
				
				$this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');
				
				if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/' . $this->extension . '.css')) {
					$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/' . $this->extension . '.css'); 
				} else {
					$this->document->addStyle('catalog/view/theme/default/stylesheet/' . $this->extension . '.css'); 
				}
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '_carousel.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '_carousel.tpl';
				} else {
					$this->template = 'default/template/' . $this->extensionType . '/' . $this->extension . '_carousel.tpl';
				}
				
			} elseif ($setting['display_type'] == 3) {
			
				$this->data['effect'] 		= $setting['slideshow_effect'];
				$this->data['speed'] 		= $setting['slideshow_speed'] * 1000;
				$this->data['height'] 		= $setting['slideshow_height'];
			
				$this->document->addScript('catalog/view/javascript/jquery/jquery.' . $this->extension . '.js');
				
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '_slideshow.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '_slideshow.tpl';
				} else {
					$this->template = 'default/template/' . $this->extensionType . '/' . $this->extension . '_slideshow.tpl';
				}
				
			} else {
			
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/' . $this->extensionType . '/' . $this->extension . '.tpl';
				} else {
					$this->template = 'default/template/' . $this->extensionType . '/' . $this->extension . '.tpl';
				}
				
			}
				
			$this->data['extension'] 	= $this->extension;
			$this->data['version']		= $this->getVersion();
				
		}
		
		$this->data['module'] = $module++;
		
		$this->render();
		
	}
	
	function array_shuffle($array) {
		if (shuffle($array)) {
			return $array;
		} else {
			return false;
		}
	} 
}
?>