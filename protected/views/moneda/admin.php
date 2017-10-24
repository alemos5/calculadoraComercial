<?php
$this->breadcrumbs=array(
	'Monedas'=>array('index'),
	'Administrar',
);

$this->menu=array(
array('label'=>'List Moneda','url'=>array('index')),
array('label'=>'Create Moneda','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('moneda-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<span class="ez">Administración de Monedas</span>
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
'id'=>'moneda-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'id_moneda',
//		'id_exchange',
                array(
                  'filter'=>CHtml::listData(Exchange::model()->findAll(),'id_exchange','exchange'),
                  'name'=>'id_exchange',
                  'type'=>'raw',
                  'value'=>'$data->idExchange->exchange',
                ),
		'moneda',
                'abv',
		array(
                  'filter'=>CHtml::listData(Estatus::model()->findAll(),'id_estatus','estatus'),
                  'name'=>'estatus',
                  'type'=>'raw',
                  'value'=>'estatus($data->estatus);',
                ),
//		'id_usuario_sistema_reg',
//		'fecha_reg',
		/*
		'ip_reg',
		'id_usuario_sistema_mod',
		'fecha_mod',
		'ip_mod',
		'abv',
		'url',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn',
),
),
)); ?>
