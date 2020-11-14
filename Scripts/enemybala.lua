local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
local Score = Score or require "Scripts/Score"
local enemyBala = Actor:extend()


s = Score:extend()
function enemyBala:new(x,y,fwdX,fwdY, r)
  enemyBala.super.new(self, "Textures/Bala.png", x, y, 400, fwdX, fwdY)
  self.forward:normalize()
  self.rot=r
  
end

function enemyBala:update(dt)
  enemyBala.super.update(self, dt)
  for key, value in ipairs(enemyBalaList) do
  if value.position.x < 0 or value.position.x > love.graphics.getWidth() or value.position.y < 0 or value.position.y > love.graphics.getHeight() then
    table.remove(enemyBalaList, key)
    
  end
  balaEnemyCollision()
end

end


function enemyBala:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end
function balaEnemyCollision()
   for x, tank in ipairs(tankList) do
   for i, bala in ipairs(enemyBalaList) do
     if tank.position.x+tank.width > bala.position.x and tank.position.x < bala.position.x+bala.width and tank.position.y+tank.height > bala.position.y and tank.position.y < bala.position.y+bala.height then
       table.remove(enemyBalaList, i)
       s.lives=s.lives-1
       s.combo=1
       
       
       
     end
     end
   end
   end


return enemyBala