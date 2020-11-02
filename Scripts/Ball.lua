local Actor = Actor or require "Scripts/actor"
local Ball = Actor:extend()

function Ball:new()
  Ball.super.new()
end

function Asteroid:update(dt)
  Ball.super.update(self, dt)
end


function Ball:draw()
  
end

return Ball