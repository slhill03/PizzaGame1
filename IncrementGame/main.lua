--Made by Samuel Hill (@samuelshenk on Instagram)

BUTTON_HEIGHT = 64
local
function newButton(text, fn)
return {
text = text,
fn = fn,
now = false,
last = false
        }
end

intro = ("Welcome to Sam's Pizzeria")
cheese = 0
pepperoni = 0
meat = 0
pineapple = 0

local buttons = {}
local font = nil

function love.load()
font = love.graphics.newFont(32)
music = love.audio.newSource("PizzaMaking.wav", "stream")
music:setLooping(true)
music:play()

table.insert(buttons, newButton(
"Cheese Pizza",
function()
print("Making...")
cheese = cheese + 1
love.timer.sleep(1)
end))

table.insert(buttons, newButton(
"Pepperoni Pizza",
function()
print("Making...")
pepperoni = pepperoni + 1
love.timer.sleep(1)
end))

table.insert(buttons, newButton(
"Meat Lovers Pizza",
function()
print("Making...")
meat = meat + 1
love.timer.sleep(1)
end))

table.insert(buttons, newButton(
"Pineapple Pizza",
function()
print("Making...")
 pineapple = pineapple + 1
love.timer.sleep(1)
end))

end

function love.update()

end

function love.draw()
love.graphics.rectangle('fill',150, 500, 480, 72)
font = love.graphics.newFont(30)
  love.graphics.setFont(font)
love.graphics.print(intro)
love.graphics.setColor(.22, 1, .7)
  font = love.graphics.newFont(20)
love.graphics.setFont(font)
love.graphics.print(cheese, 200, 160)
love.graphics.print(pepperoni, 200, 240)
love.graphics.print(meat, 200, 320)
love.graphics.print(pineapple, 200, 410)

local ww = love.graphics.getWidth()
local wh = love.graphics.getHeight()

local button_width = ww * (1/3)
local margin = 16

local total_height = (BUTTON_HEIGHT + margin) * #buttons
local cursor_y = 0

for i, button in ipairs(buttons) do
button.last = button.now

local bx = (ww * 0.5) - (button_width * 0.5)
local by = (wh * 0.5) - (total_height * 0.5) + cursor_y

local color = {0.4, 0.4, 0.5, 1.0}

local mx, my = love.mouse.getPosition()
local hot = mx > bx and mx < bx + button_width and
            my > by and my < by + BUTTON_HEIGHT

if hot then
  color = {0.8, 0.8, 0.9, 1.00}
end

button.now = love.mouse.isDown(1)
if button.now and not button.last and hot then
button.fn()

end

love.graphics.setColor(unpack(color))
love.graphics.rectangle(
"fill",
bx,
by,
button_width,
BUTTON_HEIGHT
)

love.graphics.setColor(0, 0, 0, 1)

local textW = font:getWidth(button.text)
local textH = font:getHeight(button.text)

love.graphics.print(
  button.text,
  font,
  (ww * 0.5) - textW * 0.5,
  by + textH * 0.5
  )

    cursor_y = cursor_y + (BUTTON_HEIGHT + margin)
  end

end


function love.keyreleased(key)
if key == 'p'
then love.audio.pause()
end
if key == 'q'
then music:play();
end
end
