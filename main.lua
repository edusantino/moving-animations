local w, h = 800, 600

local Square = require("components.obj")
local square_list = {}

local Hud = require("components.hud")
local hud = {}

function love.load()
    love.window.setMode(w, h, {resizable=false})

    hud = Hud:new()

    square_list = Square:getMockList()

end

function love.update(dt)
    for _, s in pairs(square_list) do
        s:update(dt)
    end

    hud:update(dt)
end

function love.draw()
    for _, s in pairs(square_list) do
        s:draw()
    end

    hud:draw()
end