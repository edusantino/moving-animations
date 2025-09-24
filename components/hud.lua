Hud = {}
Hud.__index = Hud

function Hud:new()
    local self = setmetatable({}, Hud)
    self.timer = 4
    self.elapsed = 0
    self.x = 40
    self.y = 40
    self.restart_message = false
    return self
end

function Hud:update(dt)
    if self.elapsed < self.timer then
        self.timer = self.timer + dt
    else
        self.restart_message = true
    end
end

function Hud:draw()
    love.graphics.print("TIMER: " .. self.elapsed .. "s", self.x, self.y)
    if self.restart_message then
        love.graphics.print("PRESS R to restart.", self.x, self.y + 40)
    end
end

return Hud