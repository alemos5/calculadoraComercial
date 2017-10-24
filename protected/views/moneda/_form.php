<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'moneda-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="alert alert-warning">Los campos requeridos contienen <span class="required">*</span>.</p>

<?php echo $form->errorSummary($model); ?>
<div class="row">
    <div class="col-sm-12 col-md-4">
        <?php $data = CHtml::listData(Exchange::model()->findAll(), 'id_exchange', 'exchange');
        echo $form->dropDownListGroup($model,'id_exchange',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5'),'data'=>array(''=>'Seleccione...')+$data), 'labelOptions'=>array('label'=>'Exchange:'))); ?>
    </div>
    <div class="col-sm-12 col-md-4">
        <?php echo $form->textFieldGroup($model,'moneda',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>250)))); ?>
    </div>
    <div class="col-sm-12 col-md-4">
        <?php echo $form->textFieldGroup($model,'abv',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 col-md-6">
        <?php echo $form->textFieldGroup($model,'url',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>250)))); ?>
    </div>
    <div class="col-sm-12 col-md-6">
        <?php echo $form->dropDownListGroup($model,'estatus',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5'), 'data' => array('1' => 'Activo', '0'=>'Inactivo' ),), 'labelOptions'=>array('label'=>'Estatus:'))); ?>
    </div>
</div>
    
<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Crear' : 'Actualizar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
