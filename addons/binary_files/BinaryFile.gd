#
# BinaryFile.gd
# sjc - 30/12/22
# A custom resource wrapper around a PoolByteArray or PoolIntArray built from a binary file

#
# Suggested use:
# 	var my_data: PoolByteArray = preload("res://my-binary-file.bin").data
#

tool
extends Resource
class_name BinaryFile

export var data = "<Empty>"
