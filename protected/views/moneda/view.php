<?php
$this->breadcrumbs=array(
	'Monedas'=>array('index'),
	$model->id_moneda,
);

$this->menu=array(
array('label'=>'Listar Monedas','url'=>array('index')),
array('label'=>'Crear Moneda','url'=>array('create')),
array('label'=>'Actualizar Moneda','url'=>array('update','id'=>$model->id_moneda)),
array('label'=>'Eliminar Moneda','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_moneda),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Administar Monedas','url'=>array('admin')),
);
?>
<span class="ez">Datos de la Moneda</span>
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
		'id_moneda',
//		'id_exchange',
		array(
                    'label'=>'Exchange',
                    'value'=>$model->idExchange->exchange,
                ),
		'moneda',
		'abv',
		'url',
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