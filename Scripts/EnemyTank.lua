local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
local Tank = Tank or require "Scripts/Tank"
local enemyBala = enemyBala or require "Scripts/enemybala"
local Timer = Timer or require "Scripts/Timer"
local EnemyTank = Actor:extend()


t=Tank:extend()
function EnemyTank:new(x,y)
  EnemyTank.super.new(self, "Textures/EnemyTank.png", x, y, 60)
  f = Timer:extend()
  table.insert(timerList, f)
  f:new(3, Shoot, true,x,y)
  
  
end

function EnemyTank:update(dt)
  f.position=self.position
  f.height=self.height
  f.width=self.width
  EnemyTank.super.update(self, dt)
  self.forward=(t.position-self.position):normalize()
  fwd=Vector.new(t.position.x-self.position.x, t.position.y-self.position.y)
  self.rot=Vector.ang(fwd)+math.pi/2
  fwdBalaX=self.forward.x
  fwdBalaY=self.forward.y

end


function EnemyTank:draw()
  rxx = self.position.x
  rox = self.origin.x
  ryy = self.position.y
  roy = self.origin.y
  rsx = self.scale.x
  rsy = self.scale.y
  rrr = self.rot
  love.graphics.draw(self.image,rxx,ryy,rrr,rsx,rsy,rox,roy,0,0)
end
function Shoot()
  
  local v = enemyBala(rxx,ryy, fwdBalaX, fwdBalaY, rrr)
  table.insert(enemyBalaList, v)
end


return EnemyTank