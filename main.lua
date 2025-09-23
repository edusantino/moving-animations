local w, h = 800, 600

local AnimType = {
    LERP = "lerp",
    EASE_IN_QUAD = "easeInQuad",
    EASE_OUT_QUAD = "easeInOutQuad"
}

local Square = require("components.obj")
local square_list = {}

function love.load()
    love.window.setMode(w, h, {resizable=false})

    table.insert(square_list, Square:new({
        x = 20,
        y = h / 2,
        anim_params = {
            anim_type = AnimType.EASE_IN_QUAD,
            anim_duration = 4,
            from = 20,
            to = w - 60
        }
    }))

    table.insert(square_list, Square:new({
        x = 20,
        y = (h / 2) + 80,
        anim_params = {
            anim_type = AnimType.EASE_IN_QUAD,
            anim_duration = 4,
            from = 20,
            to = w - 60
        }
    }))

    table.insert(square_list, Square:new({
        x = 20,
        y = (h / 2) + 160,
        anim_params = {
            anim_type = AnimType.EASE_IN_QUAD,
            anim_duration = 4,
            from = 20,
            to = w - 60
        }
    }))

end

function love.update(dt)
    for _, s in pairs(square_list) do
        s:update(dt)
    end
end

function love.draw()
    for _, s in pairs(square_list) do
        s:draw()
    end
end