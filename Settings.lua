-- Copyright (C) IceQ1337, All Rights Reserved
-- https://wow.curseforge.com/projects/advanced-tabards

local _, AddOn = ...
local Settings = {}

Settings.DefaultSettings = {}
Settings.Options = {}

AddOn.Settings = Settings
AddOn.SettingsKey = AddOn.AddonName .. "_Settings"

-- Setup Functions
function AddOn.AddOptionsSubCategory(name)
    if not Settings.AddonOptionCategoryID then
        return
    end

    local parentCategory = _G.Settings.GetCategory(Settings.AddonOptionCategoryID)
    local subCategory, layout = _G.Settings.RegisterVerticalLayoutSubcategory(parentCategory, name)
    _G.Settings.RegisterAddOnCategory(subCategory)

    return subCategory
end

function AddOn.OnSettingChanged(_, setting, value)
    local variable = setting:GetVariable()
    Settings.Options[variable] = value
end

-- Interface Options
-- Main
Settings.Interface = {}
Settings.Interface.MainPanel = CreateFrame("Frame", AddOn.AddonName .. "_SettingsFrame")
Settings.Interface.MainPanel.name = AddOn.AddonName

Settings.Interface.MainPanel.title = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
Settings.Interface.MainPanel.title:SetPoint("TOPLEFT", 16, -16)
Settings.Interface.MainPanel.title:SetText(AddOn.AddonName)

Settings.Interface.MainPanel.notes = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
Settings.Interface.MainPanel.notes:SetPoint("TOPLEFT", Settings.Interface.MainPanel.title, "BOTTOMLEFT", 0, -8)
Settings.Interface.MainPanel.notes:SetText("Notes:")

Settings.Interface.MainPanel.notes.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
Settings.Interface.MainPanel.notes.text:SetPoint("LEFT", Settings.Interface.MainPanel.notes, "RIGHT", 8, 0)
Settings.Interface.MainPanel.notes.text:SetText(AddOn.AddonNotes)

Settings.Interface.MainPanel.author = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
Settings.Interface.MainPanel.author:SetPoint("TOPLEFT", Settings.Interface.MainPanel.notes, "BOTTOMLEFT", 0, -8)
Settings.Interface.MainPanel.author:SetText("Author:")

Settings.Interface.MainPanel.author.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
Settings.Interface.MainPanel.author.text:SetPoint("LEFT", Settings.Interface.MainPanel.author, "RIGHT", 8, 0)
Settings.Interface.MainPanel.author.text:SetText(AddOn.AddonAuthor)

Settings.Interface.MainPanel.version = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
Settings.Interface.MainPanel.version:SetPoint("TOPLEFT", Settings.Interface.MainPanel.author, "BOTTOMLEFT", 0, -8)
Settings.Interface.MainPanel.version:SetText("Version:")

Settings.Interface.MainPanel.version.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
Settings.Interface.MainPanel.version.text:SetPoint("LEFT", Settings.Interface.MainPanel.version, "RIGHT", 8, 0)
Settings.Interface.MainPanel.version.text:SetText(AddOn.AddonVersion)

Settings.Interface.MainPanel.url = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
Settings.Interface.MainPanel.url:SetPoint("TOPLEFT", Settings.Interface.MainPanel.version, "BOTTOMLEFT", 0, -8)
Settings.Interface.MainPanel.url:SetText("URL:")

Settings.Interface.MainPanel.url.text = Settings.Interface.MainPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
Settings.Interface.MainPanel.url.text:SetPoint("LEFT", Settings.Interface.MainPanel.url, "RIGHT", 8, 0)
Settings.Interface.MainPanel.url.text:SetText("https://wow.curseforge.com/projects/advanced-tabards")

local mainCategory, mainCategoryLayout = _G.Settings.RegisterCanvasLayoutCategory(Settings.Interface.MainPanel, Settings.Interface.MainPanel.name)
Settings.AddonOptionCategoryID = mainCategory:GetID()
_G.Settings.RegisterAddOnCategory(mainCategory)

-- General
Settings.Interface.GeneralPanel = AddOn.AddOptionsSubCategory("General")

function Settings.GetVariable(name)
    return AddOn.AddonName .. "_" .. name
end

function Settings.Get(name)
    return Settings.Options[Settings.GetVariable(name)]
end

function Settings.Setup()
    do
        local variable = Settings.GetVariable("WelcomeMessage")
        Settings.DefaultSettings[variable] = true

        local name = "Welcome Message"
        local tooltip = "Enable or disable the welcome message."
        local defaultValue = Settings.DefaultSettings[variable]
        local currentValue = Settings.Options[variable] or defaultValue

        local setting =
            _G.Settings.RegisterAddOnSetting(
            Settings.Interface.GeneralPanel,
            variable,
            variable,
            Settings.Options,
            type(defaultValue),
            name,
            defaultValue
        )
        _G.Settings.SetValue(variable, currentValue)
        _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
        _G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
    end

    do
        local variable = Settings.GetVariable("EnableTooltips")
        Settings.DefaultSettings[variable] = true

        local name = "Tooltips"
        local tooltip = "Enable or disable the tooltips."
        local defaultValue = Settings.DefaultSettings[variable]
        local currentValue = Settings.Options[variable] or defaultValue

        local setting =
            _G.Settings.RegisterAddOnSetting(
            Settings.Interface.GeneralPanel,
            variable,
            variable,
            Settings.Options,
            type(defaultValue),
            name,
            defaultValue
        )
        _G.Settings.SetValue(variable, currentValue)
        _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
        _G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
    end

    do
        local variable = Settings.GetVariable("ShowAddonNameInTooltip")
        Settings.DefaultSettings[variable] = true

        local name = "Addon Name in Tooltip"
        local tooltip = "Enable or disable the addon name in the tooltip."
        local defaultValue = Settings.DefaultSettings[variable]
        local currentValue = Settings.Options[variable] or defaultValue

        local setting =
            _G.Settings.RegisterAddOnSetting(
            Settings.Interface.GeneralPanel,
            variable,
            variable,
            Settings.Options,
            type(defaultValue),
            name,
            defaultValue
        )
        _G.Settings.SetValue(variable, currentValue)
        _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
        _G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
    end

    do
        local variable = Settings.GetVariable("EnableAutotrack")
        Settings.DefaultSettings[variable] = true

        local name = "Automatic Tracking"
        local tooltip = "Enable or disable the automatic tracking."
        local defaultValue = Settings.DefaultSettings[variable]
        local currentValue = Settings.Options[variable] or defaultValue

        local setting =
            _G.Settings.RegisterAddOnSetting(
            Settings.Interface.GeneralPanel,
            variable,
            variable,
            Settings.Options,
            type(defaultValue),
            name,
            defaultValue
        )
        _G.Settings.SetValue(variable, currentValue)
        _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
        _G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
    end

    do
        local variable = Settings.GetVariable("ChatMessages")
        Settings.DefaultSettings[variable] = false

        local name = "Chat Messages"
        local tooltip = "Enable or disable the chat messages."
        local defaultValue = Settings.DefaultSettings[variable]
        local currentValue = Settings.Options[variable] or defaultValue

        local setting =
            _G.Settings.RegisterAddOnSetting(
            Settings.Interface.GeneralPanel,
            variable,
            variable,
            Settings.Options,
            type(defaultValue),
            name,
            defaultValue
        )
        _G.Settings.SetValue(variable, currentValue)
        _G.Settings.CreateCheckbox(Settings.Interface.GeneralPanel, setting, tooltip)
        _G.Settings.SetOnValueChangedCallback(variable, AddOn.OnSettingChanged)
    end
end
