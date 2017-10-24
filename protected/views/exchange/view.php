<?php
$this->breadcrumbs=array(
	'Exchanges'=>array('index'),
	$model->id_exchange,
);

$this->menu=array(
array('label'=>'Listar Exchange','url'=>array('index')),
array('label'=>'Crear Exchange','url'=>array('create')),
array('label'=>'Actualizar Exchange','url'=>array('update','id'=>$model->id_exchange)),
array('label'=>'Eliminar Exchange','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_exchange),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Administrar Exchange','url'=>array('admin')),
);
?>

<span class="ez">Datos de Exchange</span>
<div class="pd-inner">
<?php 
$date = new Date();
function estatus($estatus){
    if($estatus == 0){
        $estatus = "Inactivo";
    }
    if($estatus == 1){
        $estatus = "Activo";
    }
    return $estatus;
}
function vacio($vacio){
    if($vacio == "" || $vacio == NULL){
        $vacio = NULL;
    }
    return $vacio;
}
$this->widget('booster.widgets.TbDetailView',array(
'type' => 'striped bordered hover',
'data'=>$model,
'attributes'=>array(
		'id_exchange',
		'exchange',
		array(
                    'label'=>'Estatus',
                    'value'=>estatus($model->estatus),
                ),
//		'id_usuario_sistema_reg',
//		'fecha_reg',
//		'ip_reg',
//		'id_usuario_sistema_mod',
//		'fecha_mod',
//		'ip_mod',
),
)); ?>
</div>