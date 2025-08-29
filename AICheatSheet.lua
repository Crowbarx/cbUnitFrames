--[[
    WoW 1.12.1 Global API Reference Cheat Sheet
    Source: https://vanilla-wow-archive.fandom.com/wiki/World_of_Warcraft_API
    Purpose: To provide context to GitHub Copilot for accurate code generation for a 1.12.1 addon.
--]]

--[[ --- ==== Action Functions ==== ---
-- UI ActionButtonDown(id) - Press the specified action button.
-- UI ActionButtonUp(id) - Release the specified action button.
-- ActionHasRange(slot) - Determine if the specified action is a range restriction (1 if yes, nil if no).
-- UI BonusActionButtonDown - Trigger the specified bonus(pet or minion) action button.
-- UI BonusActionButtonUp - Release the specified bonus(pet or minion) action button.
-- PROTECTED CameraOrSelectOrMoveStart() - Begin "Left click" in the 3D world. [1.10 - Protected]
-- PROTECTED CameraOrSelectOrMoveStop([stickyFlag]) - End "Left click" in the 3D world. [1.10 - Protected]
-- ChangeActionBarPage() - Changes the current action button set to CURRENT_ACTIONBAR_PAGE.
-- GetActionBarToggles() - Return the toggles for each action bar.
-- GetActionCooldown(slot) - This returns the cooldown values of the specified action.
-- GetActionCount(slot) - Get the count (bandage/potion/etc) for an action, returns 0 if none or not applicable.
-- GetActionText(slot) - Get the text label (macros, etc) for an action, returns nil if none.
-- GetActionTexture(slot) - Gets the texture path for the specified action.
-- GetBonusBarOffset() - Determine which page of bonus actions to show.
-- HasAction(slot) - Returns 1 if the player has an action in the specified slot, nil otherwise.
-- IsActionInRange(slot) - Test if an action is in range (1=yes, 0=no, nil=not applicable).
-- IsAttackAction(slot) - Return 1 if an action is an 'attack' action (flashes during combat), nil otherwise.
-- IsAutoRepeatAction(slot) - Return 1 if an action is auto-repeating, nil otherwise.
-- IsCurrentAction(slot) - Return 1 if an action is the one currently underway, nil otherwise.
-- IsUsableAction(slot) - Return 1 if an action can be used at present, nil otherwise.
-- IsConsumableAction(slot) - Return 1 if an action is consumable (i.e. has a count), nil otherwise.
-- IsEquippedAction(slot) - Return 1 if an action is equipped (i.e. connected to an item that must be equipped), nil otherwise.
-- PetHasActionBar() - Determine if player has a pet with an action bar.
-- PickupAction(slot) - Drags an action out of the specified quickbar slot and holds it on the cursor.
-- PickupPetAction(slot) - Drags an action from the specified pet action bar slot into the cursor.
-- PlaceAction(slot) - Drops an action from the cursor into the specified quickbar slot.
-- SetActionBarToggles(show1, show2, show3, show4[, alwaysShow]) - Set show toggle for each action bar. ['alwaysShow' added in 1.12]
-- PROTECTED TurnOrActionStart() - Begin "Right Click" in the 3D world. [1.10 - Protected]
-- PROTECTED TurnOrActionStop() - End "Right Click" in the 3D world. [1.10 - Protected]
-- UseAction(slot[, checkCursor[, onSelf]]) - This instructs the interface to use the action associated with the specified ID.
--]]

--[[ --- ==== Activity Functions ==== ---
-- AcceptDuel() - The player accepts the challenge to duel.
-- AttackTarget() - Attacks the targetted unit.
-- CancelDuel() - Refuse the invitation to fight a duel.
-- CancelLogout()
-- CancelMeetingStoneRequest() - Remove character from an instance's Meeting Stone queue.
-- ClearTutorials()
-- ConfirmSummon()
-- FlagTutorial("tutorial")
-- PROTECTED ForceLogout()
-- ForceQuit()
-- GetSummonConfirmAreaName()
-- GetSummonConfirmSummoner()
-- GetSummonConfirmTimeLeft()
-- Logout() - Logs the user out of the game.
-- Quit() - Quits the application, NOT the LUA script.
-- RandomRoll(low, high) - Does a random roll between the two values.
-- SitOrStand() - The player sits or stands.
-- StartDuel("name") - Challenge someone to a duel (by name).
-- StartDuelUnit("unit") - Challenge a unit to a duel.
-- TogglePVP() - Toggles PVP Status.
-- ToggleSheath() - Toggles sheathed or unsheathed weapons.
-- UseSoulstone() - Use an active soulstone to resurrect yourself after death.
--]]

