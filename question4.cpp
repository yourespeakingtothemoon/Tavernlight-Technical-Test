//question 4



void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    //here a player is created with the name of the recipient
    //if the player is not found in the game
    //then the player is loaded from the database

    bool existingPlayer = true;
    
    Player* player = g_game.getPlayerByName(recipient);
    if (!player)
    {
        //this requires that the new keyword is used to create a new player
        //this can lead to the afforementioned memory leak if the player is not deleted
        //however we should only delete the player if it this new one that is created
        //dangling pointers can be dicey
        player = new Player(nullptr);
        existingPlayer = false;
        if (!IOLoginData::loadPlayerByName(player, recipient)) 
        {
            //dont need to check here as this if is only accessable from here
            //player should just be deleted
            delete player;
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);

    if (!item)
    {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }
    //we are done using this player object
    //so we should delete it to prevent memory leaks
    if(!existingPlayer)
    {
        delete player;
    }
}