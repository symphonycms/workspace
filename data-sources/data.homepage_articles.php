<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcehomepage_articles extends SectionDatasource {

		public $dsParamROOTELEMENT = 'homepage-articles';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '5';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'system:id'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';


		public $dsParamFILTERS = array(
				'5' => 'yes',
		);


		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body: formatted',
				'date',
				'categories'
		);


		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Homepage Articles',
				'author' => array(
					'name' => 'Symphony Team',
					'website' => 'http://getsymphony.com',
					'email' => 'team@getsymphony.com'),
				'version' => 'Symphony 2.3.2RC1',
				'release-date' => '2013-02-22T11:31:33+00:00'
			);
		}

		public function getSource() {
			return '1';
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