--[[ --- ==== AddOn Functions ==== ---
-- DisableAddOn(index or "AddOnName") - Disable the specified AddOn for subsequent sessions.
-- DisableAllAddOns() - Disable all AddOns for subsequent sessions.
-- EnableAddOn(index or "AddOnName") - Enable the specified AddOn for subsequent sessions.
-- EnableAllAddOns() - Enable all AddOns for subsequent sessions.
-- GetAddOnDependencies(index or "AddOnName") - Get dependency list for an AddOn.
-- GetAddOnInfo(index or "AddOnName") - Get information about an AddOn.
-- GetAddOnMetadata(index or "name", "variable") - Retrieve metadata from addon's TOC file.
-- GetNumAddOns() - Get the number of user supplied AddOns.
-- IsAddOnLoaded(index or "AddOnName") - Returns true if the specified AddOn is loaded.
-- IsAddOnLoadOnDemand(index or "AddOnName") - Test whether an AddOn is load-on-demand.
-- LoadAddOn(index or "AddOnName") - Request loading of a Load-On-Demand AddOn.
-- ResetDisabledAddOns()
--]]

--[[ --- ==== Auction Functions ==== ---
-- CalculateAuctionDeposit(runTime) - Returns the required deposit for the current selling item given the specified duration (minutes).
-- CanSendAuctionQuery() - Return 1 if auction search button would be active, nil otherwise.
-- CancelAuction(index) - Cancel the specified auction (on the "owner" list).
-- ClickAuctionSellItemButton() - Puts the currently 'picked up' item into the 'create auction' slot.
-- CloseAuctionHouse() - Will close the AuctionFrame if opened.
-- GetAuctionHouseDepositRate() - Returns the deposit rate (percentage) for the currently open auction house.
-- GetAuctionInvTypes(classIndex, subclassIndex) - Returns types of subcategories items.
-- GetAuctionItemClasses() - Returns major auction item categories.
-- GetAuctionItemInfo("type", index) - Returns details about the specified auction item.
-- GetAuctionItemLink("type", index) - Returns an itemLink for the specified auction item.
-- GetAuctionItemSubClasses(classIndex) - Returns subcategories in the nth auction category.
-- GetAuctionItemTimeLeft("type", index) - Returns the time left status of the specified auction item.
-- GetAuctionSellItemInfo() - Returns information about the current selling item (or nil if none selected).
-- GetBidderAuctionItems([page])
-- GetNumAuctionItems("type") - Returns the size of the specified auction item list.
-- GetOwnerAuctionItems([page])
-- GetSelectedAuctionItem("type") - Returns the index (1-50) of the selected auction item or 0 if none is selected.
-- IsAuctionSortReversed("type", "sort") - Returns 1 if the specified auction list and sort is reversed, nil otherwise.
-- PlaceAuctionBid("type", index, bid) - Place a bid on the selected auction item.
-- QueryAuctionItems("name", minLevel, maxLevel, invTypeIndex, classIndex, subclassIndex, page, isUsable, qualityIndex)
-- SetSelectedAuctionItem("type", index)
-- SortAuctionItems("type", "sort") - Request that the specified auction list be sorted by a specific column.
-- StartAuction(minBid, buyoutPrice, runTime) - Starts the auction you have created in the Create Auction panel.
-- UI AuctionFrameAuctions.duration - Set the amount of time the auction will run for in minutes.
--]]

--[[ --- ==== Bank Functions ==== ---
-- BankButtonIDToInvSlotID(buttonID) - Returns the ID number of a bank button in terms of inventory slot ID.
-- CloseBankFrame() - Close the bank frame if it's open.
-- GetBankSlotCost(numSlots) - Returns the cost of the next bank slot.
-- GetNumBankSlots() - Returns total purchased bank bag slots, and a flag indicating if it's full.
-- PurchaseSlot() - Buys another bank slot if available.
--]]

