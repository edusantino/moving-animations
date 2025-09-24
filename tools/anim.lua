Anim = {}
Anim.__index = Anim

-- anim helper instance 
function Anim:new() return setmetatable({}, Anim) end

function Anim:lerp(a, b, n) return a + (b - a) * n end

function Anim:easeInQuad(t) return t * t end

function Anim:easeOutQuad(t) return 1 - (1 - t) * (1 - t) end

function Anim:easeInOutQuad(t)
    return t < 0.5 and 2 * t * t or 1 - math.pow(-2 * t + 2, 2) / 2
end

function Anim:easeOutCubic(t) return 1 - math.pow(1 - t, 3) end

function Anim:easeInCubic(t) return t * t * t end

function Anim:easeByType(type, t)
    if type == "easeInQuad" then return self:easeInQuad(t) end
    if type == "easeInOutQuad" then return self:easeInOutQuad(t) end
    if type == "easeOutQuad" then return self:easeOutQuad(t) end
    if type == "easeOutCubic" then return self:easeOutCubic(t) end
    if type == "easeInCubic" then return self:easeInCubic(t) end
    if type == "lerp" then return t end
end

return Anim