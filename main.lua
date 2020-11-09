actorList = {}  --Lista de elementos de juego
local Tank = Tank or require "Scripts/Tank"
local Canon = Canon or require "Scripts/Canon"

function love.load()
  t = Tank:extend()
  t:new()
  table.insert(actorList, t)
  c = Canon:extend()
  c:new()
  table.insert(actorList, c)
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
  for _,v in ipairs(actorList) do
    v:draw()
  end
  end