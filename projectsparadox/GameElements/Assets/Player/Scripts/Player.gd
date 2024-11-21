class_name Player
extends CharacterBody2D

@onready
var Anim = $Anim
@onready
var StateMachine = $StateMachine
var MovementDir = Vector2.ZERO

var ObjectsInRange: Array = []

@export
var Enabled: bool = true

func _ready():
	Global.PlayerObject = self
	StateMachine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	StateMachine.process_input(event)

func _physics_process(delta):
	if Enabled:#Check if no cutscene is on
		MovementDir#Getting the MovementDir
		MovementDir = MovementDir.normalized()#Normalize to handle (1,1) to be (cos(theta), sin(theta))
		StateMachine.process_physics(delta)#Pass to the StateMachine

func _process(delta):
	if Enabled:#Check for cutscenes
		StateMachine.process_frame(delta)


#Custom Functions
func handle_movement(_delta , Speed):#Calculate the velocity based on the Speed and the MovementDir
	velocity = MovementDir * Speed
	move_and_slide()#Apply velocity
	
	
func teleport(TargetPosition):#Handling the istant teleport/movement
	position = TargetPosition


func Animate(AnimationName: String):#MakeAnimations work
	Anim.play(AnimationName)