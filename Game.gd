extends Node2D

const TILE_SIZE = 32

const LEVEL_SIZES = [
	Vector2(30,30),
	Vector2(35,35),
	Vector2(40,40),
	Vector2(45,45),
	Vector2(50,50),
]

const LEVEL_ROOM_COUNTS = [5, 7, 9, 12, 15]
const MIN_ROOM_DIMENSION = 5
const MAX_ROOM_DIMENSION = 8

enum Tile {Wall, Door, Floor, Ladder, Stone}

# Current level ------------------------------

var level_num = 0
var map = []
var rooms = []
var level_size

# Node refs ---------------------------------

onready var tile_map = $TileMap
onready var player = $Player

# Game State --------------------------------

var player_tile
var score = 0

func _ready():
	OS.set_window_size(Vector2(1280,720))
	randomize()
	build_level()
	
func build_level():
	#Start with a blank map
	
	rooms.clear()
	map.clear()
	tile_map.clear()
	
	level_size = LEVEL_SIZES[level_num]
	for x in range(level_size.x):
		map.append([])
		for y in range(level_size.y):
			map[x].append(Tile.Ladder)
			tile_map.set_cell(x, y, Tile.Ladder)



