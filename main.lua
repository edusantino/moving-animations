local w, h = 800, 600

local Square = require("components.obj")
local square

function love.load()
    love.window.setMode(w, h, {resizable=false})

    square = Square:new(20, h / 2)
end

function love.update(dt)
    square:update(dt)
end

function love.draw()
    square:draw()
end