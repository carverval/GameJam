actorList = {}  --Listas de elementos de juego
balaList={}
minaList={}
enemyList={}
enemyBalaList={}
tankList={}
timerList={}
muroList={}
menu = love.graphics.newImage("Textures/Menu.png")
local Tank = Tank or require "Scripts/Tank"
local Canon = Canon or require "Scripts/Canon"
local Vector = Vector or require "Scripts/vector"
local EnemyTank = EnemyTank or require "Scripts/EnemyTank"
local Timer = Timer or require "Scripts/Timer"
local Score = Score or require "Scripts/Score"
local Muro = Muro or require "Scripts/Muro"
gamestate= "menu"
w,h = love.graphics.getDimensions()
Font = love.graphics.newFont("Fonts/Gameplay.ttf", 20)
 

function love.load()
  background = love.graphics.newImage("Textures/BackGround.jpeg")
  t = Tank:extend()
  t:new()
  table.insert(tankList, t)
  c = Canon:extend()
  c:new()
  table.insert(tankList, c)
  s= Score:extend()
  s:new()
  table.insert(actorList, s)
  --local m = Muro(117,367, 1)
  --table.insert(muroList, m)           Se intentó hacer bloques de Muro pero no se supo hacer las colisiones con el Tank player y los Tank enemigos
  --local m = Muro(206,367, 1)
  --table.insert(muroList, m)
  --local m = Muro(250, 411, 2)
  --table.insert(muroList, m)
  --local m = Muro(485,174, 1)
  --table.insert(muroList, m)
  --local m = Muro(574,174, 1)
  --table.insert(muroList, m)
  --m = Muro(485, 85, 2)
  --table.insert(muroList, m)
  
  l=Timer:extend()
  table.insert(timerList, l)
  l:new(4, EnemySpawn, true)
  
end

function love.update(dt)
  if gamestate=="menu" then
    timer=0
    if love.keyboard.isDown("return") then
      gamestate="loading"
    end
    if love.keyboard.isDown("escape") then
      love.event.quit(0)
    end
  end --Menu state end
  if gamestate== "loading" then
    timer= timer+dt
    if timer>=3 then
      gamestate="game"
    end
  end
  
    
    
  if gamestate=="game" then
    restarting=false
  for _,v in ipairs(balaList) do
    v:update(dt)
  end
  --for _,v in ipairs(muroList) do
    --v:update(dt)
  --end
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
  for _,v in ipairs(timerList) do
    v:update(dt)
  end
end --Game state end
if gamestate=="gameover" then
  if love.keyboard.isDown("r") then
      gamestate="restart"
      keyPushed="r"
    end
    if love.keyboard.isDown("m") then
      gamestate="restart"
      keyPushed="m"
    end
    if love.keyboard.isDown("escape") then
      love.event.quit(0)
    end
  end
  
  if gamestate=="restart" then
    for i, all in ipairs(actorList) do
  table.remove(actorList, i)
end
--for i, all in ipairs(muroList) do
  --table.remove(muroList, i)
  --end
  for i, all in ipairs(balaList) do
  table.remove(balaList, i)
  end
  for i, all in ipairs(tankList) do
  table.remove(tankList, i)
  end
  for i, all in ipairs(enemyBalaList) do
  table.remove(enemyBalaList, i)
  end
  for i, all in ipairs(minaList) do
  table.remove(minaList, i)
  end
  for i, all in ipairs(enemyList) do
  table.remove(enemyList, i)
  end
  for i, all in ipairs(timerList) do
  table.remove(timerList , i)
  end

  love.load()
  if restarting==false then
   r=Timer(4, Restart, false)
   restarting=true
  end
  r:update(dt)
  end
  
end

function love.draw()
  if gamestate=="menu" then
  love.graphics.draw(menu)
  love.graphics.setFont(Font)
  love.graphics.print("PRESS ENTER", w/2-80, h/2+50)
  love.graphics.print("TO PLAY", w/2-50, h/2+80)
  love.graphics.print("PRESS ESC", w/2-60, h/2+145)
  love.graphics.print("TO QUIT", w/2-40, h/2+175)
end --Menu state end
if gamestate=="loading" then
  local menu=love.graphics.newImage("Textures/MENU_LOADING.png")
  love.graphics.draw(menu, 0, 0)
end

  if gamestate=="game" then 
   love.graphics.draw(background, 0, 0)
   --for _,v in ipairs(muroList) do
    --v:draw()
  --end
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
  for _,v in ipairs(timerList) do
    v:draw()
  end
end --Game State end
if gamestate=="restart" then
  rest=love.graphics.newImage("Textures/MENU_RESTARTING.png")
  love.graphics.draw(rest, 0, 0)
end
if gamestate=="gameover" then
  over= love.graphics.newImage("Textures/MENU_GAME_OVER.png")
  love.graphics.draw(over,0,0)
  love.graphics.setFont(Font)
  love.graphics.print("SCORE: " , w/2-30,h/2+100)
  love.graphics.print(s.points , w/2+55,h/2+100)
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
  math.randomseed(os.time())
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
function Restart()
   if keyPushed=="r" then
      gamestate="game"
    end
    if keyPushed=="m" then
      gamestate="menu"
    end
  end
