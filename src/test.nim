
import math
type
 MyEnum = enum
    Val0, Val1, Val2, Val3, Val4

template loop[T](container: var T, body:untyped):typed =
  #[

    this template will iterate of all values starting at startfrom and then itterating to both sides
   ]#
  let startfrom:T = container
  var
    pre, suc: T
    goDown=true
    goUp=true
  try:
    pre = pred(startFrom)
  except OverflowError:
    pre = startFrom
    goDown = false
    echo "started at bottom"
  suc = startFrom
 
  while goUp or goDown:
    if goUp:
      container = suc
      body
      try:
        suc =  succ(suc)
      except OverflowError:
        goUp = false
        echo "reached top"
    if goDown:
      container = pre
      body
      try:
        pre = pred(pre)
      except OverflowError:
        goDown= false
        echo "reached bottom"

var i: Myenum = Val4
i.loop:
  echo $i
let a = -22
let b = -2
let n = 7
echo $(a mod 7)
echo $((a mod n) mod n)

echo $((a + b) mod n)
echo $(((a mod n) + (b mod n)) mod n)
echo $((a * b) mod n)
echo $(((a mod n) * (b mod n)) mod n)
echo $((a / b) mod float(n))
echo $((float((a mod n)) * ((1 / b) mod float(n))) mod float(n))

echo $(((float(a * b) mod float(n)) * ((1/b) mod float(n))) mod float(n))
echo $(float(a) mod float(n))