local Actor = Actor or require "Scripts/actor"
Canon = Actor:extend()

function Canon:new()
  Canon.super.new(self, "", 400,300,0)
  self.rotSpeed=0
end

function Canon:update(dt)
Canon.super.update(self, dt)
def= Vector.new(love.mouse.getPosition())
fwdRotX=(def.x-self.position.x)
fwdRotY=(def.y-self.position.y)
fwdRot=(def-self.position)
self.rot=Vector.ang(fwdRot)+math.pi
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

return Canon