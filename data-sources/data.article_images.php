<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcearticle_images extends SectionDatasource {

		public $dsParamROOTELEMENT = 'article-images';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';


		public $dsParamFILTERS = array(
				'17' => '{$ds-homepage-articles:$ds-article:$ds-drafts}',
		);


		public $dsParamINCLUDEDELEMENTS = array(
				'image',
				'article',
				'description: formatted'
		);


		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-homepage-articles', '$ds-article', '$ds-drafts');
		}

		public function about() {
			return array(
				'name' => 'Article Images',
				'author' => array(
					'name' => 'Symphony Team',
					'website' => 'http://getsymphony.com',
					'email' => 'team@getsymphony.com'),
				'version' => 'Symphony 2.3.2RC1',
				'release-date' => '2013-02-22T11:31:25+00:00'
			);
		}

		public function getSource() {
			return '5';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
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
