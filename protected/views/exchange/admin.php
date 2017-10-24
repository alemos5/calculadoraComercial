<?php
$this->breadcrumbs=array(
	'Exchanges'=>array('index'),
	'Administrar',
);

$this->menu=array(
array('label'=>'Listar Exchange','url'=>array('index')),
array('label'=>'Crear Exchange','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('exchange-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<span class="ez">Administración de Exchange</span>
<div class="pd-inner">


<?php 
function estatus($estatus){
    if($estatus == 0){
        $estatus = "Inactivo";
    }
    if($estatus == 1){
        $estatus = "Activo";
    }
    return $estatus;
}
$this->widget('booster.widgets.TbGridView',array(
'id'=>'exchange-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'id_exchange',
		'exchange',
                array(
                  'filter'=>CHtml::listData(Estatus::model()->findAll(),'id_estatus','estatus'),
                  'name'=>'estatus',
                  'type'=>'raw',
                  'value'=>'estatus($data->estatus);',
                ),
//		'id_usuario_sistema_reg',
//		'fecha_reg',
//		'ip_reg',
		/*
		'id_usuario_sistema_mod',
		'fecha_mod',
		'ip_mod',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn',
),
),
)); ?>
