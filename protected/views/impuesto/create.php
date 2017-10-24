<?php
$this->breadcrumbs=array(
	'Impuestos'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Impuesto','url'=>array('index')),
array('label'=>'Manage Impuesto','url'=>array('admin')),
);
?>

<h1>Create Impuesto</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>