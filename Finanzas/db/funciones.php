<?php 
		function getTipoIngreso(){

			try {
				getcwd();				
				$db = getDB();
				$query = "SELECT id, descripcion FROM tipo_ingreso";
				$stmt = $db->prepare($query);

				$stmt->execute();   				
				var_dump($stmt);
				echo "<option value='' disabled selected>SELECCIONE TIPO INGRESO</option>";			
				while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
					extract($row);							
					echo'<OPTION VALUE="'.$row['id'].'">'.strtoupper($row['descripcion']).'</OPTION>';  
				}    				
			}catch (Exception $e) {
				echo '{"error":{"text":'. $e->getMessage() .'}}';
			}
		
		}

		function insertarIngreso(){			

     		try{    
     			getcwd();  	
     			$db = getDB();
     			$mensaje = "";
				$monto=htmlspecialchars(strip_tags($_POST['monto']));
		        $fecha=htmlspecialchars(strip_tags($_POST['fecha']));
		        $tipoIngreso=htmlspecialchars(strip_tags($_POST['tipoIngreso']));		        
		        if (strlen(htmlspecialchars(strip_tags($_POST['observaciones']))) == 0) {
		        	$observaciones = "Sin Observaciones";
		        }else{
		        	$observaciones=htmlspecialchars(strip_tags($_POST['observaciones']));
		        }
		        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		        $query = "INSERT INTO ingresos (monto,fecha, id_tipo_ingreso, observaciones) values(?, ?, ?, ?)";
		        $inserccion = $db->prepare($query);
				$inserccion->execute(array($monto,date($fecha),$tipoIngreso, $observaciones));            
                 
		        if($inserccion){		            
		            $mensaje = "<div class='alert alert-success alert-dismissible fade show' role='alert'>";
		            $mensaje.= "<strong>Exito!</strong> Registro Insertado.";
		            $mensaje.= "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
		            $mensaje.= "<span aria-hidden='true'>&times;</span></button></div>";
		            echo $mensaje;
		        }else{
					$mensaje = "<div class='alert alert-danger alert-dismissible fade show' role='alert'>";
		            $mensaje.= "<strong>Error!</strong> Error al grabar.";
		            $mensaje.= "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
		            $mensaje.= "<span aria-hidden='true'>&times;</span></button></div>";
		            echo $mensaje;
		        }
         
    		}     	
    		catch(PDOException $exception){
        	die('ERROR: ' . $exception->getMessage());
    		}
    	}

?>
