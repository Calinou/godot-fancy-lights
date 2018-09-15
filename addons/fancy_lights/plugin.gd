# Godot Fancy Lights: Plugin registration
#
# Copyright © 2018 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.

tool
extends EditorPlugin

func _enter_tree():
	add_custom_type(
		"FancyOmniLight",
		"OmniLight",
		preload("fancy_omni_light.gd"),
		preload("icon.svg")
	)

func _exit_tree():
	remove_custom_type("FancyOmniLight")
