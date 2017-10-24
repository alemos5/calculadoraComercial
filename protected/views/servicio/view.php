<?php
$this->breadcrumbs=array(
	'Servicios'=>array('index'),
	$model->id_servicio,
);

$this->menu=array(
array('label'=>'List Servicio','url'=>array('index')),
array('label'=>'Create Servicio','url'=>array('create')),
array('label'=>'Update Servicio','url'=>array('update','id'=>$model->id_servicio)),
array('label'=>'Delete Servicio','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_servicio),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Servicio','url'=>array('admin')),
);
?>

<h1>View Servicio #<?php echo $model->id_servicio; ?></h1>

<?php $this->widget('booster.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id_servicio',
		'servicio',
		'costo',
		'estatus',
),
)); ?>
