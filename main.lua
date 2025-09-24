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
            anim_type_begin = AnimType.EASE_OUT_QUAD,
            anim_type_end = AnimType.EASE_IN_QUAD,
            anim_duration = 4,
            from = 20,
            to = w - 60,
            break_point = 0.8
        }
    }))

    table.insert(square_list, Square:new({
        x = 20,
        y = (h / 2) + 80,
        anim_params = {
            anim_type_begin = AnimType.LERP,
            anim_type_end = AnimType.EASE_OUT_QUAD,
            anim_duration = 4,
            from = 20,
            to = w - 60,
            break_point = 0.8
        }
    }))

    table.insert(square_list, Square:new({
        x = 20,
        y = (h / 2) + 160,
        anim_params = {
            anim_type_begin = AnimType.LERP,
            anim_type_end = AnimType.LERP,
            anim_duration = 4,
            from = 20,
            to = w - 60,
            break_point = 0.9
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