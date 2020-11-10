local Actor = Actor or require "Scripts/actor"
local Timer = Actor:extend()


function Timer:new(time, fun, rep, x, y)
  Timer.super.new(self,nil,x,y,0)
  self.tAct = 0
  self.tMax = time
  self.f = fun
  self.rp = rep
end

function Timer:update(dt)
  self.tAct = self.tAct + dt
  if self.tAct > self.tMax then
    self.f()
    if self.rp == true then
      self.tAct = 0
    else
      --
    end
  end
end

function Timer:draw()
  
end

return Timer