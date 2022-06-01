-- Copyright (C) IceQ1337, 2018-2022, All Rights Reserved
-- https://wow.curseforge.com/projects/advanced-tabards

local _, AddOn = ...;
local Settings = {};
Settings.DefaultSettings = {
    ["welcomeMessage"] = true,
    ["enableTooltips"] = true,
    ["enableAutotrack"] = true,
    ["chatMessages"] = false
};
Settings.Options = {};

AddOn.Settings = Settings;

-- Interface Options
-- Main
Settings.Interface = {};
Settings.Interface.MainPanel = CreateFrame("Frame", "AT_OPTIONSFRAME", UIParent);
Settings.Interface.MainPanel.name = AddOn.AddonName;

Settings.Interface.MainPanel.title = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
Settings.Interface.MainPanel.title:SetPoint("TOPLEFT", 16, -16);
Settings.Interface.MainPanel.title:SetText(AddOn.AddonName);

Settings.Interface.MainPanel.notes = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
Settings.Interface.MainPanel.notes:SetPoint("TOPLEFT", Settings.Interface.MainPanel.title, "BOTTOMLEFT", 0, -8);
Settings.Interface.MainPanel.notes:SetText("Notes:");

Settings.Interface.MainPanel.notes.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.MainPanel.notes.text:SetPoint("LEFT", Settings.Interface.MainPanel.notes, "RIGHT", 8, 0);
Settings.Interface.MainPanel.notes.text:SetText(AddOn.AddonNotes);

Settings.Interface.MainPanel.author = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
Settings.Interface.MainPanel.author:SetPoint("TOPLEFT", Settings.Interface.MainPanel.notes, "BOTTOMLEFT", 0, -8);
Settings.Interface.MainPanel.author:SetText("Author:");

Settings.Interface.MainPanel.author.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.MainPanel.author.text:SetPoint("LEFT", Settings.Interface.MainPanel.author, "RIGHT", 8, 0);
Settings.Interface.MainPanel.author.text:SetText(AddOn.AddonAuthor);

Settings.Interface.MainPanel.version = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
Settings.Interface.MainPanel.version:SetPoint("TOPLEFT", Settings.Interface.MainPanel.author, "BOTTOMLEFT", 0, -8);
Settings.Interface.MainPanel.version:SetText("Version:");

Settings.Interface.MainPanel.version.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.MainPanel.version.text:SetPoint("LEFT", Settings.Interface.MainPanel.version, "RIGHT", 8, 0);
Settings.Interface.MainPanel.version.text:SetText(AddOn.AddonVersion);

Settings.Interface.MainPanel.url = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
Settings.Interface.MainPanel.url:SetPoint("TOPLEFT", Settings.Interface.MainPanel.version, "BOTTOMLEFT", 0, -8);
Settings.Interface.MainPanel.url:SetText("URL:");

Settings.Interface.MainPanel.url.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.MainPanel.url.text:SetPoint("LEFT", Settings.Interface.MainPanel.url, "RIGHT", 8, 0);
Settings.Interface.MainPanel.url.text:SetText("https://wow.curseforge.com/projects/advanced-tabards");

InterfaceOptions_AddCategory(Settings.Interface.MainPanel);

-- General
Settings.Interface.GeneralPanel = CreateFrame("Frame");
Settings.Interface.GeneralPanel.name = "General";
Settings.Interface.GeneralPanel.parent = Settings.Interface.MainPanel.name;

Settings.Interface.GeneralPanel.okay = function(self)
    Settings.Options["welcomeMessage"] = Settings.Interface.GeneralPanel.togglewelcomemessage:GetChecked();
    Settings.Options["enableTooltips"] = Settings.Interface.GeneralPanel.toggletooltip:GetChecked();
    Settings.Options["enableAutotrack"] = Settings.Interface.GeneralPanel.toggleautotrack:GetChecked();
    Settings.Options["chatMessages"] = Settings.Interface.GeneralPanel.togglechatmessages:GetChecked();
end

