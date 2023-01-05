# godot-binary-file-importer

Import binary files into Godot as arrays of bytes ([`PoolByteArray`](https://docs.godotengine.org/en/stable/classes/class_poolbytearray.html)) or 32-bit ints ([`PoolIntArray`](https://docs.godotengine.org/en/stable/classes/class_poolintarray.html)).

## Instalation

1. Clone or download this repository.
2. Copy the `addons/binary_files` directory into your Godot project.
3. Enable the plugin from the "Plugins" tab of the "Project Settings…" dialogue.

## Use

This plugin allows you to access the contents of a binary file as an array of bytes or ints.

1. Drag the binary file into the "FileSystem" tab in your project. This plugin recognises files with `.bin` and `.bytes` file extensions.
2. By default, the file is converted to an array of bytes (`PoolByteArray`). If you want access the contents of the file as an array of ints (`PoolIntArray`) instead, select the file in the "FileSystem" tab, select the "Import" tab above it, change the "Array Type" to "PoolIntArray", and click "Reimport".
3. Access the converted array in your project via the `.data` property of the loaded resource. eg.:

```
var my_data_array: PoolByteArray = preload("res://my-binary-file.bin").data
```

## Known Issues

The `data` property of the created resource has to be marked `export` for the process to work. This means that the editor attempts to display the contents of the converted array if you double-click to the binary file in the "FileSystem" tab. The data takes a long time to prepare for display, and the editor appears to hang while this preparation is taking place.
