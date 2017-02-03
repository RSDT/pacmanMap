#when not defined(js):
  #{.fatal: "Compile this program with the js command!".}
type
  Map* =object
  ControlCentre* = ref object of RootObj
    map: Map
  Player* = object
    map*: Map
    name*: string
  FireBaseDataBase* = object
  FireBaseDataBaseEntry = ref object of RootObj
  FireBaseSnapShot* = ref object of RootObj
  FireBaseValue* = ref object of RootObj
#[
    location*: ref object of Rootobj
      lat*: float
      lng*: float
    ]#
  FireBaseEntry* = enum
    PinkyE, PacmanE, ClydeE, InkyE, BlinkyE
proc createMap(): Map {.importc.}

proc  `=`*(d: var Map ,src:Map )= 
  d = createMap()

proc addButton* (this:ControlCentre, label:string, start_kleur:string, onclick:proc): void {.importc.}
proc newPlayer*(map:Map, name:string): Player{.importc:"Player".}
proc startAnimation*(this:Player,interval:int):void {.importc.}
proc stopAnimation*(this:Player):void {.importc.}
proc setPowerUp*(this:Player, powerup:bool):void {.importc.}
proc setLocation*(this:Player, lat:float, lon:float):void {.importc.}
proc getName*(this:Player):string {.importc.} 

proc createFireBaseConfig(): FireBaseDataBase {.importc.}
proc `=`*(this: var FireBaseDataBase, src:FireBaseDataBase) =
  this =createFireBaseConfig()

proc reference(this:FireBaseDataBase, entry:string):FirebaseDatabaseEntry{.importc.}

proc on(this:FirebaseDatabaseEntry, event:string, handler:proc(val:FireBaseSnapShot)):void{.importc.}

proc `$`(e: FirebaseEntry): string = 
  case e
  of PacmanE:
    return "players/pacman"
  of PinkyE:
    return "players/pinky"
  of ClydeE:
    return "players/clyde"
  of InkyE:
    return "players/inky"
  of BlinkyE:
    return "players/blinky"

proc addListener*(this:FireBaseDataBase, player: FirebaseEntry,handler: proc(val:FireBaseSnapShot)): void = 
  this.reference($player).on("value", handler) 

proc val*(snapshot: FireBaseSnapShot): FireBaseValue{.importc.}