#
# binary_files/import_plugin.gd
# sjc - 30/12/22
#

#
# Based on https://godotengine.org/qa/105703/how-to-import-a-custom-resource
#

tool
extends EditorImportPlugin

const BinaryFile = preload("BinaryFile.gd")

enum ArrayType {
	Byte,
	Int,
}

func get_importer_name():
	return "sjc.binary_files"

func get_visible_name():
	return "Binary Data"

func get_recognized_extensions():
	return ["bin", "bytes"]

func get_save_extension():
	return "res"

func get_resource_type():
	return "Resource"

func get_preset_count():
	return 1

func get_preset_name(preset):
	return "Default"

func get_import_options(preset):
	return [{
		"name": "array_type",
		"default_value": 0,
		"property_hint": PROPERTY_HINT_ENUM,
		"hint_string": "PoolByteArray,PoolIntArray", # TODO build this from the ENUM
	}]

func get_option_visibility(option, options):
	return true

func import(source_file, save_path, options, r_platform_variants, r_gen_files):
	
	var file = File.new()
	var err = file.open(source_file, File.READ)
	if err != OK:
		return err
	
	var resource = BinaryFile.new()
	match options.get("array_type", 0):
		ArrayType.Byte: # PoolByteArray
			resource.data = _import_bytes(file)
		ArrayType.Int: # PoolIntArray
			resource.data = _import_ints(file)
	
	file.close()
	
	var filename = "%s.%s" % [save_path, get_save_extension()]
	
	return ResourceSaver.save(filename, resource)

func _import_bytes(file: File) -> PoolByteArray:
	var array = PoolByteArray()
	while not file.eof_reached():
		array.append(file.get_8())
	return array

func _import_ints(file: File) -> PoolIntArray:
	var array = PoolIntArray()
	while not file.eof_reached():
		array.append(file.get_32())
	return array
