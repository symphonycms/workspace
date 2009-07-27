<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcearticle_images extends Datasource{
		
		public $dsParamROOTELEMENT = 'article-images';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '30';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'17' => '{$ds-homepage-articles:$ds-article:$ds-drafts}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'image',
				'article',
				'description: formatted'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-homepage-articles', '$ds-article', '$ds-drafts');
		}
		
		public function about(){
			return array(
					 'name' => 'Article Images',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony-cms.com',
							'email' => 'allen@symphony-cms.com'),
					 'version' => '1.0',
					 'release-date' => '2009-07-27T05:13:31+00:00');	
		}
		
		public function getSource(){
			return '5';
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

