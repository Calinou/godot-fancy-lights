# Godot Fancy Lights: OmniLight
#
# Copyright © 2018 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.

tool
extends OmniLight

export(float, 0.0, 5.0) var corona_intensity = 1.0 setget _corona_intensity_changed
export(float, 0.0, 5.0) var corona_size = 1.0 setget _corona_size_changed
export(float, 0.0, 5.0) var corona_proximity_fade = 1.0 setget _corona_proximity_fade_changed

onready var mesh2 := MeshInstance.new()

func _ready():
	mesh2.mesh = preload("res://addons/fancy_lights/resources/corona.tres")
	add_child(mesh2)

func _corona_intensity_changed(value):
	corona_intensity = value

	# This function may be called before _ready() is called
	if not mesh2:
		return

	var material = mesh2.mesh.material as SpatialMaterial
	material.albedo_color = light_color*corona_intensity

func _corona_size_changed(value):
	corona_size = value

	# This function may be called before _ready() is called
	if not mesh2:
		return

	var material = mesh2.mesh.material as SpatialMaterial
	mesh2.mesh.size = Vector2(1, 1)*omni_range*2.5*corona_size/omni_attenuation
	material.proximity_fade_distance = mesh2.mesh.size.x*0.5*corona_proximity_fade
	material.distance_fade_max_distance = mesh2.mesh.size.x*0.5*corona_proximity_fade

func _corona_proximity_fade_changed(value):
	corona_proximity_fade = value

	# This function may be called before _ready() is called
	if not mesh2:
		return

	var material = mesh2.mesh.material as SpatialMaterial
	material.proximity_fade_distance = mesh2.mesh.size.x*0.5*corona_proximity_fade
	material.distance_fade_max_distance = mesh2.mesh.size.x*0.5*corona_proximity_fade
