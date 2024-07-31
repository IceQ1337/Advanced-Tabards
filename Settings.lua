-- Copyright (C) IceQ1337, All Rights Reserved
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

-- Setup Functions
function AddOn.AddOptionsCategory(frame)
    if Settings.AddonOptionCategoryID then
        print("Main category already exists.");
        return;
    end

    local category, layout = _G.Settings.RegisterCanvasLayoutCategory(frame, frame.name);
    Settings.AddonOptionCategoryID = category:GetID();
    _G.Settings.RegisterAddOnCategory(category);

    return category;
end

function AddOn.AddOptionsSubCategory(name)
    if not Settings.AddonOptionCategoryID then return; end

    local parentCategory = _G.Settings.GetCategory(Settings.AddonOptionCategoryID);
    local subCategory, layout = _G.Settings.RegisterVerticalLayoutSubcategory(parentCategory, name);
    _G.Settings.RegisterAddOnCategory(subCategory);

    return subCategory;
end

function AddOn.OnSettingChanged(_, setting, value)
    local variable = setting:GetVariable();
    Settings.Options[variable] = value;
end

AddOn.Settings = Settings;

-- Interface Options
-- Main
Settings.Interface = {};
Settings.Interface.MainPanel = CreateFrame("Frame", AddOn.AddonName .. "_SettingsFrame");
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

AddOn.AddOptionsCategory(Settings.Interface.MainPanel);

-- General
Settings.Interface.GeneralPanel = AddOn.AddOptionsSubCategory("General");

do
    local variable = "welcomeMessage";
    local name = "Enable/Disable Welcome Message";
    local tooltip = "Enable or disable the welcome message.";
    local defaultValue = true;

    local setting = _G.Settings.RegisterAddOnSetting(Settings.Interface.GeneralPanel, name, variable, type(defaultValue), defaultValue)
    _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
	_G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
end

do
    local variable = "enableTooltips";
    local name = "Enable/Disable Tooltips";
    local tooltip = "Enable or disable the tooltips.";
    local defaultValue = true;

    local setting = _G.Settings.RegisterAddOnSetting(Settings.Interface.GeneralPanel, name, variable, type(defaultValue), defaultValue)
    _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
	_G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
end

do
    local variable = "enableAutotrack";
    local name = "Enable/Disable Automatic Tracking";
    local tooltip = "Enable or disable the automatic tracking.";
    local defaultValue = false;

    local setting = _G.Settings.RegisterAddOnSetting(Settings.Interface.GeneralPanel, name, variable, type(defaultValue), defaultValue)
    _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
	_G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
end

do
    local variable = "chatMessages";
    local name = "Enable/Disable Chat Messages";
    local tooltip = "Enable or disable the chat messages.";
    local defaultValue = true;

    local setting = _G.Settings.RegisterAddOnSetting(Settings.Interface.GeneralPanel, name, variable, type(defaultValue), defaultValue)
    _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
	_G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
end
