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
    self.anim_type = anim_params.anim_type or "lerp"
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
    local break_point = 0.8
    
    if self.norm <= break_point then
        local segment_norm = self.norm / break_point
        local eased = anim:easeByType(self.anim_type, segment_norm)
        return anim:lerp(self.from, self.to, eased * break_point)
    else
        local segment_norm = (self.norm - break_point) / (1 - break_point)
        local eased = anim:easeByType(self.anim_type, segment_norm)
        return anim:lerp(self.from, self.to, break_point + eased * (1 - break_point))
    end
end

function Obj:draw()
    love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
    -- TODO self:drawHud()
end

return Obj