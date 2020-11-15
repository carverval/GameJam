local Actor = Actor or require "Scripts/actor"
local Vector = Vector or require "Scripts/vector"
local Mina = Mina or require "Scripts/Mina"
Tank = Actor:extend()

rect1= {x= 117, y= 367, width= 44, height= 89}
rect2= {x= 206, y= 367, width= 44, height= 89}
rect3= {x= 250, y= 411, width= 89, height= 44}
rect4= {x= 485, y= 174, width= 44, height= 89}
rect5= {x= 574, y= 174, width= 44, height= 89}
rect6= {x= 485, y= 85, width= 89, height= 44}


function Tank:new()
  Tank.super.new(self, "Textures/Tank.png", 400,300,0,0,-1)
  self.rotSpeed=0
  minas=5
  mine=love.graphics.newImage("Textures/Mina.png")
end

function Tank:update(dt)
Tank.super.update(self, dt)
self.speed=0

if love.keyboard.isDown("w") then 
    self.speed=60
    self.position = self.position + self.forward * self.speed * dt
    --if self.position.x+44 >rect1.x and self.position.x-self.width < rect2.x + rect2.width and self.position.y+44 > rect1.y and self.position.y-self.height < rect1.y+rect1.height then
   --print("toco")
   --self.position = self.position + self.forward * -self.speed * dt
   --end
   --if self.position.x+self.width > rect3.x and self.position.x-self.width < rect3.x+rect3.width and self.position.y+self.height > rect3.y and self.position.y-self.height < rect3.y+rect3.height then
   --self.position = self.position + self.forward * -self.speed * dt
--end
end
if love.keyboard.isDown("s") then 
    self.speed=-60
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
  if minas==5 then
    love.graphics.draw(mine, 20,50)
    love.graphics.draw(mine, 50,50)
    love.graphics.draw(mine, 80,50)
    love.graphics.draw(mine, 110,50)
    love.graphics.draw(mine, 140,50)
  end
  if minas==4 then
    love.graphics.draw(mine, 20,50)
    love.graphics.draw(mine, 50,50)
    love.graphics.draw(mine, 80,50)
    love.graphics.draw(mine, 110,50)
    
  end
  if minas==3 then
    love.graphics.draw(mine, 20,50)
    love.graphics.draw(mine, 50,50)
    love.graphics.draw(mine, 80,50)
    
  end
  if minas==2 then
     love.graphics.draw(mine, 20,50)
    love.graphics.draw(mine, 50,50)
   
  end
  if minas==1 then
     love.graphics.draw(mine, 20,50)
  end
end
function Tank:keyPressed(key)
  if key == "v" then
    print(self.position.x, self.position.y)
    if minas ~= 0 then
      local m=Mina(self.position.x, self.position.y)
      table.insert(minaList, m)
      minas=minas-1
    end
    
  end
  end


return Tank
