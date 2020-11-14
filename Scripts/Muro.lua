local Actor = Actor or require "Scripts/object"
local Vector = Vector or require "Scripts/vector"
local Muro = Actor:extend()

function Muro:new(x, y, c)
  if c == 1 then
    mur=love.graphics.newImage("Textures/muro.png")
  end
  if c == 2 then
    mur=love.graphics.newImage("Textures/muro_2.png")
  end
  
  Muro.super.new(self, mur, x, y,0)
end

function Muro:update(dt)
  Muro.super.update(self, dt)
  self.speed=0
end

function Muro:draw()
  mxx = self.position.x
  mox = self.origin.x
  myy = self.position.y
  moy = self.origin.y
  msx = self.scale.x
  msy = self.scale.y
  mrr = self.rot
  love.graphics.draw(self.image,mxx,myy,mrr,msx,msy,mox,moy,0,0)
end

return Muro