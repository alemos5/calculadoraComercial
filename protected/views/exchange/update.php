<?php
$this->breadcrumbs=array(
	'Exchanges'=>array('index'),
	$model->id_exchange=>array('view','id'=>$model->id_exchange),
	'Actualizar',
);

	$this->menu=array(
	array('label'=>'Listar Exchange','url'=>array('index')),
	array('label'=>'Crear Exchange','url'=>array('create')),
	array('label'=>'Detallar Exchange','url'=>array('view','id'=>$model->id_exchange)),
	array('label'=>'Administrar Exchange','url'=>array('admin')),
	);
	?>

	<span class="ez">Actualizar Exchange</span>

<div class="pd-inner">
    <?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
</div>