<?php
$this->breadcrumbs=array(
	'Impuestos',
);

$this->menu=array(
array('label'=>'Create Impuesto','url'=>array('create')),
array('label'=>'Manage Impuesto','url'=>array('admin')),
);
?>

<h1>Impuestos</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
