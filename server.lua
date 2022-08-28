-- By Breezy#0001
alreadyplayed = false

RegisterCommand("cgame", function(source, args, rawCommand)
    if alreadyplayed == true then
        sendMsg(source, "^5You have already played this game once... You cannot play it again unless you relog :(")
    end
    if alreadyplayed == false then
        alreadyplayed = true
        sendMsg(source, "^5You are playing a game you ^1may or may not^5 regret.. Let's find out..")
        Citizen.Wait(5000)
        local random = math.random(1, 10)
        if random < 5 then
            local time = 10000
            sendMsg(source, "^1Unlucky! Your game will now crash in ^510 ^1seconds.")
            Citizen.Wait(10000)
            DropPlayer(source, "[System] Sad to see you go! :(")
            print("^1"..name.." ^5was dropped from the game. Caused by: ^1Breezy_Crashgame")
        else
            sendMsg(source, "^2You was given a ^11 out of 10 ^2chance to crash your game and you survived! Consider yourself lucky!")
        end
    end
end, false)

RegisterCommand("resetcgame", function(source, args, rawCommand)
    local src = source
    if IsPlayerAceAllowed(src, "crashgame.staff") then
        if alreadyplayed == true then
            alreadyplayed = false
            sendMsg(source, "^5You have successfully reseted ^1/cgame ^5Good luck! :)")
        else
            sendMsg(source, "^5You silly goose, you haven't played the game yet... :)")
        end
    else
        sendMsg(source, "^1You do not have permission to do this!")
    end
end)

function sendMsg(recipient, message)
  TriggerClientEvent("chatMessage", recipient, prefix, { 255, 255, 255 }, message)
end
