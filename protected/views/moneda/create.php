<?php
$this->breadcrumbs=array(
	'Monedas'=>array('index'),
	'Crear',
);

$this->menu=array(
array('label'=>'Listar Monedas','url'=>array('index')),
array('label'=>'Administrar Monedas','url'=>array('admin')),
);
?>

<span class="ez">Crear Moneda</span>

<div class="pd-inner">
    <?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
</div>