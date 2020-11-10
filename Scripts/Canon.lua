
local Actor = Actor or require "Scripts/actor"
local Tank = Tank or require "Scripts/Tank"
local Vector = Vector or require "Scripts/vector"
local Bala = Bala or require "Scripts/Bala"
local Canon = Actor:extend()
t=Tank:extend()
function Canon:new()
  Canon.super.new(self, "Textures/Canon.png", 400,300,0)
  self.rotSpeed=0
  shoot=false
  timeShoot=0
end

function Canon:update(dt)
Canon.super.update(self, dt)
self.position=t.position
def= Vector.new(love.mouse.getPosition())
fwdRotX=(def.x-self.position.x)
fwdRotY=(def.y-self.position.y)
fwdRot=(def-self.position)
self.rot=Vector.ang(fwdRot)+math.pi/2
timeShoot= timeShoot + dt
  if timeShoot > 0.4 then
    shoot = true
  end
  
end

function Canon:draw()
  cxx = self.position.x
  cox = self.origin.x
  cyy = self.position.y
  coy = self.origin.y
  csx = self.scale.x
  csy = self.scale.y
  crr = self.rot
  love.graphics.draw(self.image,cxx,cyy,crr,csx,csy,cox,coy,0,0)
end
function love.mousepressed (x, y, button, istouch)
  if button == 1 then
    canonFwdBalaX=fwdRotX
    canonFwdBalaY=fwdRotY
    if shoot==true then
    b = Bala(cxx, cyy, canonFwdBalaX, canonFwdBalaY, crr)
    table.insert(balaList, b)
    shoot=false
    timeShoot=0
  end
end
end

return Canon