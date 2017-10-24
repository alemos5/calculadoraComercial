<?php
$this->breadcrumbs=array(
	'Exchanges'=>array('index'),
	'Crear',
);

$this->menu=array(
array('label'=>'Listar Exchange','url'=>array('index')),
array('label'=>'Administrar Exchange','url'=>array('admin')),
);
?>

<span class="ez">Crear un nuevo Exchange</span>

<div class="pd-inner">
    <?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
</div>