Settings.Interface.GeneralPanel.refresh = function(self)
    Settings.Interface.GeneralPanel.togglewelcomemessage:SetChecked(Settings.Options["welcomeMessage"]);
    Settings.Interface.GeneralPanel.toggletooltip:SetChecked(Settings.Options["enableTooltips"]);
    Settings.Interface.GeneralPanel.toggleautotrack:SetChecked(Settings.Options["enableAutotrack"]);   
    Settings.Interface.GeneralPanel.togglechatmessages:SetChecked(Settings.Options["chatMessages"]);  
end

Settings.Interface.GeneralPanel.cancel = function(self)
    self.refresh();
end

Settings.Interface.GeneralPanel.default = function(self)
    Settings.Options = Settings.DefaultSettings;
end

Settings.Interface.GeneralPanel.title = Settings.Interface.GeneralPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
Settings.Interface.GeneralPanel.title:SetPoint("TOPLEFT", 16, -16);
Settings.Interface.GeneralPanel.title:SetText(AddOn.AddonName .. " - General Options");

Settings.Interface.GeneralPanel.togglewelcomemessage = CreateFrame("CheckButton", "AT_TOGGLEWELCOMEMESSAGE", Settings.Interface.GeneralPanel, "ChatConfigCheckButtonTemplate");
Settings.Interface.GeneralPanel.togglewelcomemessage:SetPoint("TOPLEFT", Settings.Interface.GeneralPanel.title, "BOTTOMLEFT", 0, -8);

Settings.Interface.GeneralPanel.togglewelcomemessage.text = Settings.Interface.GeneralPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.GeneralPanel.togglewelcomemessage.text:SetPoint("LEFT", Settings.Interface.GeneralPanel.togglewelcomemessage, "RIGHT", 8, 0);
Settings.Interface.GeneralPanel.togglewelcomemessage.text:SetText("Enable/Disable Welcome Message");

Settings.Interface.GeneralPanel.toggletooltip = CreateFrame("CheckButton", "AT_TOGGLETOOLTP", Settings.Interface.GeneralPanel, "ChatConfigCheckButtonTemplate");
Settings.Interface.GeneralPanel.toggletooltip:SetPoint("TOPLEFT", Settings.Interface.GeneralPanel.togglewelcomemessage, "BOTTOMLEFT", 0, -8);

Settings.Interface.GeneralPanel.toggletooltip.text = Settings.Interface.GeneralPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.GeneralPanel.toggletooltip.text:SetPoint("LEFT", Settings.Interface.GeneralPanel.toggletooltip, "RIGHT", 8, 0);
Settings.Interface.GeneralPanel.toggletooltip.text:SetText("Enable/Disable Tooltips");

Settings.Interface.GeneralPanel.toggleautotrack = CreateFrame("CheckButton", "AT_TOGGLEAUTOTRACK", Settings.Interface.GeneralPanel, "ChatConfigCheckButtonTemplate");
Settings.Interface.GeneralPanel.toggleautotrack:SetPoint("TOPLEFT", Settings.Interface.GeneralPanel.toggletooltip, "BOTTOMLEFT", 0, -8);

Settings.Interface.GeneralPanel.toggleautotrack.text = Settings.Interface.GeneralPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.GeneralPanel.toggleautotrack.text:SetPoint("LEFT", Settings.Interface.GeneralPanel.toggleautotrack, "RIGHT", 8, 0);
Settings.Interface.GeneralPanel.toggleautotrack.text:SetText("Enable/Disable Automatic Tracking");

Settings.Interface.GeneralPanel.togglechatmessages = CreateFrame("CheckButton", "AT_TOGGLECHATMESSAGES", Settings.Interface.GeneralPanel, "ChatConfigCheckButtonTemplate");
Settings.Interface.GeneralPanel.togglechatmessages:SetPoint("TOPLEFT", Settings.Interface.GeneralPanel.toggleautotrack, "BOTTOMLEFT", 0, -8);

Settings.Interface.GeneralPanel.togglechatmessages.text = Settings.Interface.GeneralPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
Settings.Interface.GeneralPanel.togglechatmessages.text:SetPoint("LEFT", Settings.Interface.GeneralPanel.togglechatmessages, "RIGHT", 8, 0);
Settings.Interface.GeneralPanel.togglechatmessages.text:SetText("Enable/Disable Chat Messages");

InterfaceOptions_AddCategory(Settings.Interface.GeneralPanel);