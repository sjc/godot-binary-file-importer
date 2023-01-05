#
# binary_files.gd
# sjc - 30/12/22
# An editor plugin to allow the loading of binary files
#

#
# Based on sample code at:
#	- https://godotengine.org/qa/105703/how-to-import-a-custom-resource
#
# All aditional mistakes my own
#

tool
extends EditorPlugin

var import_plugin: EditorImportPlugin = null

func _enter_tree():
	self.import_plugin = preload("import_plugin.gd").new()
	add_custom_type("BinaryFile", "Resource", preload("BinaryFile.gd"), null)
	add_import_plugin(self.import_plugin)


func _exit_tree():
	remove_import_plugin(self.import_plugin)
	remove_custom_type("BinaryFile")
	self.import_plugin = null
