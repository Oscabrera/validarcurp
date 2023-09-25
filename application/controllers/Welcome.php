<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
    
    var $menu;
    
    function __construct(){
        parent::__construct();
        $this->load->helper('funcionphp');
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->library('excel');
        $this->menu=array('menu'=>$this->load->view('base/menusolo','',true));         
    }    
     
	public function index(){
        setlocale(LC_ALL,"es_ES");
        date_default_timezone_set("America/Mexico_City");
        
        $dato['error'] = 3;
        $dato['msjerror'] = "Error el archivo no se ha cargado";
        $errores = array();
        $lista = array();
        $a=0;
        if($this->input->post('action')=='1'){
            $datos=LeerArchivo($this->excel); 
            curlCURP($this->excel,$datos);
            
            
    }
        $this->load->view('base/head',$this->menu);
        $this->load->view('leerarchivo', $dato);
        $this->load->view('base/js');
        $this->load->view('base/popover');
        $this->load->view('base/fakeboton');
        $this->load->view('base/footer');
        $this->load->view('base/findoc');
  }
         
    
}
