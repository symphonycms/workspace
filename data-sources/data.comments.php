<?php

require_once TOOLKIT . '/class.datasource.php';

class datasourcecomments extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'comments';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '999';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$ds-article';
    public $dsParamSORT = 'system:id';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

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

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-article');
    }

    public function about()
    {
        return array(
            'name' => 'Comments',
            'author' => array(
                'name' => 'Symphony Team',
                'website' => 'http://getsymphony.com',
                'email' => 'team@getsymphony.com'),
            'version' => 'Symphony 2.5.0',
            'release-date' => '2014-09-15T10:29:05+00:00'
        );
    }

    public function getSource()
    {
        return '4';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try{
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}