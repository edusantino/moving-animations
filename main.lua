local w, h = 800, 600

local Square = require("components.obj")
local square

function love.load()
    love.window.setMode(w, h, {resizable=false})

    local params = {
        x = 20,
        y = h / 2,
        anim_params = {
            anim_type = "learp",
            anim_duration = 4,
            from = 20,
            to = w - 60
        }
    }
    square = Square:new(params)
end

function love.update(dt)
    square:update(dt)
end

function love.draw()
    square:draw()
end