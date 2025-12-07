extends RichTextLabel

func _on_printed(message:String)->void:
	match message:
		"WIN", "DRAW", "LOSS":
			self.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
			self.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
			self.text=str(message)
		_:
			self.add_text(str("\n",message))
