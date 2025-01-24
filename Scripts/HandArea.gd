# HandArea.gd
extends Control

@onready var hbox = $HBoxContainer
@onready var placeholder = $DragPlaceholder

func add_card(card: CardBase):
	hbox.add_child(card)
	card.dragging_started.connect(_on_drag_start)
	card.dragging_ended.connect(_on_drag_end)

func _on_drag_start(card):
	placeholder.size = card.size
	hbox.move_child(card, hbox.get_child_count() - 1)

func _on_drag_end(card):
	var new_index = hbox.get_global_mouse_position().x / (hbox.size.x / hbox.get_child_count())
	hbox.move_child(card, clamp(round(new_index), 0, hbox.get_child_count()))
