<?php
      //===========================================//
     // Advanced Product Display                  //
    // Author: Joel Reeds                        //
   // Company: OpenCart Addons                  //
  // Website: http://opencartaddons.com        //
 // Contact: webmaster@opencartaddons.com     //
//===========================================//

class ControllerModuleOCAAPD extends Controller { 
	private $error = array();
	private $version = '9.0';
	private $extension = 'ocaapd';	
	private $extensionType = 'module';
	
	private function getVersion() {
		if (defined('VERSION') && VERSION < 1.5) {
			$oc = 140;
		} elseif (defined('VERSION') && strpos(VERSION, '1.5.0') === 0) {
			$oc = 150;
		} elseif (defined('VERSION') && strpos(VERSION, '1.5.1.3') === 0) {
			$oc = 1513;
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
	
	public function index() { 
		
		$this->data['extension'] = $this->extension;
		$this->data['ocversion'] = $this->getVersion();
		
		$this->data = array_merge($this->data, $this->load->language($this->extensionType . '/' . $this->extension));
		$this->document->addStyle('view/stylesheet/oca_stylesheet.css');
		
		$this->data['text_contact'] = sprintf($this->data['text_contact'], $this->version);
			
		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$post_data = $this->request->post;
			if ($this->getVersion() <= 150) {
				foreach ($post_data as $key => $value) {
					if (is_array($value)) {
						$post_data[$key] = serialize($value);
					}
				}
			}
			$this->model_setting_setting->editSetting($this->extension, $post_data);

			$this->cache->delete($this->extension);

			if (isset($this->request->get['apply'])) {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->redirect($this->getLink($this->extensionType, $this->extension)); 
			} else {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->redirect($this->getLink('extension', $this->extensionType));
			}
		}
		
		$this->data['success'] = isset($this->session->data['success']) ? $this->session->data['success'] : '';
		unset($this->session->data['success']);
		$this->data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';

  		$breadcrumbs = array();

   		$breadcrumbs[] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->getLink('common', 'home'),
      		'separator' => false
   		);

   		$breadcrumbs[] = array(
       		'text'      => $this->language->get('text_' . $this->extensionType),
			'href'      => $this->getLink('extension', $this->extensionType),
      		'separator' => ' :: '
   		);
		
   		$breadcrumbs[] = array(
       		'text'      => $this->language->get('text_name'),
			'href'      => $this->getLink($this->extensionType, $this->extension),
      		'separator' => ' :: '
   		);
		
		$fields = array('module');
		
		foreach ($fields as $field) {
			$key = $this->extension . '_' . $field;
			$value = isset($this->request->post[$key]) ? $this->request->post[$key] : $this->config->get($key);
			if ($value) {
				$this->data[$key] = $this->getField($value);
			} else {
				$this->data[$key] = '';
			}
		}
		
		$this->data['module_types'] 		= array(array('id' => 0, 'name' => $this->data['module_types_0']), array('id' => 1, 'name' => $this->data['module_types_1']), array('id' => 2, 'name' => $this->data['module_types_2']), array('id' => 3, 'name' => $this->data['module_types_3']), array('id' => 4, 'name' => $this->data['module_types_4']), array('id' => 5, 'name' => $this->data['module_types_5']), array('id' => 6, 'name' => $this->data['module_types_6']), array('id' => 7, 'name' => $this->data['module_types_7']), array('id' => 8, 'name' => $this->data['module_types_8']));
		$this->data['visibilities'] 		= array(array('id' => 0, 'name' => $this->data['visibilities_0']), array('id' => 1, 'name' => $this->data['visibilities_1']), array('id' => 2, 'name' => $this->data['visibilities_2']), array('id' => 3, 'name' => $this->data['visibilities_3']), array('id' => 4, 'name' => $this->data['visibilities_4']), array('id' => 5, 'name' => $this->data['visibilities_5']), array('id' => 6, 'name' => $this->data['visibilities_6']), array('id' => 7, 'name' => $this->data['visibilities_7']));
		$this->data['display_types']		= array(array('id' => 0, 'name' => $this->data['display_types_0']), array('id' => 1, 'name' => $this->data['display_types_1']), array('id' => 2, 'name' => $this->data['display_types_2']), array('id' => 3, 'name' => $this->data['display_types_3']));
		$this->data['positions']			= array(array('id' => 'content_top', 'name' => $this->data['positions_ct']), array('id' => 'content_bottom', 'name' => $this->data['positions_cb']), array('id' => 'column_left', 'name' => $this->data['positions_cl']), array('id' => 'column_right', 'name' => $this->data['positions_cr']));
		
		$this->data['sort_data'] 			= array('random', 'model', 'quantity', 'price', 'sort_order');
		$this->data['carousel_wraps'] 		= array('circular', 'first', 'last', 'both');
		$this->data['slideshow_effects'] 	= array('fade', 'fadeZoom', 'blindX', 'blindY', 'blindZ', 'cover', 'curtainX', 'curtainY', 'growX', 'growY', 'none', 'scrollUp', 'scrollDown', 'scrollLeft', 'scrollRight', 'scrollHorz', 'scrollVert', 'shuffle', 'slideX', 'slideY', 'toss', 'turnUp', 'turnDown', 'turnLeft', 'turnRight', 'uncover', 'wipe', 'zoom');
		
		$this->load->model('setting/store');
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		$this->load->model('sale/customer_group');
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
		
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('catalog/category');
		$this->data['categories'] = $this->model_catalog_category->getCategories(0);
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('catalog/product');
		
		$module_row = 1;
		
		$modules = isset($this->request->post[$this->extension . '_module']) ? $this->request->post[$this->extension . '_module'] : $this->config->get($this->extension . '_module');
		if ($modules) {
			foreach ($this->getField($modules) as $data) {
				if ($data['featured_products']) {
					$products = explode(',', $data['featured_products']);
					foreach ($products as $product_id) {
						$product_info = $this->model_catalog_product->getProduct($product_id);
					
						if ($product_info) {
							$this->data[$this->extension . '_featured_products_' . $module_row][] = array(
								'product_id' => $product_info['product_id'],
								'name'       => $product_info['name']
							);
						}
					}
				} else {
					$this->data[$this->extension . '_featured_products_' . $module_row] = array();
				}
				$module_row++;
			}
		}

		$this->template = $this->extensionType . '/' . $this->extension . '.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		if (file_exists('../vqmod/xml/oca_advancedmodulesettings.xml') && file_exists('../vqmod/xml/vqmod_opencart.xml')) {
			$this->data['vqmod'] = true;
		} else {
			$this->data['vqmod'] = false;
		}
		
		$this->data['action'] = $this->getLink($this->extensionType, $this->extension);
		$this->data['cancel'] = $this->getLink('extension', $this->extensionType); 
		
		if ($this->getVersion() < 150) {
			$this->document->title = $this->language->get('text_name');
			$this->document->breadcrumbs = $breadcrumbs;
			$this->response->setOutput($this->render(true), $this->config->get('config_compression'));
		} else {
			$this->document->setTitle($this->language->get('text_name'));
			$this->data['breadcrumbs'] = $breadcrumbs;
			$this->response->setOutput($this->render());
		}
	}
	
	private function getLink($a, $b) {
		$route = $a . '/' . $b;
		if ($this->getVersion() >= 150) {
			return $this->url->link($route, 'token=' . $this->session->data['token'], 'SSL');
		} else {
			return HTTPS_SERVER . 'index.php?route=' . $route . '&token=' . $this->session->data['token']; 
		}
	}
	
	private function getField($value) {
		if (is_string($value) && strpos($value, 'a:') === 0) {
			$value = unserialize($value);
		}
		
		return $value;
	}
		
	private function validate() {		
		if (!$this->user->hasPermission('modify', $this->extensionType . '/' . $this->extension)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>