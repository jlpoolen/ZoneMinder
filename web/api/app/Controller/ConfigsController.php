<?php
App::uses('AppController', 'Controller');
/**
 * Configs Controller
 *
 * @property Config $Config
 */
class ConfigsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('RequestHandler');

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Config->recursive = 0;
		$configs = $this->Config->find('all');
		$this->set(array(
			'configs' => $configs,
			'_serialize' => array('configs')
		));
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->Config->exists($id)) {
			throw new NotFoundException(__('Invalid config'));
		}
		$options = array('conditions' => array('Config.' . $this->Config->primaryKey => $id));
		$config = $this->Config->find('first', $options);
		$this->set(array(
			'config' => $config,
			'_serialize' => array('config')
		));
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Config->id = $id;

		if (!$this->Config->exists($id)) {
			throw new NotFoundException(__('Invalid config'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Config->save($this->request->data)) {
				return $this->flash(__('The config has been saved.'), array('action' => 'index'));
			}
		} else {
			$options = array('conditions' => array('Config.' . $this->Config->primaryKey => $id));
			$this->request->data = $this->Config->find('first', $options);
		}
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		$this->Config->id = $id;
		if (!$this->Config->exists()) {
			throw new NotFoundException(__('Invalid config'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Config->delete()) {
			return $this->flash(__('The config has been deleted.'), array('action' => 'index'));
		} else {
			return $this->flash(__('The config could not be deleted. Please, try again.'), array('action' => 'index'));
		}
	}

/**
 * categories method
 *
 * Either return a list of distinct categories
 * Or all configs under a certain category
 */

	public function categories($category = null) {
		if ($category != null) {
			if (!$this->Config->find('first', array( 'conditions' => array('Config.Category' => $category)))) {
				throw new NotFoundException(__('Invalid Config Category'));
			}

			$config = $this->Config->find('all', array(
				'conditions' => array('Config.Category' => $category),
				'recursive' => 0
			));
			$this->set(array(
				'config' => $config,
				'_serialize' => array('config')
			));
		} else {
			$categories = $this->Config->find('all', array(
				'fields' => array('DISTINCT Config.Category'),
				'conditions' => array('Config.Category !=' => 'hidden'),
				'recursive' => 0
			));
			$this->set(array(
				'categories' => $categories,
				'_serialize' => array('categories')
			));
		}
		
	}

	public function keyValue() {
		$keyValues = $this->Config->find('list', array(
			'fields' => array('Config.Name', 'Config.Value')
		));
		$this->set(array(
			'keyValues' => $keyValues,
			'_serialize' => array('keyValues')
		));
	}
}
