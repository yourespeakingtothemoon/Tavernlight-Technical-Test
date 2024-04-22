--Q1
--the primary change I would make here, as observing it outside its context, is to 
--add a number of constants, mainly the index pertaining to the storage value, and the values for loaded and unloaded
--I would also change a few things to be all around easier to read and understand as it took me some time to understand what the goal of the code was here
local m_storage = 1000
local m_loaded = 1
local m_unloaded = -1

local function releaseStorage(player)
    player:setStorageValue(m_storage, m_loaded)
    end
    
function onLogout(player)
    if player:getStorageValue(m_storage) == m_loaded then
    addEvent(releaseStorage, m_storage, player)
    end
    return true
    end

--Q2
--first thing I notice is the mention of all guilds 
--however, I dont think it prints multiple guilds
--I would change this to loop through the full result and print all names
--I would also add a check to see if the result is empty


function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    if guildName == nil then
        print("No guilds found")
        return
    end
    repeat
        print(guildName)
    until not result.next()
    end

--Q3

-- this function seems like it is designed to remove a specfic player from the party
-- depending on the context for memory usage sake I would make both inputs be the playerid, one
-- for the party leader and the other for the player to be removed
-- I would also change the way the party is iterated through to be more efficient and readable


function removePlayerFromParty(leaderId, playerId)
    local partyLeader = Player(leaderId)
    local party = partyLeader:getParty()
    if party == nil then
        return
    end
    --to note because of unknown context I am not entirely sure if
    --this is the best way to iterate through the party
    --given that the party is a table of players I would assume it is
    for k,v in pairs(party:getMembers()) do
        if v == Player(playerId) then
            party:removeMember(Player(playerId))
        end
    end


