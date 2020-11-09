actorList = {}  --Lista de elementos de juego
balaList={}
local Tank = Tank or require "Scripts/Tank"
local Canon = Canon or require "Scripts/Canon"
local Vector = Vector or require "Scripts/vector"

function love.load()
  background = love.graphics.newImage("Textures/BackGround.jpeg")
  t = Tank:extend()
  t:new()
  table.insert(actorList, t)
  c = Canon:extend()
  c:new()
  table.insert(actorList, c)
end

function love.update(dt)
  for _,v in ipairs(balaList) do
    v:update(dt)
  end
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
   love.graphics.draw(background, 0, 0)
  for _,v in ipairs(balaList) do
    v:draw()
  end
  for _,v in ipairs(actorList) do
    v:draw()
  end
  end