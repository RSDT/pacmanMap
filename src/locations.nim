import math
type
  Angle* = float
  Radians = float
  Location* = ref object of RootObj
    latitude: float
    longitude:  float

proc toAngle(r: Radians): Angle {.noSideEffect.} = 
  let x = (r*180.0)/Pi
  if x < 0:
    result = Angle(360 + x)
  else:
    result = Angle(x mod 360)

proc toRadians(a: float):Radians{.noSideEffect.} = 
  result = a * Pi/180

proc toRadians[T](a: T): Radians {.noSideEffect.} =
  result = float(a).toRadians()
  

proc getBearingTo* (fromLocation:Location, toLocation:Location): Angle {.noSideEffect.} =
  let 
    lat1 = fromLocation.latitude.toRadians()
    lon1 = fromLocation.longitude.toRadians()
    lat2 = toLocation.latitude.toRadians()
    lon2 = toLocation.longitude.toRadians()
  let dlat = lat2 - lat1
  var dlon = lon2 - lon1
  let dPhi = ln(tan(lat2 / 2.0 + Pi / 4.0) / tan(lat1 / 2.0 + Pi / 4.0))
  if abs(dLon) > Pi:
     if dLon > 0.0:
        dLon = -(2.0 * Pi - dLon)
     else:
         dLon = (2.0 * Pi + dLon)

  let bearing = (float(toAngle(arctan2(dLon, dPhi))) + 360.0) mod 360.0;
  result = toAngle(bearing)

proc newLocation*(lat:float, lon:float): Location {.noSideEffect.} =
  result = Location()
  result.latitude = lat
  result.longitude = lon