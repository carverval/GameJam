local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
local Mina = Actor:extend()



function Mina:new(x,y)
  Mina.super.new(self, "Textures/Mina.png", x, y)
  self.speed=0
  
end

function Mina:update(dt)
  Mina.super.update(self, dt)
  MinaCollision()

end


function Mina:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end
function MinaCollision()
for x, enemy in ipairs(enemyList) do
   for i, mina in ipairs(minaList) do
     if enemy.position.x+enemy.width > mina.position.x and enemy.position.x < mina.position.x+mina.width and enemy.position.y+enemy.height > mina.position.y and enemy.position.y < mina.position.y+mina.height then
       table.remove(minaList, i)
       table.remove(enemyList, x)
     
   end
   end
   end
 end



return Mina