local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
local EnemyTank = EnemyTank or require "Scripts/EnemyTank"
local Score = Score or require "Scripts/Score"
local Bala = Actor:extend()


s = Score:extend()
function Bala:new(x,y,fwdX,fwdY, r)
  Bala.super.new(self, "Textures/Bala.png", x, y, 400, fwdX, fwdY)
  self.forward:normalize()
  self.rot=r
  
end

function Bala:update(dt)
  Bala.super.update(self, dt)
  for key, value in ipairs(balaList) do
  if value.position.x < 0 or value.position.x > love.graphics.getWidth() or value.position.y < 0 or value.position.y > love.graphics.getHeight() then
    table.remove(balaList, key)
    
  end
  balaCollision()
 
  
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
function balaCollision()
  for x, enemy in ipairs(enemyList) do
   for i, bala in ipairs(balaList) do
     for a, timer in ipairs(timerList) do
     if enemy.position.x+enemy.width > bala.position.x and enemy.position.x < bala.position.x+bala.width and enemy.position.y+enemy.height > bala.position.y and enemy.position.y < bala.position.y+bala.height then
       table.remove(balaList, i)
       if enemy.position.x+enemy.width > timer.position.x and enemy.position.x < timer.position.x+timer.width and enemy.position.y+enemy.height > timer.position.y and enemy.position.y < timer.position.y+timer.height then
       
       table.remove(timerList, a)
       table.remove(enemyList, x)
       s.points=s.points+10*s.combo
       s.combo=s.combo+1
     end
   end
   end
   end
 end
   end


return Bala