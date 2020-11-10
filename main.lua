actorList = {}  --Listas de elementos de juego
balaList={}
minaList={}
enemyList={}
enemyBalaList={}
tankList={}
local Tank = Tank or require "Scripts/Tank"
local Canon = Canon or require "Scripts/Canon"
local Vector = Vector or require "Scripts/vector"
local EnemyTank = EnemyTank or require "Scripts/EnemyTank"
local Timer = Timer or require "Scripts/Timer"



function love.load()
  background = love.graphics.newImage("Textures/BackGround.jpeg")
  t = Tank:extend()
  t:new()
  table.insert(tankList, t)
  c = Canon:extend()
  c:new()
  table.insert(tankList, c)
  
  
  l=Timer:extend()
  table.insert(actorList, l)
  l:new(4, EnemySpawn, true)
  
end

function love.update(dt)
  for _,v in ipairs(balaList) do
    v:update(dt)
  end
  for _,v in ipairs(enemyBalaList) do
    v:update(dt)
  end
  for _,v in ipairs(minaList) do
    v:update(dt)
  end
  for _,v in ipairs(enemyList) do
    v:update(dt)
  end
   for _,v in ipairs(tankList) do
    v:update(dt)
  end
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
  
end

function love.draw()
   love.graphics.draw(background, 0, 0)
  for _,v in ipairs(minaList) do
    v:draw()
  end
  for _,v in ipairs(balaList) do
    v:draw()
  end
  for _,v in ipairs(enemyBalaList) do
    v:draw()
  end
  for _,v in ipairs(enemyList) do
    v:draw()
  end
  for _,v in ipairs(tankList) do
    v:draw()
  end
  for _,v in ipairs(actorList) do
    v:draw()
  end
  
end
function love.keypressed(key)
  for _,v in ipairs(tankList) do
    if v:is(Tank) then
      v:keyPressed(key)
    end
  end
end
function EnemySpawn()
  randomSpawner = math.random(1,4)
  if randomSpawner == 1 then
     e = EnemyTank(math.random(-100, 800), -50)--Top
     table.insert(enemyList, e)
  end
  if randomSpawner == 2 then
    e = EnemyTank(850, math.random(-100, 700))--Right
    table.insert(enemyList, e)
  end
  if randomSpawner == 3 then
    e = EnemyTank(-50, math.random(-100, 700))--Left
     table.insert(enemyList, e)
  end
  if randomSpawner == 4 then
    e = EnemyTank(math.random(-100, 800),650)--Bot
    table.insert(enemyList, e)
  end
  
end
