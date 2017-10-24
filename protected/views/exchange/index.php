<?php
$this->breadcrumbs=array(
	'Exchanges',
);

$this->menu=array(
array('label'=>'Crear Exchange','url'=>array('create')),
array('label'=>'Administrar Exchange','url'=>array('admin')),
);
?>

<span class="ez">Exchange</span>

<div class="pd-inner">
    <?php $this->widget('booster.widgets.TbListView',array(
    'dataProvider'=>$dataProvider,
    'itemView'=>'_view',
    )); ?>
</div>