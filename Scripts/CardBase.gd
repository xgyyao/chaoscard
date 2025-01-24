extends Area2D
class_name CardBase

var is_dragging := false
var click_offset := Vector2.ZERO

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# 记录点击位置与卡牌中心的偏移量
			click_offset = position - get_global_mouse_position()
			is_dragging = true
			z_index = 10  # 提升被拖拽卡牌的层级
		else:
			is_dragging = false
			z_index = 0

func _physics_process(delta):
	if is_dragging:
		# 将卡牌中心对齐到鼠标位置 + 偏移量
		position = get_global_mouse_position() + click_offset
