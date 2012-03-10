<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcelogged_in_author extends Datasource{

		public $dsParamROOTELEMENT = 'logged-in-author';
		public $dsParamORDER = 'desc';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'id';
		

		public $dsParamFILTERS = array(
				'username' => '{$cookie-username:0}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'username'
		);
		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Logged in Author',
				'author' => array(
							'name' => 'Symphony Team',
							'website' => 'http://symphony-cms.com',
							'email' => 'team@symphony-cms.com'),
				'version' => '1.0',
				'release-date' => '2012-03-10'
			);
		}

		public function getSource(){
			return 'authors';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				
				include(TOOLKIT . '/data-sources/datasource.author.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
