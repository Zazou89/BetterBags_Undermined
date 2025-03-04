---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule('Categories')

-- Localization table
local locales = {
    ["enUS"] = {
        ["Undermine(d)"] = "Undermine(d)",
        ["Undermine(d) - G99"] = "Undermine(d) - G99",
    },
    ["frFR"] = {
        ["Undermine(d)"] = "Terremine(r)",
        ["Undermine(d) - G99"] = "Terremine(r) - G99",
    },
    ["deDE"] = {
        ["Undermine(d)"] = "Lorenhalt",
        ["Undermine(d) - G99"] = "Lorenhalt - G99",
    },
    ["esES"] = {
        ["Undermine(d)"] = "Ronda Por Minahonda",
        ["Undermine(d) - G99"] = "Ronda Por Minahonda - G99",
    },
    ["esMX"] = {
        ["Undermine(d)"] = "Minahonda",
        ["Undermine(d) - G99"] = "Minahonda - G99",
    },
    ["itIT"] = {
        ["Undermine(d)"] = "Cavaf(f)onda",
        ["Undermine(d) - G99"] = "Cavaf(f)onda - G99",
    },
    ["ptBR"] = {
        ["Undermine(d)"] = "Inframinado",
        ["Undermine(d) - G99"] = "Inframinado - G99",
    }
}

-- Detects current language
local currentLocale = GetLocale()

-- Function to get the translation
local function L(key)
    return locales[currentLocale] and locales[currentLocale][key] or locales["enUS"][key]
end

--G-99 Breakneck parts
local G99 = {
    --Paint
    235388, --Paint: Redlining Red
    235389, --Paint: Goblin Green
    235390, --Paint: Body Roll Blue
    235391, --Paint: Yellow Cake Yellow
    --Engine
    232981, --GNZ Airmaster 9000
    232982, --The Pozzik Standard
    --Wheel
    232985, --22H Slicks
    232986, --GE86 Advance
    --Turbo 1
    232984, --Handcrank
    234381, --Handcrank Fuel Tank
    234386, --Handcrank Fuel Injector
    234415, --Handcrank Casing
    234417, --Handcrank Gears
    234420, -- Handcrank Mounting System
    --Turbo 2
    232983, --Steamboil
    234380, --Steamboil Fuel Tank
    234387, --Steamboil Fuel Injector
    234416, --Steamboil Casing
    234418, --Steamboil Gears
    234419, --Steamboil Mounting System
    --Horn
    236672, --The Ol' Low-and-Slow
    236670, --Maniacal Melodies
    236671, --The Buzzer
    236669, --The Whole Brass Band
}

--Shipping and Handling Chests
local Chests = {
    236756, --Socially Expected Tip Chest
    236757, --Generous Tip Chest
    236758, --Extravagant Tip Chest
}

--C.H.E.T.T. List
local CHETT = {
    236682, --C.H.E.T.T. List
    235053, --Completed C.H.E.T.T. List
    236764, --Finder's Fee
    236689, --Finder's Fee
    236763, --Finder's Fee
    236765, --Finder's Fee
}
--Miscellaneous
local Miscellaneous = {
    234741, --Miscellaneous Mechanica
    229810, --Vintage Kaja'Cola Can
    225415, --Caddy Caller
    233246, --Gunk-Covered Thingy
}

--Color categories
local colorPrefix = "|cffff9c00"
local resetColor = "|r"

--Wipe category too ensure the item list is up to date
categories:WipeCategory(L("Undermine(d)"))
categories:WipeCategory(L("Undermine(d) - G99"))

-- Add G-99 Breakneck Parts to a separate category
for _, ItemID in pairs(G99) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Undermine(d)") .. resetColor)
end

-- Add Shipping and Handling, C.H.E.T.T & Miscellaneous items to the Undermine(d) category
for _, itemList in pairs({Chests, CHETT, Miscellaneous}) do
    for _, ItemID in pairs(itemList) do
        categories:AddItemToCategory(ItemID, colorPrefix .. L("Undermine(d) - G99") .. resetColor)
    end
end