--[[ --- ==== Unit Functions ==== ---
-- UnitExists("unit") - Returns true if the specified unit exists, false otherwise.
-- UnitName("unit") - Returns the name (and realm name) of a unit.
-- UnitLevel("unit") - Returns the level of a unit.
-- UnitHealth("unit") - Returns the current health, in points, of the specified unit.
-- UnitHealthMax("unit") - Returns the maximum health, in points, of the specified unit.
-- UnitMana("unit") - Returns the current mana (or energy,rage,etc), in points, of the specified unit.
-- UnitManaMax("unit") - Returns the maximum mana (or energy,rage,etc), in points, of the specified unit.
-- UnitPowerType("unit") - Returns a number corresponding to the power type (e.g., mana, rage or energy).
-- UnitClass("unit") - Returns the class name of the specified unit (e.g., "Warrior" or "Shaman").
-- UnitRace("unit") - Returns the race name of the specified unit (e.g., "Human" or "Troll").
-- UnitFactionGroup("unit") - Returns the faction group id and name of the specified unit (e.g. "Alliance").
-- UnitReaction("unit", "otherUnit") - Returns reaction of the first unit towards the second unit (aggressive, neutral or friendly).
-- UnitIsPlayer("unit") - Returns true if the specified unit is a player character, false otherwise.
-- UnitIsFriend("unit", "otherUnit") - Returns true if the specified units are friends.
-- UnitIsEnemy("unit", "otherUnit") - Returns true if the specified units are enemies.
-- UnitIsDead("unit") - Returns true if the specified unit is dead, nil otherwise.
-- UnitIsDeadOrGhost("unit") - Returns true if the specified unit is dead or a ghost, nil otherwise.
-- UnitBuff("unit", index[, showCastable]) - Retrieves info about a buff of a certain unit.
-- UnitDebuff("unit", index[, showDispellable]) - Retrieves info about a debuff of a certain unit.
-- SetPortraitTexture(texture, "unit") - Paint a Texture object with the specified unit's portrait.
-- TargetUnit("unit") - Selects the specified unit as the current target.
-- ClearTarget() - Clears the selected target.
-- ... (and so on for all other functions)
--]]

--[[ --- ==== Frame Management Functions ==== ---
-- CreateFrame("frameType"[, "name"][, parent][, "inheritFrame"]) - Create a new frame of the specified type.
-- CreateFont("name") - Dynamically create a font object.
-- GetNumFrames() - Get the current number of Frame (and derivative) objects.
-- EnumerateFrames(currentFrame) - Get the Frame which follows currentFrame.
-- GetMouseFocus() - Returns the frame that currently has the mouse focus.
-- UI MouseIsOver - Determines whether or not the mouse is over the specified frame.
-- UI ToggleDropDownMenu(level, value, dropDownFrame, anchorName, xOffset, yOffset)
-- UI UIFrameFadeIn(frame, fadeTime, startAlpha, endAlpha)
-- UI UIFrameFlash(...)
--]]

--[[ --- ==== System Functions ==== ---
[cite_start]-- ConsoleExec("command") - Execute a console command. [cite: 628]
[cite_start]-- GetBuildInfo() - Returns information about current client build. [cite: 628]
[cite_start]-- geterrorhandler() - (No description provided). [cite: 629]
[cite_start]-- GetFramerate() - Returns the current framerate (full precision). [cite: 629]
[cite_start]-- GetGameTime() - Returns the time in-game. [cite: 629]
[cite_start]-- GetLocale() - Returns client locale, example 'enUS'. [cite: 630]
[cite_start]-- GetCursorPosition() - Returns the cursor's position on the screen. [cite: 631]
[cite_start]-- GetNetStats() - Get bandwidth and latency network information. [cite: 632]
[cite_start]-- GetRealmName() - returns the name of the server a user is logged in to. [cite: 632]
[cite_start]-- GetScreenHeight() - Returns the height of the window in pixels. [cite: 633]
[cite_start]-- GetScreenWidth() - Returns the width of the window in pixels. [cite: 634]
[cite_start]-- GetText() - Used to localize some client text. [cite: 635]
[cite_start]-- GetTime() - Returns the system uptime in seconds (millisecond precision). [cite: 636]
[cite_start]-- InCinematic() - (No description provided). [cite: 636]
[cite_start]-- IsAltKeyDown() - Returns true if the alt key is currently depressed. [cite: 637]
[cite_start]-- IsControlKeyDown() - Returns true if the control key is currently depressed. [cite: 638]
[cite_start]-- IsLinuxClient() - Boolean - Returns true if WoW is being run on Linux. [cite: 638]
[cite_start]-- IsMacClient() - Checks client system. [cite: 638]
[cite_start]-- IsShiftKeyDown() - Returns true if the shift key is currently depressed. [cite: 639]
[cite_start]-- IsWindowsClient() - (No description provided). [cite: 639]
[cite_start]-- OpeningCinematic() - shows the opening movie for a player's race. [cite: 639]
[cite_start]-- PlayMusic("path/to/file.mp3") - Plays the specified mp3. [cite: 640]
[cite_start]-- PlaySound("soundName") - Plays the specified built-in sound effect. [cite: 640]
[cite_start]-- PlaySoundFile("path/to/file.mp3") - Plays the specified sound file. [cite: 641]
[cite_start]-- ReloadUI() - Reloads the UI from source files. [cite: 641]
-- RepopMe() - The "Release Spirit" button. [cite_start]Sends you to the graveyard when dead. [cite: 642]
[cite_start]-- RequestTimePlayed() - Request a summary of time played from the server. [cite: 643]
-- RestartGx() - Restarts the graphical engine. [cite_start]Needed for things such as resolution changes to take effect. [cite: 644]
[cite_start]-- RunScript("script") - Execute "script" as a block of LUA code. [cite: 644]
[cite_start]-- Screenshot() - Takes a screenshot. [cite: 645]
[cite_start]-- SecondsToTime(seconds) - Converts a number of seconds into a readable days / hours / etc. formatted string. [cite: 646]
[cite_start]-- seterrorhandler(function) - (No description provided). [cite: 646]
[cite_start]-- StopCinematic() - (No description provided). [cite: 647]
[cite_start]-- StopMusic() - Stops the currently playing mp3. [cite: 647]
[cite_start]-- UIParentLoadAddOn("AddOnName") - Loads or Reloads the specified AddOn, and pops up an error message if it fails to load. [cite: 648]
[cite_start]-- TakeScreenshot() - Takes a screenshot. [cite: 648]
[cite_start]-- _ERRORMESSAGE(value) - Displays the script error dialog with optional text. [cite: 648]
[cite_start]-- debuginfo() - Output win32 debug text. [cite: 649]
[cite_start]-- getglobal("object") - Given an object name will return the object itself. [cite: 650]
[cite_start]-- message("text") - Displays a message box with your text message and an "Okay" button. [cite: 651]
[cite_start]-- setglobal("object", value) - set the global "object" to the given value. [cite: 652]
--]]

