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
    self.anim_type = "learp" or anim_params.anim_type
    self.elapsed = 0
    self.from, self.to = anim_params.from or 0, anim_params.to or 0
    return self
end

function Obj:update(dt)
    if self.elapsed < self.anim_duration then
        self.elapsed = self.elapsed + dt
        self.norm = self.elapsed / self.anim_duration

        if self.anim_type == "learp" then
            self.x = anim:learp(self.from, self.to, self.norm)
        end
    end
end

function Obj:draw()
    love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
    -- TODO self:drawHud()
end

return Obj