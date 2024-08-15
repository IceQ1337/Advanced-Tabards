-- Copyright (C) IceQ1337, All Rights Reserved
-- https://wow.curseforge.com/projects/advanced-tabards

-- Addon Variables
local AddonName, AddOn = ...;
AddOn.AddonName = C_AddOns.GetAddOnMetadata("AdvancedTabards", "Title");
AddOn.AddonVersion = C_AddOns.GetAddOnMetadata("AdvancedTabards", "Version");
AddOn.AddonAuthor = C_AddOns.GetAddOnMetadata("AdvancedTabards", "Author");
AddOn.AddonNotes = C_AddOns.GetAddOnMetadata("AdvancedTabards", "Notes");

_G["AdvancedTabards"] = AddOn;

-- Text Globals
TEXT_COLOR_RED = "|cFFFF0000";
TEXT_COLOR_GREEN = "|cFF00FF00";
TEXT_COLOR_YELLOW = "|cFFFFFF00";
TEXT_COLOR_CYAN = "|cFF00FFFF";
TEXT_COLOR_RESET = "|r";

-- Chat MSG
function AddOn.PrintShortMSG(msg)
	text = TEXT_COLOR_CYAN .. "AT > " .. TEXT_COLOR_RESET .. msg;
	DEFAULT_CHAT_FRAME:AddMessage(text);
end

function AddOn.PrintLongMSG(msg)
	text = TEXT_COLOR_CYAN .. AddOn.AddonName .. ": " .. TEXT_COLOR_RESET .. msg;
	DEFAULT_CHAT_FRAME:AddMessage(text);
end

-- Event Handlers
function AddOn:ADDON_LOADED(addon)
	if not addon == AddonName then return end

    AddOn.eventFrame:UnregisterEvent("ADDON_LOADED");
    
    AddOn.Settings.Options = _G["AT_Settings"] or AddOn.Settings.DefaultSettings;
    
    if AddOn.Settings.Options["welcomeMessage"] then
        AddOn.PrintLongMSG(AddOn.AddonVersion .. " loaded successfully.");
    end
end

function AddOn:PLAYER_ENTERING_WORLD(addon)
    AddOn.eventFrame:RegisterEvent("PLAYER_LOGOUT");
    AddOn.eventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
end

function AddOn:PLAYER_LOGOUT(addon)
    _G["AT_Settings"] = AddOn.Settings.Options;
end

function AddOn:PLAYER_EQUIPMENT_CHANGED(addon)
    if not AddOn.Settings.Options["enableAutotrack"] then return; end

    local tabardSlotID, tabardTextureName = GetInventorySlotInfo("TabardSlot");
    if tabardSlotID then
        local tabardEquipped = GetInventoryItemID("Player", tabardSlotID);
        if tabardEquipped then
            local tabardID = tostring(tabardEquipped);
            if AddOn.Tabards.List[tabardID] then
                _G.C_Reputation.ExpandAllFactionHeaders();
                local factions = {};
                for x = 1, _G.C_Reputation.GetNumFactions() do
                    factions[x] = _G.C_Reputation.GetFactionDataByIndex(x);
                end

                if AddOn.Tabards.List[tabardID].FACTION == 1168 and not IsInGuild() then
                    if AddOn.Settings.Options["chatMessages"] then
                        AddOn.PrintShortMSG(TEXT_COLOR_RED .. "Automatic Tracking Failed! ( Not in Guild )");
                    end
                    return;
                end

                for i, v in pairs(factions) do
                    if factions[i].isWatched then return; end -- Is Watched
                    if factions[i].reaction == 8 then return; end -- Is Exalted

                    if factions[i].factionID == AddOn.Tabards.List[tabardID].FACTION then
                        _G.C_Reputation.SetWatchedFactionByIndex(i);
                        if AddOn.Settings.Options["chatMessages"] then
                            AddOn.PrintShortMSG("Automatic Tracking of: " .. TEXT_COLOR_GREEN .. factions[i].name);
                        end
                    end
                end
            end
        end
    end
end

-- Event Frame
AddOn.eventFrame = CreateFrame("Frame", nil, UIParent);
AddOn.eventFrame:SetScript("OnEvent", function(self, event, ...)
    if AddOn[event] then AddOn[event](AddOn, ...) end
end);
AddOn.eventFrame:RegisterEvent("ADDON_LOADED");
AddOn.eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");

-- Hook Game Tooltip
function AddOn.SetGameTooltip(tooltip)
    if not AddOn.Settings.Options["enableTooltips"] then return; end

    if tooltip.GetItem == nil or type(tooltip.GetItem) ~= 'function' then return; end

    local _, link = tooltip:GetItem();
    if not link then return; end

    local itemString = string.match(link, "item[%-?%d:]+");

    if itemString then
        local _, itemID = strsplit(":", itemString);
        if itemID then
            if AddOn.Tabards.List[itemID] then
                local itemFaction = AddOn.Tabards.List[itemID].FACTION;
                local factionData = _G.C_Reputation.GetFactionDataByID(itemFaction);

                if not factionData then return; end

                local standingID, barValue, barMin, barMax;
                standingID = factionData.reaction;
                barValue = factionData.currentStanding;
                barMin = factionData.currentReactionThreshold;
                barMax = factionData.nextReactionThreshold;

                local factionInfo;

                if standingID == 8 then
                    factionInfo = _G["FACTION_STANDING_LABEL" .. standingID];
                else
                    local reactionGained = barValue - barMin;
                    local reactionNeeded = barMax - barMin;
                    local reactionPercentage =  ((barValue - barMin) / (barMax - barMin)) * 100;

                    factionInfo = string.format("%s %s / %s (%0.2f%%)", _G["FACTION_STANDING_LABEL" .. standingID], reactionGained, reactionNeeded, reactionPercentage);
                end

                tooltip:AddLine("\n");

                if AddOn.Settings.Options["showAddonNameInTooltip"] then
                    tooltip:AddLine("[" .. AddOn.AddonName .. "]", 0, 1, 1);
                end

                tooltip:AddLine(factionData.name .. " - " .. factionInfo);
            end
        end
    end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, AddOn.SetGameTooltip)

-- Register Slash Commands
SlashCmdList.AdvancedTabards = function()
    _G.Settings.OpenToCategory(AddOn.Settings.AddonOptionCategoryID);
end

SLASH_AdvancedTabards1 = "/at";
