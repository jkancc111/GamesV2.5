
local function runAppropriateScript()
    local gameId = game.PlaceId
    
    local scripts = {
        [17534163435] = "https://raw.githubusercontent.com/jkancc111/Games-V2/main/DungeonRNG.txt"
    }
    -- local gameGroups = {
    --     ["Blox Fruits"] = {
    --         ids = {2753915549, 4442272183, 7449423635}, -- First, Second, Third Sea
    --         url = "https://raw.githubusercontent.com/jkancc111/Games-V2/main/BloxFruit.txt"
    --     },
    -- }
    
    if scripts[gameId] then
        loadstring(game:HttpGet(scripts[gameId], true))()
        print("Detected Game: " .. gameId)
        print("Trying to load script...")
        return true
    end
    
    for groupName, groupData in pairs(gameGroups) do
        for _, id in pairs(groupData.ids) do
            if gameId == id then
                loadstring(game:HttpGet(groupData.url, true))()
                return true
            end
        end
    end
    
    return false
end

local success, err = pcall(runAppropriateScript)
if not success then
    warn("Error while running script: " .. tostring(err))
end
