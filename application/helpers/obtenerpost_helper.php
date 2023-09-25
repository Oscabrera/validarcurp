<?PHP

    
/*
*   funcion que obtiene el post y lo agrega en arreglo para su manipulación
*   es usado en nuevo y actualizar grupo
*   requiere $this->input
*/
    function getgrupodatos($input,$upd){
        $datos=array();
        if($upd==1){//los datos son para actualizar
            $datos=array("fecha_aplicacion"=>$input->post("fecha_aplicacion"),
                         "aula"=>$input->post("aula"),
                         "cupo"=>$input->post("cupo"),
                         "estatus"=>$input->post("estatus"));
        }
        else{// es una simple inserción
            $datos= array("clave"=>$input->post("clave"),
                          "fecha_aplicacion"=>$input->post("fecha_aplicacion"),
                          "aula"=>$input->post("aula"),
                          "cupo"=>$input->post("cupo"),
                          "estatus"=>$input->post("estatus"));
        }
        //la diferencia es que en uno no es necesario la clave
        return $datos;
    }

?>