<?php

/**
 * This is the model class for table "moneda".
 *
 * The followings are the available columns in table 'moneda':
 * @property integer $id_moneda
 * @property integer $id_exchange
 * @property string $moneda
 * @property integer $estatus
 * @property integer $id_usuario_sistema_reg
 * @property string $fecha_reg
 * @property string $ip_reg
 * @property integer $id_usuario_sistema_mod
 * @property string $fecha_mod
 * @property string $ip_mod
 * @property string $abv
 * @property string $url
 *
 * The followings are the available model relations:
 * @property Exchange $idExchange
 * @property Operacion[] $operacions
 */
class Moneda extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'moneda';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_exchange, moneda, abv', 'required'),
			array('id_exchange, estatus, id_usuario_sistema_reg, id_usuario_sistema_mod', 'numerical', 'integerOnly'=>true),
			array('moneda, url', 'length', 'max'=>250),
			array('ip_reg, ip_mod', 'length', 'max'=>20),
			array('abv', 'length', 'max'=>100),
			array('fecha_reg, fecha_mod', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_moneda, id_exchange, moneda, estatus, id_usuario_sistema_reg, fecha_reg, ip_reg, id_usuario_sistema_mod, fecha_mod, ip_mod, abv, url', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idExchange' => array(self::BELONGS_TO, 'Exchange', 'id_exchange'),
			'operacions' => array(self::HAS_MANY, 'Operacion', 'id_moneda'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_moneda' => 'Identificador',
			'id_exchange' => 'Exchange',
			'moneda' => 'Moneda',
			'estatus' => 'Estatus',
			'id_usuario_sistema_reg' => 'Id Usuario Sistema Reg',
			'fecha_reg' => 'Fecha Reg',
			'ip_reg' => 'Ip Reg',
			'id_usuario_sistema_mod' => 'Id Usuario Sistema Mod',
			'fecha_mod' => 'Fecha Mod',
			'ip_mod' => 'Ip Mod',
			'abv' => 'Abreviatura',
			'url' => 'URL',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id_moneda',$this->id_moneda);
		$criteria->compare('id_exchange',$this->id_exchange);
		$criteria->compare('moneda',$this->moneda,true);
		$criteria->compare('estatus',$this->estatus);
		$criteria->compare('id_usuario_sistema_reg',$this->id_usuario_sistema_reg);
		$criteria->compare('fecha_reg',$this->fecha_reg,true);
		$criteria->compare('ip_reg',$this->ip_reg,true);
		$criteria->compare('id_usuario_sistema_mod',$this->id_usuario_sistema_mod);
		$criteria->compare('fecha_mod',$this->fecha_mod,true);
		$criteria->compare('ip_mod',$this->ip_mod,true);
		$criteria->compare('abv',$this->abv,true);
		$criteria->compare('url',$this->url,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Moneda the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
