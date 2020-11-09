local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
--local Zombie = Zombie or require "Scripts/Zombie"
local Bala = Actor:extend()



function Bala:new(x,y,fwdX,fwdY, r)
  Bala.super.new(self, "Textures/Bala.png", x, y, 500, fwdX, fwdY)
  self.forward:normalize()
  self.rot=r
  
end

function Bala:update(dt)
  Bala.super.update(self, dt)
  for key, value in ipairs(balaList) do
  if value.position.x < 0 or value.position.x > love.graphics.getWidth() or value.position.y < 0 or value.position.y > love.graphics.getHeight() then
    table.remove(balaList, key)
    print("HOLA")
  end
  end
end


function Bala:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end


return Bala