<div class="Contenedor">

		<center>
		<h3> Guardar datos del banco  </h3>
		<br><br>
		</center>

<div class="container">
	<input type="hidden" name="error" id="error" value="<?=$error; ?>">
	<input type="hidden" name="msjerror" id="msjerror" value="<?=$msjerror; ?>">
	<div class="form-group ">
			<div class="col-xs-9 col-xs-offset-1 ">
					<div id="divalert"></div>
			</div>
	</div>
	<form action="" class="form-horizontal" method="post" name="importa" enctype="multipart/form-data">
<div class="col-sm-5 col-sm-offset-2">
									<div class="alert alert-warning"><span class="glyphicon glyphicon-info-sign"></span> Seleccione el archivo del banco </div>
									<div class="input-group">
											<span class="input-group-btn">
	<button id="fake-file-button-browse" type="button" class="btn btn2">
		<span class="glyphicon glyphicon-file"></span>
											</button>
											</span>
											<input type="file" id="files-input-upload" name="archivo" style="display:none" data-buttonBefore="true">
											<input type="text" id="fake-file-input-name" disabled="disabled" placeholder="Archivo no seleccionado" class="form-control">
											<span class="input-group-btn">
	<button type="submit" class="btn btn1" disabled="disabled" id="fake-file-button-upload" value="1" name="action" data-form="Archivo del banco" data-toggle="tooltip">
		<span class="glyphicon glyphicon-upload"></span>
											</button>
											</span>
											<input type="hidden" value="1" name="action" />
									</div>
							</div>
	</form>

</div><!-- Fin del div contenedor -->
