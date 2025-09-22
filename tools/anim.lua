Anim = {}
Anim.__index = Anim

function Anim:new()
    local self = setmetatable({}, Anim)
    return self
end

function Anim:learp(a, b, n) return a + (b - a) * n end

-- function Anim:easeIn(t) return t + t end

return Anim