extends KinematicBody

class_name  Combattente

var stats = {
	"maxhp" : 100,
	"maxmp" : 100,
	"atk" : 1,
	"def" : 1,
	"spd" : 600
}
var hp = stats.maxhp
var mp = stats.maxmp
var knownAttacks =[null, null, null, null]

var element

onready var spawnAtk = get_node("rotable/spawnAtk") 

func _init(natk = 1, ndef = 1, nhp = 100, nmp = 100, nspd = 200):
	stats.atk = natk
	stats.def = ndef
	stats.hp = nhp
	stats.mp = nmp
	stats.spd = nspd

#prende un attacco e ne crea una nuova istanza davanti al giocatore
func attacca(attacco):
	var attacked = attacco.instance()
	get_parent().add_child(attacked)
	attacked.global_transform.origin = spawnAtk.global_transform.origin
	stats.mp -= attacked.mpCost
	attacked.danno *= stats.atk

func hit(danno,element):
	stats.hp -= danno - stats.def
