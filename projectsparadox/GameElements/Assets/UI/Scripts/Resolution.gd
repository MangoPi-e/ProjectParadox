extends OptionButton

@onready var resolutions = {
	"720p (HD)": Vector2i(1280, 720),
	"1080p (Full HD)": Vector2i(1920, 1080)
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AddResolution() 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func AddResolution():
	for r in resolutions:
		self.add_item(r)


func _on_item_selected(index: int) -> void:
	var Size = resolutions.get((self.get_item_text(index)))
	DisplayServer.window_set_size(Size)
	var viewport = get_viewport()
	viewport.size = Size
	
	
