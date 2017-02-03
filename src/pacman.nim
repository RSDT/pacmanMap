import times
import jsinterface
import tables
import locations

type
  ID = distinct int
  Direction = enum
    UP, LEFT, RIGHT, DOWN
  
  PlayerEntity = enum
    Pacman, Blinky, Pinky, Inky, Clyde
  PlayerPosition = ref object of Location
    player: Player
    time: float
    id: ID
  DotEntity = enum
    Dot, BigDot
  DotPosition = ref object of Location
    name: DotEntity
    id: ID
  KindOfMap = enum
    GhostMap, PacmanMap, OverviewMap

const kindOfMap: KindOfMap = GhostMap
var lastID:int = 0

proc `$`(player: PlayerEntity): string =
  case player
  of Pacman:
    return "pacman"
  of Blinky:
    return "blinky"
  of Inky:
    return "inky"
  of Pinky:
    return "pinky"
  of Clyde:
    return "clyde"

template loop[T](container: var T, body:untyped):typed =
  let startfrom:T = container
  var
    pre, suc: T
    goDown=true
    goUp=true
  try:
    pre = pred(startFrom)
  except EOutOfRange:
    pre = startFrom
    goDown = false
  suc = startFrom
 
  while goUp or goDown:
    if goUp:
      container = suc
      body
      try:
        suc =  succ(suc)
      except EOutOfRange:
        goUp = false
    if goDown:
      container = pre
      body
      try:
        pre = pred(pre)
      except EOutOfRange:
        goDown= false
    


proc newID(): ID=
  result= ID(lastID)
  lastID += 1

proc `=PlayerPosition`(latitude:float, longitude:float, player: Player ): PlayerPosition =
  result.latitude = latitude
  result.longitude = longitude
  result.id = newID()
  result.player = player
  result.time = epochTime() 

proc initMap():void{.exportc.} = 
  var map = Map()
  var controlcentre =ControlCentre()
  var database = FirebaseDataBase()

proc createPlayers(map: Map): Table[PlayerEntity,Player] =
  var player: PlayerEntity = Pacman
  player.loop:
    result[player] = newPlayer(map, $PlayerEntity(player))
    result[player].startAnimation(5)
    


proc movePlayer(pos: PlayerPosition, player:Player): void =
  if player.getName() != $pos.player:
    return #todo raise error
  else:
    player.setLocation(pos.latitude, pos.longitude)


proc onNewLocation(player: Player,lon:float, lat:float):void {.exportc.} =
  var playerLoc: PlayerPosition = PlayerPosition()
  playerLoc.longitude = lon
  playerLoc.latitude = lat
  playerLoc.player = player
  playerLoc.time = epochTime()
  when kindOfMap == GhostMap:
    const x = 300
    const y = 10
    if y < x:
      var e = new(Exception)
      e.msg = "y < x"
      raise e
    var showPlayer: bool = true
    if player.getName() == $Pacman:
      showPlayer = (int(playerLoc.time) mod x) < y # show player once every x seconds for y seconds
    else:
      showPlayer = true
  else:
    let showPlayer:bool = true
  if showPlayer:
    movePlayer(playerLoc, player)



proc main() = 

when isMainModule:
  main()
