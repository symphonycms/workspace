<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcearticle extends SectionDatasource {

		public $dsParamROOTELEMENT = 'article';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$entry';
		public $dsParamPARAMOUTPUT = array(
				'system:id'
		);
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';


		public $dsParamFILTERS = array(
				'1' => '{$entry}',
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
				'name' => 'Article',
				'author' => array(
					'name' => 'Symphony Team',
					'website' => 'http://getsymphony.com',
					'email' => 'team@getsymphony.com'),
				'version' => 'Symphony 2.3.2RC1',
				'release-date' => '2013-02-22T11:31:22+00:00'
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
