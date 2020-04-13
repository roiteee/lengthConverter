extends Control

var length1Units
var length2Units
var length1
var length2


var lengthUnits = {
	0: {
		"name": "Kilometer",
		"to_meter": 1000.0
	},
	1:{
		"name": "Meter",
		"to_meter": 1.0
	},
	2:{
		"name": "Centimeter",
		"to_meter": 0.01
	},
	3:{
		"name": "Millimeter",
		"to_meter": 0.001
	},
	4:{
		"name": "Mile",
		"to_meter": 1609.0
	},
	5:{
		"name": "Yard",
		"to_meter": 0.9144
	},
	6:{
		"name": "Foot",
		"to_meter": 0.3048
	},
	7:{
		"name": "Inch",
		"to_meter": 0.0254
	}
}

func _ready():
	for i in lengthUnits:
		var lengths =  lengthUnits[i]
		$Panel/OptionButton1.add_item(lengthUnits[i].name)
		$Panel/OptionButton2.add_item(lengthUnits[i].name)
		
#	$Panel/OptionButton1.selected = 1
#
#	print($Panel/OptionButton1.get_item_text(1))
	
	



func _on_LineEdit_1_text_changed(new_text):
	print(new_text)
	if str(new_text).is_valid_integer():
		length1Units = $Panel/OptionButton1.get_selected_id()
		length2Units = $Panel/OptionButton2.get_selected_id()
		length2 = int(new_text) * lengthUnits[length1Units].to_meter / lengthUnits[length2Units].to_meter
		$"Panel/LineEdit 2".text = str(length2)
