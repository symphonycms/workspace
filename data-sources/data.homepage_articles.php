<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcehomepage_articles extends Datasource{
		
		public $dsParamROOTELEMENT = 'homepage-articles';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '5';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'date';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'30' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body',
				'date',
				'categories'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Homepage Articles',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony-203.local:8888',
							'email' => 'allen@chaoticpattern.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-24T00:59:03+00:00');	
		}
		
		public function getSource(){
			return '6';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

