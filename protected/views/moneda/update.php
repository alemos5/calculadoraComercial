<?php
$this->breadcrumbs=array(
	'Monedas'=>array('index'),
	$model->id_moneda=>array('view','id'=>$model->id_moneda),
	'Actualizar',
);

	$this->menu=array(
	array('label'=>'Listar Monedas','url'=>array('index')),
	array('label'=>'Crear Moneda','url'=>array('create')),
	array('label'=>'Detallar Moneda','url'=>array('view','id'=>$model->id_moneda)),
	array('label'=>'Administrar Monedas','url'=>array('admin')),
	);
	?>

	<span class="ez">Actualizar Moneda</span>

<div class="pd-inner">
    <?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
</div>