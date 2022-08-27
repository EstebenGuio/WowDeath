local soundType = {
    SOUND = 1,
    GAME_MUSIC = 2,
    CUSTOM = 3
}

local sounds = {
    ["mancodemierda"] = {
        ["sound"] = "Interface\\AddOns\\WowDeath\\Sounds\\mancodemierda.mp3",
        ["description"] = "Custom sound!",
        ["type"] = soundType.CUSTOM
    },
      ["cerebrocondelay"] = {
        ["sound"] = "Interface\\AddOns\\WowDeath\\Sounds\\CerebroConDelay.ogg",
        ["description"] = "Custom sound!",
        ["type"] = soundType.CUSTOM
    }
}

local frame = CreateFrame("FRAME", "WowDeathFrame")
local customSoundId;

--[[
-
-   StopCustomAlert
-   Stops the music & stop custom sound triggered before
-   @author EG
--]]
local function stopCustomAlert()
    StopMusic()
    if(customSoundId ~= nil) then
        StopSound(customSoundId)
        customSoundId = nil
    end
end

--[[
-
-   playCustomAlert
-   Play a sound and save the played one in order to be stopped later
-   @author EG
--]]
local function playCustomAlert(track)
    stopCustomAlert()
    customSoundId = select(2, PlaySoundFile(track.sound))
end

--[[
-
-   onPlayerDeath
-   When player dead, trigger a random sound declared above
-   @author EG
--]]
local function onPlayerDeath(self, event, ...)
    if (math.random(1, 10) % 2 == 0) then
       playCustomAlert(sounds["mancodemierda"])
       print("WowDeath ===>   Manco de mierda")
    else
        playCustomAlert(sounds["cerebrocondelay"])
        print("WowDeath ===>   Este cerebro va con delay")
    end
end

--[[
-
-   PLAYER_DEAD - Wow event
-   Intercept a wow death event
-   @author EG
--]]
frame:RegisterEvent("PLAYER_DEAD");
frame:SetScript("OnEvent", onPlayerDeath)