--[[ --- ==== Talent Functions ==== ---
[cite_start]-- BuyTrainerService(index) - Used for buying new/upgrading professions, profession items and class skills. [cite: 653]
[cite_start]-- CheckTalentMasterDist() - (No description provided). [cite: 653]
[cite_start]-- ConfirmTalentWipe() - (No description provided). [cite: 653]
[cite_start]-- GetNumTalentTabs() - return number of talent trees (usually 3). [cite: 654]
[cite_start]-- GetNumTalents(tabIndex) - return number of talents in tree. [cite: 654]
[cite_start]-- GetTalentInfo(tabIndex, talentIndex) - return name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq. [cite: 654]
[cite_start]-- GetTalentPrereqs(tabIndex, talentIndex) - return tier, column, isLearnable. [cite: 654]
[cite_start]-- GetTalentTabInfo(tabIndex) - return name, iconTexture, pointsSpent, background. [cite: 654]
[cite_start]-- IsTalentTrainer() - (No description provided). [cite: 654]
[cite_start]-- LearnTalent(tabIndex, talentIndex) - (No description provided). [cite: 654]
--]]

--[[ --- ==== Targetting Functions ==== ---
[cite_start]-- AssistByName("playername") - Assists the player whose name is entered. [cite: 655]
[cite_start]-- AssistUnit("unit") - Instructs your character to assist the specified unit. [cite: 655]
[cite_start]-- AttackTarget() - Attacks the targetted unit. [cite: 656]
[cite_start]-- ClearTarget() - Clears the selected target. [cite: 656]
[cite_start]-- ClickTargetTradeButton(index) - (No description provided). [cite: 656]
[cite_start]-- TargetByName("name"[, exactMatch]) - Selects the specified player as the current target. [cite: 657]
[cite_start]-- TargetLastEnemy() - Selects the last targetted enemy as the current target. [cite: 658]
[cite_start]-- TargetLastTarget() - Selects the last target as the current target. [cite: 659]
[cite_start]-- TargetNearestEnemy([reverseFlag]) - Selects the nearest enemy as the current target. [cite: 660]
[cite_start]-- TargetNearestFriend() - Selects the nearest friendly unit as the current target. [cite: 661]
[cite_start]-- TargetNearestPartyMember() - Selects the nearest Party member as the current target. [cite: 662]
[cite_start]-- TargetNearestRaidMember() - Selects the nearest Raid member as the current target. [cite: 663]
[cite_start]-- TargetUnit("unit") - Selects the specified unit as the current target. [cite: 664]
--]]

