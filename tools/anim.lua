Anim = {}
Anim.__index = Anim

-- anim helper instance 
function Anim:new() return setmetatable({}, Anim) end

function Anim:learp(a, b, n) return a + (b - a) * n end

-- function Anim:easeIn(t) return t + t end

return Anim