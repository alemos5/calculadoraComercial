<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name.' - Iniciar Sesión';
$this->breadcrumbs=array(
  'Iniciar Sesión',
);
?>
<head>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/login.css" />
        <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<!--
<style>
	.col{ border:2px solid #e5e5e5}
</style>
-->
<div class="row">
	<div class="col col-md-12">
            <center>
                <div id="logo">
                    <img class="img-responsive" src="../images/logo.png">
                </div>
            </center>
	</div>
	
</div>
<div class="row">
	<div class="col col-md-12">
		<div class="center-block">							
			<div id="bglogin">
				<fieldset>
	  <legend>Iniciar Sesión</legend>
  <div class="form">
    <?php $form=$this->beginWidget('booster.widgets.TbActiveForm', array(
	    'id'=>'login-form',
	    'type' => 'inline',
	    'enableClientValidation'=>true,
	    'clientOptions'=>array(
		    'validateOnSubmit'=>true,
	    ),
    )); ?>
    <div class="alert alert-warning"><i class="glyphicon glyphicon-info-sign"></i> Campos con * son requeridos.</div>
    <p><?php echo $form->textFieldGroup($model,'username', array('widgetOptions'=>array('htmlOptions'=>array('placeholder'=>'Coloca nombre de usuario.')),'append' => '<i class="glyphicon glyphicon-user"></i>')); ?></p>
    <p><?php echo $form->passwordFieldGroup($model,'password', array('widgetOptions'=>array('htmlOptions'=>array('placeholder'=>'Coloca la contraseña.')),'append' => '<i class="glyphicon glyphicon-lock"></i>')); ?></p>
    <div class="row">
        <!--<div class="col-sm-3 control-label"></div>-->
        <div class="col-sm-12">
        <?php 
//            $this->widget('CCaptcha', array('clickableImage'=>1)); 
//            $this->widget('application.extensions.reCaptcha.ReCaptcha', array(
//            'model' => $model,
//            'attribute' => 'verifyCode',
//            ));
        ?>
            <?php
//            $this->widget('application.extensions.yiiReCaptcha.ReCaptcha', array(
//                'model'     => $model,
//                'attribute' => 'verifyCode',
//                'isSecureToken' => true,
//            ));
            
            ?>
            
            <!--<div class="g-recaptcha" data-sitekey="6LcIbDMUAAAAAAQLWrNmxs1pTlYGCt_NxPBgR43-"></div>-->
            <!--<div class="g-recaptcha" data-sitekey="6LfZrzMUAAAAABGLCckkLqxdZjMKwU8eWizka9Zw"></div>-->
        </div></div>
    <p><?php // echo $form->textFieldGroup($model,'verifyCode',array('widgetOptions'=>array('htmlOptions'=>array('id'=>'input-lg', 'placeholder'=>'Coloca las letras de la imagen.')), 'append' => '<i class="glyphicon glyphicon-barcode"></i>')); ?></p>
    <!--<div class="row rememberMe">-->
      <?php //echo $form->checkBox($model,'rememberMe'); ?>
      <?php //echo $form->label($model,'rememberMe'); ?>
      <?php //echo $form->error($model,'rememberMe'); ?>
    <!--</div>-->  
    <hr>  
    <button id="yw1" style="width: 100%; margin-bottom: 5px; " class="btn btn-lg btn-primary" name="yt0" type="submit">Ingresar</button>    
    <!--<label style="width: 100%;" data-target="#recuperarClaveUsuario" data-toggle="modal" class="btn">Recuperar Clave</label>-->
    
    <?php $this->endWidget(); ?>
  </div>
  </fieldset>
			</div>
</div>
	</div>
	
</div>



<?php $this->beginWidget('booster.widgets.TbModal', array('id'=>'recuperarClaveUsuario')) ?>
    <div class="modal-header">
      <a class="close" data-dismiss="modal">&times;</a>
      <h4>Recuperar Clave: </h4>
    </div>

    <div class="modal-body">
    <div id="respuestaUsuario"></div>
    <div id="contenidoModal" style="display: block;">
      <div class="container-fluid">
         
        <div class="row" style="">
            <center>
                <div id="cedulaBusqueda_form" class="col-md-12">
					<div id="cedulaBusqueda_em_" class="alert alert-danger" style="display:none"></div>
                    <div class="form-group">
                        <div  class="col-sm-8 bootstrap-timepicker input-group">
                            <input  size="35" id="cedulaBusqueda" class="form-control" type="text" maxlength="8" name="cedulaBusqueda" placeholder="Cedula" onblur="cedulaExistente()" onkeypress="return isNumberKey(event)">
                            <label onclick="varificarCedula()" class="input-group-addon btn btn-primary" style="width: 10%;">Buscar</label>
                        </div>    
                    </div>
                </div>
            </center>
            <!--<div id="recuperarClaveContenido"></div>-->
       </div>
          <div id="msg"></div>
          <div style="display: none;" id="FormularioRecuperarClave" class="row">
              <div class="col-xs-12">
                    <div id="fecha_nacimiento_form" class="form-group">
                      <?php 
                          //echo $form->datePickerGroup($usuario,'fecha_nacimiento',array('widgetOptions'=>array('options'=>array('format'=>'yyyy-mm-dd'), 'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', 'append'=>'')); 
                      echo $form->datePickerGroup($usuario,'fecha_nacimiento',array('widgetOptions'=>array('options'=>array('format'=>'dd-mm-yyyy'), 'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', 'append'=>'<!--Click on Month/Year to select a different Month/Year.-->'));
                      ?>
                    <div id="fecha_nacimiento_em_" class="help-block error" style="display:none"></div>
                    </div>
              </div>
              <div class="col-xs-12">
                  <div id="contrasena" class="form-group">
                    <?php echo $form->passwordFieldGroup($usuario,'contrasena',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>200)))); ?>
                  </div>
              </div>
              <div style="margin-top: 10px;" id="repetir_Contrasena" class="col-xs-12">
                  <div class="form-group">
                      <label class="col-sm-3 control-label required" for="RepetirContrasena">Repetir Contraseña</label>
                      <div class="col-sm-9">
                          <input class="span5 form-control" type="password" id="RepetirContrasena" name="RepetirContrasena" onkeyup="validarClave()" placeholder="Repetir Contrasena" maxlength="200">
                          <div id="RepetirContrasena_em_" class="help-block error" style="display:none"></div>
                      </div>
                  </div>
              </div>
          <br>
          </div>
          <center>
              <div id="rcb" onclick="validarClaveUsuaurio()" class="btn btn-primary" style="width: 45%; display: none; ">Recuperar Clave</div>
          </center>
          
      </div>
      
     </div>
    </div>
    
    <div class="modal-footer">
      <?php $this->widget('booster.widgets.TbButton', array(
        'context'=>'default',
        'label'=>'Cancelar',
        'url'=>'#',
        'htmlOptions'=>array('data-dismiss'=>'modal', 'onclick'=>'location.reload()')
      ));?>
    </div>
