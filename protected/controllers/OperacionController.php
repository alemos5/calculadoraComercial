<?php

class OperacionController extends Controller
{
/**
* @var string the default layout for the views. Defaults to '//layouts/column2', meaning
* using two-column layout. See 'protected/views/layouts/column2.php'.
*/
public $layout='//layouts/column2';

/**
* @return array action filters
*/
public function filters()
{
return array(
'accessControl', // perform access control for CRUD operations
);
}

/**
* Specifies the access control rules.
* This method is used by the 'accessControl' filter.
* @return array access control rules
*/
public function accessRules()
{
return array(
array('allow',  // allow all users to perform 'index' and 'view' actions
'actions'=>array('index','view','findMoneda', 'resultado'),
'users'=>array('*'),
),
array('allow', // allow authenticated user to perform 'create' and 'update' actions
'actions'=>array('create','update'),
'users'=>array('@'),
),
array('allow', // allow admin user to perform 'admin' and 'delete' actions
'actions'=>array('admin','delete'),
'users'=>array('admin'),
),
array('deny',  // deny all users
'users'=>array('*'),
),
);
}

/**
* Displays a particular model.
* @param integer $id the ID of the model to be displayed
*/
public function actionView($id)
{
$this->render('view',array(
'model'=>$this->loadModel($id),
));
}

/**
* Creates a new model.
* If creation is successful, the browser will be redirected to the 'view' page.
*/
public function actionCreate()
{
$model=new Operacion;

// Uncomment the following line if AJAX validation is needed
// $this->performAjaxValidation($model);
//echo date(); die();
if(isset($_POST['Operacion']))
{
    $dia = date('Y-m-d');
$model->attributes=$_POST['Operacion'];
$model->fecha_reg =$dia;
if($model->save())
$this->redirect(array('view','id'=>$model->id_operacion));
}

$this->render('create',array(
'model'=>$model,
));
}

/**
* Updates a particular model.
* If update is successful, the browser will be redirected to the 'view' page.
* @param integer $id the ID of the model to be updated
*/
public function actionUpdate($id)
{
    $dia = date('Y-m-d');
//echo $dia;
//     die();
$model=$this->loadModel($id);

// Uncomment the following line if AJAX validation is needed
// $this->performAjaxValidation($model);

if(isset($_POST['Operacion']))
{
$model->attributes=$_POST['Operacion'];
$model->fecha_mod = $dia;
if($model->save())
$this->redirect(array('view','id'=>$model->id_operacion));
}

$this->render('update',array(
'model'=>$model,
));
}

/**
* Deletes a particular model.
* If deletion is successful, the browser will be redirected to the 'admin' page.
* @param integer $id the ID of the model to be deleted
*/
public function actionDelete($id)
{
if(Yii::app()->request->isPostRequest)
{
// we only allow deletion via POST request
$this->loadModel($id)->delete();

// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
if(!isset($_GET['ajax']))
$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
}
else
throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
}

/**
* Lists all models.
*/
public function actionIndex()
{
$dataProvider=new CActiveDataProvider('Operacion', array(
  'sort'=>array(
    'defaultOrder'=>'id_operacion DESC',
  ))
);
$this->render('index',array(
'dataProvider'=>$dataProvider,
));
}

public function actionResultado()
{
//    echo var_dump($_POST);
//    die();
//    $dataProvider=new CActiveDataProvider('Operacion');
    $dia = date('Y-m-d');
    $dataProvider = Operacion::model()->findAll("id_tipo_operacion != 4 AND fecha_reg = '".$dia."' Order by id_operacion DESC");
    $subscripcion = 0;
    if($_POST['Operacion']){
        
        
        if(Yii::app()->user->isGuest){
            if(date("Y-m-d", strtotime($_POST['Operacion']['fecha_reg'])) > date('Y-m-d')){
                $subscripcion = 1;
            }else{
                $subscripcion = 0;
            }
        }
        if($subscripcion != 1){
            if($_POST['Operacion']['fecha_reg']){
                $fechaSeleccionada = date("Y-m-d", strtotime($_POST['Operacion']['fecha_reg']));
            }else{
                $fechaSeleccionada = date('Y-m-d');
            }

            if($_POST['Operacion']['id_exchange']){
                $exchange = " OR id_exchange = ".$_POST['Operacion']['id_exchange']."";
            }else{
                $exchange ="";
            }
            $dataProvider = Operacion::model()->findAll("id_tipo_operacion != 4 AND fecha_reg = '".$fechaSeleccionada."'".$exchange.' Order by id_operacion DESC' );
        }else{
            $dataProvider = Operacion::model()->findAll("id_tipo_operacion != 4 AND fecha_reg = '".$dia."' Order by id_operacion DESC");
        }
    }
    
    
    
    $this->render('resultado',array(
        'dataProvider'=>$dataProvider, 'subscripcion'=>$subscripcion
    ));
}

/**
* Manages all models.
*/
public function actionAdmin()
{
$model=new Operacion('search');
$model->unsetAttributes();  // clear any default values
if(isset($_GET['Operacion']))
$model->attributes=$_GET['Operacion'];

$this->render('admin',array(
'model'=>$model,
));
}

/**
* Returns the data model based on the primary key given in the GET variable.
* If the data model is not found, an HTTP exception will be raised.
* @param integer the ID of the model to be loaded
*/
public function loadModel($id)
{
$model=Operacion::model()->findByPk($id);
if($model===null)
throw new CHttpException(404,'The requested page does not exist.');
return $model;
}

/**
* Performs the AJAX validation.
* @param CModel the model to be validated
*/
protected function performAjaxValidation($model)
{
if(isset($_POST['ajax']) && $_POST['ajax']==='operacion-form')
{
echo CActiveForm::validate($model);
Yii::app()->end();
}
}

public function actionfindMoneda() {
  if ($_GET['exchange'] == 0){
      echo "Debe seleccionar un exchange";
  }else{
    if (isset($_GET['term'])) {
      $exchange = $_GET['exchange'];  
      if(isset($_GET['onlyId'])) $data = Moneda::model()->findAll('id_moneda::TEXT = :term AND estatus=1 AND id_exchange ='.$exchange, array(':term'=>$_GET['term']));
      else $data = Moneda::model()->findAll('(id_moneda LIKE :term OR moneda LIKE :term OR abv LIKE :term) AND estatus=1 AND id_exchange ='.$exchange, array(':term'=>'%'.$_GET['term'].'%'));
      echo CJSON::encode($data);
    }
  }
  Yii::app()->end();
}

}