--[[ --- ==== Taxi Functions ==== ---
[cite_start]-- CloseTaxiMap() - Closes the Flightpath Map. [cite: 664]
[cite_start]-- DrawRouteLine(texture, canvas, startx, starty, endx, endy, width, relPoint) - Draws a line. [cite: 665]
[cite_start]-- GetNumRoutes(slot) - Gets the number of hops between current-slot and slot. [cite: 666]
[cite_start]-- NumTaxiNodes() - Returns the number of nodes (flight paths) on an open taxi map. [cite: 667]
[cite_start]-- SetTaxiMap(frame) - (No description provided). [cite: 667]
[cite_start]-- TakeTaxiNode(slot) - Takes the named taxi node. [cite: 668]
[cite_start]-- TaxiNodeCost(slot) - Returns the cost in copper of a node. [cite: 669]
[cite_start]-- TaxiNodeGetType(slot) - Returns the status of a node. [cite: 669]
[cite_start]-- TaxiGetSrcX(slot, hop) - (No description provided). [cite: 670]
[cite_start]-- TaxiGetSrcY(slot, hop) - (No description provided). [cite: 670]
[cite_start]-- TaxiGetDestX(slot, hop) - (No description provided). [cite: 671]
[cite_start]-- TaxiGetDestY(slot, hop) - (No description provided). [cite: 671]
[cite_start]-- TaxiNodeSetCurrent(slot) - Renumbers slots based on new current slot. [cite: 672]
[cite_start]-- TaxiNodeName(slot) - Returns the name of a node. [cite: 673]
[cite_start]-- TaxiNodePosition(slot) - Returns position (x,y) of node on the map. [cite: 674]
[cite_start]-- UnitOnTaxi("unit") - Returns 1 if unit is on a taxi. [cite: 675]
--]]

--[[ --- ==== Toggle Functions ==== ---
[cite_start]-- ToggleBackpack() - Toggles your backpack open/closed. [cite: 676]
[cite_start]-- ToggleBag(bagID) - Opens or closes the specified bag. [cite: 677]
[cite_start]-- ToggleCharacter(index) - Toggles the character pane to the specified frame. [cite: 677]
[cite_start]-- ToggleCombatLog() - Opens/closes the combat log. [cite: 678]
[cite_start]-- ToggleFramerate() - Show/Hide the FPS. [cite: 678]
[cite_start]-- ToggleFriendsFrame([tabNumber]) - Opens/closes the friends pane (possibly on a specific tab). [cite: 679]
[cite_start]-- ToggleGameMenu() - Opens/closes the game menu. [cite: 679]
[cite_start]-- ToggleHelpFrame() - Opens the Help Request frame. [cite: 680]
[cite_start]-- ToggleKeyRing() - Opens/closes the key ring. [cite: 680]
[cite_start]-- ToggleMinimap() - Turns the minimap display on/off. [cite: 681]
[cite_start]-- ToggleQuestLog() - Opens/closes the quest log. [cite: 681]
-- ToggleSpellBook("bookType") - Shows the spellbook. [cite_start]Can show your spells or your pet's. [cite: 682]
[cite_start]-- ToggleTalentFrame() - Opens the Talent frame. [cite: 683]
[cite_start]-- ToggleWorldMap() - Turns the world map on/off. [cite: 683]
--]]

--[[ --- ==== TradeSkill Functions ==== ---
[cite_start]-- CloseTradeSkill() - Closes an open trade skill window. [cite: 684]
[cite_start]-- CollapseTradeSkillSubClass(index) - Collapses the specified subclass header row. [cite: 685]
[cite_start]-- DoTradeSkill(index[, repeatTimes]) - Performs the tradeskill a specified # of times. [cite: 686]
[cite_start]-- ExpandTradeSkillSubClass(index) - Expands the specified subclass header row. [cite: 687]
[cite_start]-- GetFirstTradeSkill() - Returns the index of the first non-header trade skill entry. [cite: 688]
[cite_start]-- GetNumTradeSkills() - Get the number of trade skill entries (including headers). [cite: 689]
[cite_start]-- GetTradeSkillCooldown(index) - Returns the number of seconds left for a skill to cooldown. [cite: 690]
[cite_start]-- GetTradeSkillIcon(index) - Returns the texture name of a tradeskill's icon. [cite: 691]
[cite_start]-- GetTradeSkillInfo(index) - Retrieves information about a specific trade skill. [cite: 692]
[cite_start]-- GetTradeSkillItemLink(index) - Returns the itemLink for a trade skill item. [cite: 695]
[cite_start]-- GetTradeSkillLine() - Returns information about the selected skill line. [cite: 697]
[cite_start]-- GetTradeSkillReagentInfo(tradeSkillRecipeId, reagentId) - Returns data on the reagent, including a count of the player's inventory. [cite: 700]
[cite_start]-- GetTradeSkillReagentItemLink(index, reagentId) - Returns the itemLink for one of the reagents needed to craft the given item. [cite: 700]
[cite_start]-- GetTradeSkillSelectionIndex() - Returns the Id of the currently selected trade skill, 0 if none selected. [cite: 701]
[cite_start]-- SelectTradeSkill(index) - Select a specific trade skill in the list. [cite: 706]
--]]