<?php $this->endWidget(); ?>


<script>
function varificarCedula(){
    var UsuarioCedula = $('#cedulaBusqueda').val();

    
    
    if (UsuarioCedula !=""){
        $.post("<?php echo Yii::app()->createUrl('usuario/cedulaDisponible') ?>",{ UsuarioCedula:UsuarioCedula},function(data){
            if (data==0){
                $("#cedulaBusqueda_form").removeClass("form-group").addClass("form-group has-error");
                $("#cedulaBusqueda_em_").css("display", "block");
                $('#cedulaBusqueda_em_').html('La cedula no se encuentra registrada');
                $("#FormularioRecuperarClave").css("display", "none");
                $("#rcb").css("display", "none");
            }else{
                $("#cedulaBusqueda_form").removeClass("form-group has-error").addClass("form-group");
                $("#cedulaBusqueda_em_").css("display", "none");
                $('#cedulaBusqueda_em_').html('');
                $("#rcb").css("display", "block");
                $("#FormularioRecuperarClave").css("display", "block"); 

            }
        });
    }else{
        alert("Debe ingresar un numero cédula");
    }
        
}   
function cedulaExistente(){
    var UsuarioCedula = $('#cedulaBusqueda').val();
    if (UsuarioCedula !=""){
    $.post("<?php echo Yii::app()->createUrl('usuario/cedulaDisponible') ?>",{ UsuarioCedula:UsuarioCedula},function(data){
               if (data==0){
                    $("#cedulaBusqueda_form").removeClass("form-group").addClass("form-group has-error");
                    $("#cedulaBusqueda_em_").css("display", "block");
                    $('#cedulaBusqueda_em_').html('La cedula no se encuentra registrada');
                    $("#rcb").css("display", "none");
                    $('#recuperarClaveContenido').html('');
                }else{
                    $("#cedulaBusqueda_form").removeClass("form-group has-error").addClass("form-group");
                    $("#cedulaBusqueda_em_").css("display", "none");
                    $('#cedulaBusqueda_em_').html('');
                    $("#rcb").css("display", "block");
                }
            });
    }else{
        alert("Debe ingresar un numero cédula");
    }
}

