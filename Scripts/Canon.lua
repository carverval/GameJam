
local Actor = Actor or require "Scripts/actor"
local Tank = Tank or require "Scripts/Tank"
local Vector = Vector or require "Scripts/vector"
local Bala = Bala or require "Scripts/Bala"
Canon = Actor:extend()
t=Tank()
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
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end
function love.mousepressed (x, y, button, istouch)
  if button == 1 then
    fwdBalaX=fwdRotX
    fwdBalaY=fwdRotY
    if shoot==true then
    b = Bala(xx, yy, fwdBalaX, fwdBalaY, rr)
    table.insert(balaList, b)
    shoot=false
    timeShoot=0
  end
end
end

return Canon