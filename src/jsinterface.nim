type
  Map = ref object of RootObj
  ControlCentre = ref object of RootObj
  Player = object
  FireBaseDataBase = ref object of RootObj
  FireBaseDataBaseEntry = ref object of RootObj
  FireBaseSnapShot = ref object of RootObj
  FireBaseValue* = ref object of RootObj
#[
    location*: ref object of Rootobj
      lat*: float
      lng*: float]#
  FireBaseEntry* = enum
    PinkyE, PacmanE, ClydeE, InkyE, BlinkyE
proc createMap(): Map {.importc.}

proc  `=Map`*(): Map = 
  result = createMap()

proc `=ControlCentre`*(map: Map):ControlCentre {.importc.}
proc addButton*(this:ControlCentre, label:string, start_kleur:string, onclick:proc): void {.importc.}

proc `=Player`*(name:string) {.importc.}

proc startAnimation*(this:Player,interval:int):void {.importc.}
proc stopAnimation*(this:Player):void {.importc.}
proc setPowerUp*(this:Player, powerup:bool):void {.importc.}
proc setLocation*(this:Player, lat:float, lon:float):void {.importc.}

proc createFireBaseConfig(): FireBaseDataBase {.importc.}

proc `=FireBaseDataBase`*():FireBaseDataBase =
  result =createFireBaseConfig()

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