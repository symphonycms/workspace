<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcecomments extends Datasource{
		
		public $dsParamROOTELEMENT = 'comments';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '999';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$ds-article';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'14' => '{$ds-article}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'author',
				'email',
				'website',
				'date',
				'comment: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-article');
		}
		
		public function about(){
			return array(
					 'name' => 'Comments',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony-cms.com',
							'email' => 'allen@symphony-cms.com'),
					 'version' => '1.0',
					 'release-date' => '2009-07-27T05:14:29+00:00');	
		}
		
		public function getSource(){
			return '4';
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

