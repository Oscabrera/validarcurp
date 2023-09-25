<?PHP

    function FechaLetra($fecha){
        $meses = array('','enero','febrero','marzo','abril','mayo','junio','julio',
               'agosto','septiembre','octubre','noviembre','diciembre');
        $dia = array('Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado');
        
        $fechaL=$dia[date("w", strtotime($fecha))].' '.date("d", strtotime($fecha)).' '.$meses[date("n", strtotime($fecha))].' de '.date("Y", strtotime($fecha));
        
        return $fechaL;
    }

    function getColumnasArray($lista){
        $pos=65;//A
        $pos2=64;//A-1
        $pasada=0;
        $letra='';
        $columnas=array('nombre'=>array(),'letra'=>array());
        while ($d = current($lista)) {
            array_push($columnas['nombre'],key($lista));
            
            if($pasada>0){
                $letra=chr($pos2);
            }else{$letra='';}
            if($pos<=90){
                $letra.=chr($pos);
            }
            if($pos==90){
                $pasada++;
                $pos2++;
                $pos=64;
            }
            $pos++;
            array_push($columnas['letra'],$letra);
            next($lista);
        }
        return $columnas;
    }

//funcion para descargar archivo excel con información (generico)    
function DescargarDocumento($objPHPExcel,$datos,$nombre){//libreria, arreglo de datos
    $columnas=getColumnasArray($datos[0]);//tomamos el primer objeto y vemos sus claves y su dimención
    // comenzamos en la celda 2 la 1 es de titulos
    $j=1;
    print_r($datos);
    //configuración general del documento
    $objPHPExcel->
        getProperties()
            ->setCreator("EDSI")
            ->setLastModifiedBy("EDSI")
            ->setTitle("Grupo-".$nombre)
            ->setSubject("Aspirantes")
            ->setDescription("Documento contiene los aspirantes en el grupo para exmaen psicometrico")
            ->setKeywords("psicometrico de itl 2017")
            ->setCategory("grupo-".$nombre);
    
    //arreglo para los encabezados
    $styleArray = array(
    'font'  => array(
        'bold'  => true,
        'color' => array('rgb' => 'FFFFFF'),
        'size'  => 12,
        'name'  => 'Verdana'
    ));
    //ativamos la hoja 0
    $objPHPExcel->setActiveSheetIndex(0);
    //guardamos el objeto hoja activa en una variable
    $hoja=$objPHPExcel->getActiveSheet();
    
    //recorremos los encabezados para darle diseño
    foreach($columnas['letra'] as $col){
        $hoja->getStyle($col.$j)->applyFromArray($styleArray);
        $hoja->getStyle($col.$j)->getFill()
        ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
        ->getStartColor()
        ->setRGB('00B0F0');
        $hoja->getColumnDimension($col)->setAutoSize(true);
        $hoja->getStyle($col)
    ->getNumberFormat()
    ->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);         
    }
    
    //recorremos la logitud del los campos de los datos
    for($i=0; $i<count($columnas['letra']);$i++){
        // cada clave del arreglo lo agregamos como columna en su respectiva celda
        $hoja->setCellValue($columnas['letra'][$i].$j, strtoupper($columnas['nombre'][$i]));        
    }
    
    //letra default de otras celdas
    $objPHPExcel->getDefaultStyle()->getFont()->setName('Arial')->setSize(12)->setBold(false);
    //Se recorren los datos
    $j++;
    foreach($datos as $item){
        // y en cada datos recoremos sus elementos
        for($i=0; $i<count($columnas['letra']);$i++){
            //agregamos a su celda correspondiente
            $hoja->setCellValue($columnas['letra'][$i].$j, $item->$columnas['nombre'][$i]);   
        }
        $j++;
    }
    
    $hoja->setTitle(''.$nombre);
    
    header('Content-type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="'.$nombre.'.xlsx"');
    header('Cache-Control: max-age=0');

    $objWriter=PHPExcel_IOFactory::createWriter($objPHPExcel,'Excel2007');
    ob_end_clean();
    ob_start();
    $objWriter->save('php://output');
    exit;
}


function LeerArchivo($excel){
    //$urlServer="/var/tmp/bak_";//server
    $urlServer="bak_";//local
    $sheets = [];    
    $objPHPExcel = new PHPExcel();
    //cargamos el archivo al servidor con el mismo nombre
    //solo le agregue el sufijo bak_
    $archivo = $_FILES['archivo']['name'];
    $tipo = $_FILES['archivo']['type'];
    $destino = $urlServer.$archivo;
    
    if (!copy($_FILES['archivo']['tmp_name'],$destino))
        return 1;
    if (file_exists ($destino)){ // Cargando la hoja de cálculo
        $objReader = new PHPExcel_Reader_Excel5();
        $objReader = new PHPExcel_Reader_Excel2007();
        $objPHPExcel = $objReader->load($destino);
        $objFecha = new PHPExcel_Shared_Date();
        $objPHPExcel->setActiveSheetIndex(0);
        $hojaActiva=$objPHPExcel->getActiveSheet();
        
        
        $i=0;
        foreach ($objPHPExcel->getAllSheets() as $sheet) {
            $sheets[$i] = $sheet->toArray();
            $i++;
        }    
    }
    return $sheets;
}


function curlCURP($excel,$CURP){
   $datos=array('CURP'=>$CURP,'Valido'=>array());
   $r=0; $url="http://sube.educafin.com/includes/uys87eryyu_datos_curp_renapo_sibec_talentum_xyzdkhgfuers.php?txtCurpIngresado=";
    $curl = curl_init();
    $datos=array();
    foreach($CURP[0] as $d){
        set_time_limit(50);
        if($r>0){
            curl_setopt_array($curl, array(
                CURLOPT_RETURNTRANSFER => 1,
                CURLOPT_URL => $url.$d[0],
                CURLOPT_USERAGENT => 'Codular Sample cURL Request',
                CURLOPT_POST => 1
            ));
            $resp = utf8_encode(curl_exec($curl));
            if(strlen($resp)>1){
                $datos = explode(",",$resp);
                //Se mandan los datos al arreglo
                $curps[$r] = array('CURP'=>$datos[0],'Paterno'=>$datos[1], 'Materno'=>$datos[2], 'Nombre'=>$datos[3],'Fecha nacimiento'=>$datos[5], 'Sexo'=>$datos[4]);
            }else{
                $curps[$r] = array('CURP'=>$d[0],'Paterno'=>'', 'Materno'=>'', 'Nombre'=>'','Fecha nacimiento'=>'', 'Sexo'=>'');
            }
        }
        $r++;
    }
        
    curl_close($curl);
    DescargarDocumento($excel,$curps,'CURPvalidados');
}






















?>