--[[ --- ==== Trading Functions ==== ---
[cite_start]-- AcceptTrade() - A pending trade will be accepted. [cite: 709]
[cite_start]-- AddTradeMoney() - Adds the money dropped into the player's trade frame. [cite: 710]
[cite_start]-- BeginTrade() - Begins the trade with the target. [cite: 711]
[cite_start]-- CancelTrade() - Declines the offer to trade with the other player. [cite: 712]
[cite_start]-- CancelTradeAccept() - Cancels the trade attempt which required an accept. [cite: 713]
[cite_start]-- ClickTargetTradeButton(index) - (No description provided). [cite: 656]
[cite_start]-- ClickTradeButton(index) - Equivalent of a mouseclick on the trade window buttons [1-7]. [cite: 713]
[cite_start]-- CloseTrade() - Closes the trade. [cite: 714]
[cite_start]-- GetPlayerTradeMoney() - Returns the amount of money the player has in the trade window. [cite: 715]
[cite_start]-- GetTargetTradeMoney() - Returns the amount of money in the trade frame of the target player. [cite: 716]
[cite_start]-- GetTradePlayerItemInfo(id) - Returns information about a trade item. [cite: 717]
[cite_start]-- GetTradePlayerItemLink(id) - Returns an itemLink for the given item in your side of the trade window. [cite: 717]
[cite_start]-- GetTradeTargetItemInfo(id) - Returns information about a trade item. [cite: 718]
[cite_start]-- GetTradeTargetItemLink(id) - Returns an itemLink for the given item in the other player's side of the trade window. [cite: 718]
[cite_start]-- InitiateTrade(UnitId) - Asks the specified unit to trade. [cite: 719]
[cite_start]-- PickupPlayerMoney(amount) - Picks up an amount of money from the player. [cite: 720]
[cite_start]-- PickupTradeMoney(amount) - (No description provided). [cite: 720]
[cite_start]-- ReplaceTradeEnchant() - Confirm the replacement of an enchantment via trade. [cite: 721]
[cite_start]-- SetTradeMoney(amount) - (No description provided). [cite: 721]
--]]

--[[ --- ==== Training Functions ==== ---
[cite_start]-- BuyTrainerService(index) - Used for buying new/upgrading professions, profession items and class skills. [cite: 722]
[cite_start]-- CloseTrainer() - Closes the trainer window. [cite: 723]
[cite_start]-- CollapseTrainerSkillLine(index) - Collapses a header, hiding all spells below it. [cite: 723]
[cite_start]-- ExpandTrainerSkillLine(index) - Expands a header, showing all spells below it. [cite: 724]
[cite_start]-- GetNumTrainerServices() - Get the number of the trainer services. [cite: 724]
[cite_start]-- GetTrainerGreetingText() - Get the trainer's greeting text. [cite: 725]
[cite_start]-- GetTrainerSelectionIndex() - Get the index of the selected trainer service. [cite: 726]
[cite_start]-- GetTrainerServiceCost(index) - Returns the cost of a specific trainer service. [cite: 728]
[cite_start]-- GetTrainerServiceDescription(index) - Returns the description of a specific trainer service. [cite: 729]
[cite_start]-- GetTrainerServiceIcon(index) - Returns icon texture for a trainer service. [cite: 730]
[cite_start]-- GetTrainerServiceInfo(index) - Returns information about a trainer service. [cite: 731]
[cite_start]-- GetTrainerServiceLevelReq(index) - Get the required level to learn the skill. [cite: 732]
--]]

