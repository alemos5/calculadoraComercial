<?php

/**
 * This is the model class for table "exchange".
 *
 * The followings are the available columns in table 'exchange':
 * @property integer $id_exchange
 * @property string $exchange
 * @property integer $estatus
 * @property integer $id_usuario_sistema_reg
 * @property string $fecha_reg
 * @property string $ip_reg
 * @property integer $id_usuario_sistema_mod
 * @property string $fecha_mod
 * @property string $ip_mod
 *
 * The followings are the available model relations:
 * @property Moneda[] $monedas
 * @property Operacion[] $operacions
 */
class Exchange extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'exchange';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('exchange', 'required'),
			array('estatus, img, id_usuario_sistema_reg, id_usuario_sistema_mod', 'numerical', 'integerOnly'=>true),
			array('exchange', 'length', 'max'=>250),
			array('ip_reg, ip_mod', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_exchange, img, exchange, estatus, id_usuario_sistema_reg, fecha_reg, ip_reg, id_usuario_sistema_mod, fecha_mod, ip_mod', 'safe', 'on'=>'search'),
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
			'monedas' => array(self::HAS_MANY, 'Moneda', 'id_exchange'),
			'operacions' => array(self::HAS_MANY, 'Operacion', 'id_exchange'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_exchange' => 'Identificador',
			'exchange' => 'Exchange',
			'estatus' => 'Estatus',
			'id_usuario_sistema_reg' => 'Id Usuario Sistema Reg',
			'fecha_reg' => 'Fecha Reg',
			'ip_reg' => 'Ip Reg',
			'id_usuario_sistema_mod' => 'Id Usuario Sistema Mod',
			'fecha_mod' => 'Fecha Mod',
			'ip_mod' => 'Ip Mod',
                        'img'=>'Imagen'
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

		$criteria->compare('id_exchange',$this->id_exchange);
		$criteria->compare('exchange',$this->exchange,true);
		$criteria->compare('estatus',$this->estatus);
		$criteria->compare('id_usuario_sistema_reg',$this->id_usuario_sistema_reg);
		$criteria->compare('fecha_reg',$this->fecha_reg,true);
		$criteria->compare('ip_reg',$this->ip_reg,true);
		$criteria->compare('id_usuario_sistema_mod',$this->id_usuario_sistema_mod);
		$criteria->compare('fecha_mod',$this->fecha_mod,true);
		$criteria->compare('ip_mod',$this->ip_mod,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Exchange the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