function validarClave(){
    var Usuario_contrasena = $('#Usuario_contrasena').val();
    var RepetirContrasena = $('#RepetirContrasena').val();
    
    if (RepetirContrasena!=Usuario_contrasena){
        $("#repetir_Contrasena").removeClass("form-group").addClass("form-group has-error");
        $("#RepetirContrasena_em_").css("display", "block");
        $('#RepetirContrasena_em_').html('ambas contraseñas deberan ser iguales');
    }else{
        if (RepetirContrasena==""){
            $("#repetir_Contrasena").removeClass("form-group").addClass("form-group has-error");
            $("#RepetirContrasena_em_").css("display", "block");
            $('#RepetirContrasena_em_').html('Debe ingresar la misma contraseña ingresada anteriormente');
        }else{
            if (RepetirContrasena!=Usuario_contrasena){
                $("#repetir_Contrasena").removeClass("form-group").addClass("form-group has-error");
                $("#RepetirContrasena_em_").css("display", "block");
                $('#RepetirContrasena_em_').html('ambas contraseñas deberan ser iguales');
            }else{
                $("#repetir_Contrasena").removeClass( "form-group has-error" ).addClass( "form-group has-success" );
                $("#RepetirContrasena_em_").css("display", "none");
                $('#RepetirContrasena_em_').html('');
                
                $("#contrasena").removeClass( "form-group has-error" ).addClass( "form-group has-success" );
                $("#Usuario_contrasena_em_").css("display", "none");
                $('#Usuario_contrasena_em_').html('');
            }
        }
    }
}
function validarClaveUsuaurio(){
    var fechaNacimiento = $('#Usuario_fecha_nacimiento').val();
    var Usuario_contrasena = $('#Usuario_contrasena').val();
    var RepetirContrasena = $('#RepetirContrasena').val();
    var UsuarioCedula = $('#cedulaBusqueda').val();
    var error = 0;
  
    if (fechaNacimiento==""){
            $("#fecha_nacimiento_form").removeClass("form-group").addClass("form-group has-error");
            $("#fecha_nacimiento_em_").css("display", "block");
            $('#fecha_nacimiento_em_').html('Debe ingresar su fecha de Nacimiento');
            error =1;
        }else{
            $("#fecha_nacimiento_form").removeClass( "form-group has-error" ).addClass( "form-group" );
            $("#fecha_nacimiento_em_").css("display", "none");
            $('#fecha_nacimiento_em_').html('');
            if (error != 1){ error =0; }
        }
        
        if (Usuario_contrasena==""){
            $("#contrasena").removeClass("form-group").addClass("form-group has-error");
            $("#Usuario_contrasena_em_").css("display", "block");
            $('#Usuario_contrasena_em_').html('Debe ingresar una contraseña');
            error =1;
        }else{
            $("#contrasena").removeClass( "form-group has-error" ).addClass( "form-group" );
            $("#Usuario_contrasena_em_").css("display", "none");
            $('#Usuario_contrasena_em_').html('');
            if (error != 1){ error =0; }
        }
        
        if (RepetirContrasena!=Usuario_contrasena){
            $("#repetir_Contrasena").removeClass("form-group").addClass("form-group has-error");
            $("#RepetirContrasena_em_").css("display", "block");
            $('#RepetirContrasena_em_').html('ambas contraseñas deberan ser iguales');
            error =1;
        }else{
            if (RepetirContrasena==""){
                $("#repetir_Contrasena").removeClass("form-group").addClass("form-group has-error");
                $("#RepetirContrasena_em_").css("display", "block");
                $('#RepetirContrasena_em_').html('Debe ingresar la misma contraseña ingresada anteriormente');
                error =1;
            }else{
                if (RepetirContrasena!=Usuario_contrasena){
                    $("#repetir_Contrasena").removeClass("form-group").addClass("form-group has-error");
                    $("#RepetirContrasena_em_").css("display", "block");
                    $('#RepetirContrasena_em_').html('ambas contraseñas deberan ser iguales');
                    error =1;
                }else{
                    $("#repetir_Contrasena").removeClass( "form-group has-error" ).addClass( "form-group has-success" );
                    $("#RepetirContrasena_em_").css("display", "none");
                    $('#RepetirContrasena_em_').html('');

                    $("#contrasena").removeClass( "form-group has-error" ).addClass( "form-group has-success" );
                    $("#Usuario_contrasena_em_").css("display", "none");
                    $('#Usuario_contrasena_em_').html('');
                    if (error != 1){ error =0; }
                }
            }
        }
        
        if (error == 0){
            $.post("<?php echo Yii::app()->createUrl('usuario/validarCedulaUsuario') ?>",{ 
              UsuarioCedula:UsuarioCedula,
              fechaNacimiento:fechaNacimiento,
              Usuario_contrasena:Usuario_contrasena
            },function(data){
                    
                     $('#msg').html(data);
                     $('#Usuario_fecha_nacimiento').val('');
                     $('#Usuario_contrasena').val('');
                     $('#RepetirContrasena').val('');
                     $("#FormularioRecuperarClave").css("display", "none");
                     $("#rcb").css("display", "none");
            });
        }else{
          alert("Se han encontrado ciertos errores");
        }
        
}
</script>
