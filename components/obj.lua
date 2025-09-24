Obj = {}
Obj.__index = Obj

local AnimType = {
    LERP = "lerp",
    EASE_IN_QUAD = "easeInQuad",
    EASE_OUT_QUAD = "easeInOutQuad"
}

function Obj:getMockList()
    local square_list = {}
    table.insert(square_list, self:new({
        x = 20,
        y = 600 / 2 - 80,
        anim_params = {
            anim_type_begin = AnimType.EASE_OUT_QUAD,
            anim_type_end = AnimType.EASE_IN_QUAD,
            anim_duration = 4,
            from = 20,
            to = 800 - 60,
            break_point = 0.8
        }
    }))

    table.insert(square_list, self.new({
        x = 20,
        y = (600 / 2),
        anim_params = {
            anim_type_begin = AnimType.LERP,
            anim_type_end = AnimType.EASE_OUT_QUAD,
            anim_duration = 4,
            from = 20,
            to = 800 - 60,
            break_point = 0.8
        }
    }))

    table.insert(square_list, self.new({
        x = 20,
        y = (600 / 2) + 80,
        anim_params = {
            anim_type_begin = AnimType.LERP,
            anim_type_end = AnimType.LERP,
            anim_duration = 4,
            from = 20,
            to = 800 - 60,
            break_point = 0.9
        }
    }))
end

local Anim = require("tools.anim")
local anim = Anim:new()

function Obj:new(params)
    local self = setmetatable({}, Obj)
    local anim_params = params.anim_params

    self.x = params.x
    self.y = params.y
    self.size = 30
    self.anim_duration = 3 or anim_params.anim_duration
    self.anim_type_begin = anim_params.anim_type_begin
    self.anim_type_end = anim_params.anim_type_end
    self.break_point = anim_params.break_point or 0.8

    self.elapsed = 0
    self.from, self.to = anim_params.from or 0, anim_params.to or 0
    return self
end

function Obj:update(dt)
    if self.elapsed < self.anim_duration then
        self.elapsed = self.elapsed + dt
        self.norm = self.elapsed / self.anim_duration
        
        self.x = self:animate()
    end
end

function Obj:animate()
    if self.norm <= self.break_point then
        local segment_norm = self.norm / self.break_point
        local eased = anim:easeByType(self.anim_type_begin, segment_norm)
        return anim:lerp(self.from, self.to, eased * self.break_point)
    else
        local segment_norm = (self.norm - self.break_point) / (1 - self.break_point)
        local eased = anim:easeByType(self.anim_type_end, segment_norm)
        return anim:lerp(self.from, self.to, self.break_point + eased * (1 - self.break_point))
    end
end

function Obj:draw()
    love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
    love.graphics.line(20, self.y + self.size + 5, 800 - 20, self.y + self.size + 5)
    -- TODO self:drawHud()
end

return Obj