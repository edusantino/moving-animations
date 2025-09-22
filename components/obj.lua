Obj = {}
Obj.__index = Obj

function Obj:new(x, y)
    local self = setmetatable({}, Obj)
    self.x = x
    self.y = y
    self.size = 30
    return self
end

function Obj:update(dt)

end

function Obj:draw()
    love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
end

return Obj