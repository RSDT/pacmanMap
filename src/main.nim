
import times
import jsinterface


type
  ID = distinct int
  Direction = enum
    UP, LEFT, RIGHT, DOWN
  Location = ref object of RootObj
    latitude: float
    longitude:  float
  PlayerEntity = enum
    Pacman, Blinky, Pinky, Inky, Clyde
  PlayerPosition = ref object of Location
    name: PlayerEntity
    time: float
    id: ID
  DotEntity = enum
    Dot, BigDot
  DotPosition = ref object of Location
    name: DotEntity
    id: ID
  KindOfMap = enum
    GhostMap, PacmanMap, OvervieuwMap
const kindOfMap: KindOfMap = OvervieuwMap
var lastID:int = 0

proc newID(): ID=
  result= ID(lastID)
  lastID += 1

proc `=PlayerPosition`(latitude:float, longitude:float, player: PlayerEntity ): PlayerPosition =
  result.latitude = latitude
  result.longitude = longitude
  result.id = newID()
  result.name = player
  result.time = epochTime() 

proc initMap():void = discard

proc movePlayer(pos: PlayerPosition): void {.importc.}

proc onNewLocation(lon:float, lat:float, player:PlayerEntity):void {.exportc.} =
  var playerLoc = PlayerPosition()
  playerLoc.longitude = lon
  playerLoc.latitude = lat
  playerLoc.name = player
  playerLoc.time = epochTime()
  if player == Pacman:
    when kindOfMap == GhostMap:
      const x = 300
      const y = 10
      if y < x:
        var e = new(Error)
        e.message = "y < x"
      if playerLoc.time % x < y: # show pacman once every x seconds for y seconds
        movePlayer(playerLoc)
    else:
      movePlayer(playerLoc)
  else:
    movePlayer(playerLoc)
  


proc main() =
  for _ in 0 ..< 6:
    discard



when isMainModule:
  main()