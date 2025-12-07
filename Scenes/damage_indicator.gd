extends Label

	#self.visible=false
#
func animate_pop():
	#var node = team.get_children()[index]
	#self.global_position=node.global_position+Vector2(20,28)
	self.pivot_offset = self.size / 2
	self.scale = Vector2.ZERO
	#self.visible=true
	
	var default_speed := 0.3
	var t = create_tween()
	t.tween_property(self, 'scale', Vector2.ONE, default_speed).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	t.tween_interval(0.30)
	
	t.tween_callback(func():
		queue_free()
	)

	#return t.finished
