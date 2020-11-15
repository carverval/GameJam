local Actor = Actor or require "Scripts/object"
local Score = Actor:extend()
Font = love.graphics.newFont("Fonts/Gameplay.ttf", 24)
local w,h = love.graphics.getDimensions()



function Score:new()
Score.super.new()
self.points = 0
self.lives = 3
self.image = love.graphics.newImage("Textures/life.png")
self.combo=1

end

function Score:update(dt)
if self.lives==0 then
  gamestate="gameover"
end
end

function Score:draw()
  
  if self.lives==3 then
    love.graphics.draw(self.image, 20,20, 0, 0.1)
    love.graphics.draw(self.image, 50,20, 0, 0.1)
    love.graphics.draw(self.image, 80,20, 0, 0.1)
  end
  
    if self.lives==2 then
    love.graphics.draw(self.image, 20,20, 0, 0.1)
    love.graphics.draw(self.image, 50,20, 0, 0.1)
  end
  
    if self.lives==1 then
    love.graphics.draw(self.image, 20,20, 0, 0.1)
  end
  
  
  
  love.graphics.setFont(Font)
  love.graphics.print(self.points, w-200, 20)
end

return Score