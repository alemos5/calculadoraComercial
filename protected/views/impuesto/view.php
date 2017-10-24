<?php
$this->breadcrumbs=array(
	'Impuestos'=>array('index'),
	$model->id_impuesto,
);

$this->menu=array(
array('label'=>'List Impuesto','url'=>array('index')),
array('label'=>'Create Impuesto','url'=>array('create')),
array('label'=>'Update Impuesto','url'=>array('update','id'=>$model->id_impuesto)),
array('label'=>'Delete Impuesto','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_impuesto),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Impuesto','url'=>array('admin')),
);
?>

<h1>View Impuesto #<?php echo $model->id_impuesto; ?></h1>

<?php $this->widget('booster.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id_impuesto',
		'impuesto',
		'porcentaje',
		'estatus',
),
)); ?>
