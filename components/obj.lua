Obj = {}
Obj.__index = Obj

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
    -- TODO self:drawHud()
end

return Obj