--[[ --- ==== Unit Functions ==== ---
[cite_start]-- AssistUnit("unit") - Instructs your character to assist the specified unit. [cite: 740]
[cite_start]-- CheckInteractDistance("unit", distIndex) - (No description provided). [cite: 741]
[cite_start]-- DropItemOnUnit("unit") - Drops an item from the cursor onto a unit. [cite: 742]
[cite_start]-- FollowUnit("unit") - Follow an ally with the specified UnitID. [cite: 742]
[cite_start]-- InviteToParty("unit") - Invite a unit to a party by its unit id (likely "target"). [cite: 742]
[cite_start]-- IsUnitOnQuest(questIndex, "unit") - Determine if the specified unit is on the given quest. [cite: 743]
[cite_start]-- SpellCanTargetUnit("unit") - Returns true if the spell awaiting target selection can be cast on the specified unit. [cite: 744]
[cite_start]-- SpellTargetUnit("unit") - Casts the spell awaiting target selection on the specified unit. [cite: 745]
[cite_start]-- StartDuelUnit("unit") - Challenge a unit to a duel. [cite: 746]
[cite_start]-- TargetUnit("unit") - Selects the specified unit as the current target. [cite: 747]
[cite_start]-- UnitAffectingCombat("unit") - Determine if the unit is in combat or has aggro (returns 1 if true, nil if false). [cite: 748]
[cite_start]-- UnitArmor("unit") - Returns the armor statistics relevant to the specified unit. [cite: 749]
[cite_start]-- UnitAttackBothHands("unit") - Returns information about the unit's melee attacks. [cite: 750]
[cite_start]-- UnitAttackPower("unit") - Returns the unit's melee attack power and modifiers. [cite: 751]
[cite_start]-- UnitAttackSpeed("unit") - Returns the unit's melee attack speed for each hand. [cite: 752]
[cite_start]-- UnitBuff("unit", index[, showCastable]) - Retrieves info about a buff of a certain unit. [cite: 753]
[cite_start]-- UnitCanAssist("unit", "otherUnit") - Returns true if the first unit can assist the second, false otherwise. [cite: 754]
[cite_start]-- UnitCanAttack("unit", "otherUnit") - Returns true if the first unit can attack the second, false otherwise. [cite: 755]
[cite_start]-- UnitClass("unit") - Returns the class name of the specified unit (e.g., "Warrior"). [cite: 757]
[cite_start]-- UnitClassification("unit") - Returns the classification of the specified unit (e.g., "elite" or "worldboss"). [cite: 758]
[cite_start]-- UnitCreatureFamily("unit") - Returns the type of creature of the specified unit (e.g., "Crab"). [cite: 759]
[cite_start]-- UnitCreatureType("unit") - Returns the classification type of creature of the specified unit (e.g., "Beast"). [cite: 760]
[cite_start]-- UnitDamage("unit") - Returns the damage statistics relevant to the specified unit. [cite: 761]
[cite_start]-- UnitDebuff("unit", index[, showDispellable]) - Retrieves info about a debuff of a certain unit. [cite: 762]
[cite_start]-- UnitDefense("unit") - Returns the base defense skill of the specified unit. [cite: 763]
[cite_start]-- UnitExists("unit") - Returns true if the specified unit exists, false otherwise. [cite: 764]
-- UnitFactionGroup("unit") - Returns the faction group id and name of the specified unit. (e.g. "Alliance")[cite_start]. [cite: 765]
[cite_start]-- UnitHealth("unit") - Returns the current health, in points, of the specified unit. [cite: 766]
[cite_start]-- UnitHealthMax("unit") - Returns the maximum health, in points, of the specified unit. [cite: 767]
[cite_start]-- UnitInParty("unit") - Returns true if the unit is a member of your party. [cite: 768]
[cite_start]-- UnitInRaid("unit") - Returns 1 if unit is in your raid, nil if not. [cite: 769]
[cite_start]-- UnitIsCharmed("unit") - Returns true if the specified unit is charmed, false otherwise. [cite: 770]
[cite_start]-- UnitIsCivilian("unit") - Returns true if the unit is a civilian NPC. [cite: 771]
[cite_start]-- UnitIsConnected("unit") - Returns 1 if the specified unit is connected or npc, nil if offline or not a valid unit. [cite: 772]
[cite_start]-- UnitIsCorpse("unit") - Returns true if the specified unit is a corpse, false otherwise. [cite: 773]
[cite_start]-- UnitIsDead("unit") - Returns true if the specified unit is dead, nil otherwise. [cite: 774]
[cite_start]-- UnitIsDeadOrGhost("unit") - Returns true if the specified unit is dead or a ghost, nil otherwise. [cite: 775]
[cite_start]-- UnitIsEnemy("unit", "otherUnit") - Returns true if the specified units are enemies, false otherwise. [cite: 776]
[cite_start]-- UnitIsFriend("unit", "otherUnit") - Returns true if the specified units are friends, false otherwise. [cite: 777]
[cite_start]-- UnitIsGhost("unit") - Returns true if the specified unit is a ghost, false otherwise. [cite: 778]
[cite_start]-- UnitIsPVP("unit") - Returns true if the specified unit is flagged for PVP, false otherwise. [cite: 779]
[cite_start]-- UnitIsPartyLeader("unit") - Returns true if the unit is the leader of its party. [cite: 781]
[cite_start]-- UnitIsPlayer("unit") - Returns true if the specified unit is a player character, false otherwise. [cite: 782]
[cite_start]-- UnitIsTapped("unit") - Returns true if the specified unit is tapped, false otherwise. [cite: 783]
[cite_start]-- UnitIsTappedByPlayer("unit") - Returns true if the specified unit is tapped by the player himself, otherwise false. [cite: 784]
[cite_start]-- UnitIsVisible("unit") - 1 if visible, nil if not. [cite: 784]
[cite_start]-- UnitLevel("unit") - Returns the level of a unit. [cite: 784]
[cite_start]-- UnitMana("unit") - Returns the current mana (or energy,rage,etc), in points, of the specified unit. [cite: 784]
[cite_start]-- UnitManaMax("unit") - Returns the maximum mana (or energy,rage,etc), in points, of the specified unit. [cite: 784]
[cite_start]-- UnitName("unit") - Returns the name (and realm name) of a unit. [cite: 784]
[cite_start]-- UnitOnTaxi("unit") - Returns 1 if unit is on a taxi. [cite: 785]
[cite_start]-- UnitPlayerControlled("unit") - Returns true if the specified unit is controlled by a player, false otherwise. [cite: 785]
-- UnitPlayerOrPetInParty("unit") - Returns 1 if the unit/pet is in the player's party, nil otherwise. [cite_start][Added in 1.12]. [cite: 785]
-- UnitPlayerOrPetInRaid("unit") - Returns 1 if the unit/pet is in the player's raid, nil otherwise. [cite_start][Added in 1.12]. [cite: 785]
[cite_start]-- UnitPVPName("unit") - Returns unit's name with PvP rank prefix (e.g., "Corporal Allianceguy"). [cite: 786]
[cite_start]-- UnitPVPRank("unit") - Get PvP rank information for requested unit. [cite: 787]
[cite_start]-- UnitPowerType("unit") - Returns a number corresponding to the power type (e.g., mana, rage or energy). [cite: 788]
[cite_start]-- UnitRace("unit") - Returns the race name of the specified unit (e.g., "Human" or "Troll"). [cite: 789]
[cite_start]-- UnitRangedAttack("unit") - Returns the ranged attack number of the unit. [cite: 790]
[cite_start]-- UnitRangedAttackPower("unit") - Returns the ranged attack power of the unit. [cite: 791]
[cite_start]-- UnitRangedDamage("unit") - Returns the ranged attack speed and damage of the unit. [cite: 792]
[cite_start]-- UnitReaction("unit", "otherUnit") - Returns a number corresponding to the reaction of the first unit towards the second. [cite: 793]
[cite_start]-- UnitResistance("unit", "resistanceIndex") - Returns the resistance statistics for the unit and resistance type. [cite: 794]
[cite_start]-- UnitSex("unit") - Returns a code indicating the gender of the specified unit (1=unknown, 2=male, 3=female). [cite: 795]
[cite_start]-- UnitStat("unit", statIndex) - Returns the statistics for the unit and basic attribute (e.g., strength or intellect). [cite: 796]
[cite_start]-- UnitXP("unit") - Returns the number of experience points the unit has (only works on player). [cite: 797]
[cite_start]-- UnitXPMax("unit") - Returns the number of experience points the unit needs to level (only works on player). [cite: 798]
[cite_start]-- SetPortraitTexture(texture, "unit") - Paint a Texture object with the specified unit's portrait. [cite: 799]
--]]

--[[ --- ==== Who Functions ==== ---
[cite_start]-- GetNumWhoResults() - Return the number of entries resulting from your most recent /who query. [cite: 801]
[cite_start]-- GetWhoInfo(index) - (No description provided). [cite: 801]
[cite_start]-- SendWho("filter") - Send a who request to the server. [cite: 802]
[cite_start]-- SetWhoToUI(toUIFlag) - Indicate that who request results should be delivered as WHO_LIST_UPDATE instead of to chat. [cite: 803]
[cite_start]-- SortWho(sortType) - Sorts an existing /who list. [cite: 804]
--]]

--[[ --- ==== Uncategorized Functions ==== ---
[cite_start]-- PartialPlayTime() - (No description provided). [cite: 804]
[cite_start]-- NoPlayTime() - (No description provided). [cite: 804]
[cite_start]-- GetBillingTimeRested() - (No description provided). [cite: 804]
[cite_start]-- GetMinigameState() - (No description provided). [cite: 804]
[cite_start]-- GetMinigameType() - (No description provided). [cite: 804]
--]]