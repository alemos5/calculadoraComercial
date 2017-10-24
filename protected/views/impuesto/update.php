<?php
$this->breadcrumbs=array(
	'Impuestos'=>array('index'),
	$model->id_impuesto=>array('view','id'=>$model->id_impuesto),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Impuesto','url'=>array('index')),
	array('label'=>'Create Impuesto','url'=>array('create')),
	array('label'=>'View Impuesto','url'=>array('view','id'=>$model->id_impuesto)),
	array('label'=>'Manage Impuesto','url'=>array('admin')),
	);
	?>

	<h1>Update Impuesto <?php echo $model->id_impuesto; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>