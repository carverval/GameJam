local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
Tank = Actor:extend()

function Tank:new()
  Tank.super.new(self, "Textures/Tank.png", 400,300,0,0,-1)
  self.rotSpeed=0
end

function Tank:update(dt)
Tank.super.update(self, dt)
print(self.forward)
self.speed=0

if love.keyboard.isDown("w") then 
    self.speed=30
    self.position = self.position + self.forward * self.speed * dt
end
if love.keyboard.isDown("s") then 
    self.speed=-30
    self.position = self.position + self.forward * self.speed * dt
end
if love.keyboard.isDown("a") then 
    self.rotSpeed = math.rad(-90 * dt)        
    self.forward:rotate(self.rotSpeed)
    self.forward:normalize()
    self.rot=self.rot+self.rotSpeed
end
if love.keyboard.isDown("d") then 
   self.rotSpeed = math.rad(90 *dt)    
    self.forward:rotate(self.rotSpeed)       
    self.forward:normalize()
    self.rot=self.rot+self.rotSpeed
end

end

function Tank:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Tank
