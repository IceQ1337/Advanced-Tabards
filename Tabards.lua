local _, AddOn = ...;
local Tabards = {};
AddOn.Tabards = Tabards;

Tabards.List = {
    ["45579"] = { -- Darnassus Tabard
        FACTION = 69
    },
    ["45580"] = { -- Exodar Tabard
        FACTION = 930
    },
    ["45578"] = { -- Gnomeregan Tabard
        FACTION = 54
    },
    ["45577"] = { -- Ironforge Tabard
        FACTION = 47
    },
    ["45574"] = { -- Stormwind Tabard
        FACTION = 72
    },
    ["45582"] = { -- Darkspear Tabard
        FACTION = 530
    },
    ["45581"] = { -- Orgrimmar Tabard
        FACTION = 76
    },
    ["45585"] = { -- Silvermoon City Tabard
        FACTION = 911
    },
    ["45584"] = { -- Thunder Bluff Tabard
        FACTION = 81
    },
    ["45583"] = { -- Undercity Tabard
        FACTION = 68
    }, -- Guild Tabards
    ["5976"] = { -- Guild Tabard
        FACTION = 1168 
    },
    ["69209"] = { -- Illustrious Guild Tabard ( 50% )
        FACTION = 1168 
    },
    ["69210"] = { -- Renowned Guild Tabard ( 100% )
        FACTION = 1168 
    }, -- Azeroth
    ["63379"] = { -- Baradin's Wardens Tabard
        FACTION = 1177 
    },
    ["63378"] = { -- Hellscream's Reach Tabard 
        FACTION = 1178 
    },
    ["64882"] = { -- Gilneas Tabard
        FACTION = 1134 
    },
    ["64884"] = { -- Bilgewater Cartel Tabard
        FACTION = 1133 
    },
    ["65904"] = { -- Tabard of Ramkahen
        FACTION = 1173 
    },
    ["65908"] = { -- Tabard of the Wildhammer Clan
        FACTION = 1174 
    },
    ["65909"] = { -- Tabard of the Dragonmaw Clan
        FACTION = 1172 
    },
    ["65905"] = { -- Tabard of the Earthen Ring
        FACTION = 1135 
    },
    ["65906"] = { -- Tabard of the Guardians of Hyjal
        FACTION = 1158 
    },
    ["65907"] = { -- Tabard of Therazane
        FACTION = 1171 
    },
    ["20132"] = { -- Arathor Battle Tabard
        FACTION = 509 
    },
    ["20131"] = { -- Battle Tabard of the Defilers
        FACTION = 510 
    }, -- Cataclysm
    ["31779"] = { -- Aldor Tabard
        FACTION = 932 
    },
    ["31780"] = { -- Scryers Tabard 
        FACTION = 934 
    },
    ["31804"] = { -- Cenarion Expedition Tabard
        FACTION = 942 
    },
    ["31776"] = { -- Consortium Tabard
        FACTION = 933 
    },
    ["23999"] = { -- Honor Hold Tabard
        FACTION = 946 
    },
    ["24004"] = { -- Thrallmar Tabard
        FACTION = 947 
    },
    ["31777"] = { -- Keepers of Time Tabard
        FACTION = 989 
    },
    ["31773"] = { -- Mag'har Tabard 
        FACTION = 941 
    },
    ["31774"] = { -- Kurenai Tabard
        FACTION = 978 
    },
    ["31778"] = { -- Lower City Tabard
        FACTION = 1011 
    },
    ["32828"] = { -- Ogri'la Tabard
        FACTION = 1038 
    },
    ["31781"] = { -- Sha'tar Tabard
        FACTION = 935 
    },
    ["32445"] = { -- Skyguard Tabard
        FACTION = 1031 
    },
    ["31775"] = { -- Sporeggar Tabard
        FACTION = 970 
    },
    ["35221"] = { -- Tabard of the Shattered Sun
        FACTION = 1077 
    }, -- Wrath of the Lich King
    ["43154"] = { -- Tabard of the Argent Crusade
        FACTION = 1106 
    },
    ["43155"] = { -- Tabard of the Ebon Blade
        FACTION = 1098 
    },
    ["43157"] = { -- Tabard of the Kirin Tor 
        FACTION = 1090 
    },
    ["43156"] = { -- Tabard of the Wyrmrest Accord
        FACTION = 1091 
    },
    ["46817"] = { -- Silver Covenant Tabard
        FACTION = 1094 
    },
    ["46818"] = { -- Sunreaver Tabard
        FACTION = 1124 
    }, -- Mists of Pandaria
    ["83079"] = { -- Tushui Tabard
        FACTION = 1353 
    },
    ["83080"] = { -- Huojin Tabard
        FACTION = 1352 
    },
    ["89401"] = { -- Anglers Tabard
        FACTION = 1302 
    },
    ["89799"] = { -- August Celestials Tabard
        FACTION = 1341 
    },
    ["89797"] = { -- Golden Lotus Tabard
        FACTION = 1269 
    },
    ["95591"] = { -- Kirin Tor Offensive Tabard
        FACTION = 1387 
    },
    ["89798"] = { -- Klaxxi Tabard
        FACTION = 1337 
    },
    ["89795"] = { -- Lorewalkers Tabard
        FACTION = 1345 
    },
    ["89796"] = { -- Order of the Cloud Serpent Tabard
        FACTION = 1271 
    },
    ["89800"] = { -- Shado-Pan Tabard
        FACTION = 1270 
    },
    ["97131"] = { -- Shado-Pan Assault Tabard
        FACTION = 1435 
    },
    ["95592"] = { -- Sunreaver Onslaught Tabard
        FACTION = 1388 
    },
    ["89784"] = { -- Tillers Tabard 
        FACTION = 1272 
    }, -- Warlords of Draenor
    ["119136"] = { -- Arakkoa Outcasts Tabard
        FACTION = 1515 
    },
    ["119135"] = { -- Council of Exarchs Tabard
        FACTION = 1731 
    },
    ["119133"] = { -- Frostwolf Tabard
        FACTION = 1445 
    },
    ["119138"] = { -- Laughing Skull Orcs Tabard
        FACTION = 1708 
    },
    ["119140"] = { -- Sha'tari Defense Tabard
        FACTION = 1710 
    },
    ["119137"] = { -- Steamwheedle "Preservation" Society Tabard
        FACTION = 1711 
    },
    ["115518"] = { -- Vol'jin's Spear Tabard
        FACTION = 1681 
    },
    ["115517"] = { -- Wrynn's Vanguard Tabard
        FACTION = 1682 
    },
    ["128450"] = { -- Order of the Awakened Tabard
        FACTION = 1849 
    },
    ["128449"] = { -- Saberstalkers Tabard
        FACTION = 1850 
    }, -- Legion
    ["140575"] = { -- Nightfallen Tabard
        FACTION = 1859 
    },
    ["140576"] = { -- Tabard of the Highmountain Tribe
        FACTION = 1828 
    },
    ["140577"] = { -- Court of Farondis Tabard
        FACTION = 1900 
    },
    ["140578"] = { -- Dreamweaver Initiate's Tabard
        FACTION = 1883 
    },
    ["140667"] = { -- Tabard of the Dreamweavers
        FACTION = 1883
    },
    ["140579"] = { -- Valarjar Tabard
        FACTION = 1948 
    },
    ["140580"] = { -- Warden's Tabard
        FACTION = 1894 
    },
    ["147205"] = { -- Legionfall Tabard
        FACTION = 2045 
    },
    ["152399"] = { -- Army of the Light Tabard 
        FACTION = 2165 
    },
    ["152669"] = { -- Argussian Reach Tabard
        FACTION = 2170 
    }, -- Battle for Azeroth
    ["160540"] = { -- Proudmoore Admiralty Tabard
        FACTION = 2160 
    },
    ["160541"] = { -- Order of Embers Tabard 
        FACTION = 2161 
    },
    ["160542"] = { -- Storm's Wake Tabard
        FACTION = 2162 
    },
    ["160539"] = { -- Tabard of the 7th Legion
        FACTION = 2159 
    },
    ["160546"] = { -- Tabard of the Zandalari Empire
        FACTION = 2103 
    },
    ["160547"] = { -- Talanji's Expedition Tabard
        FACTION = 2156 
    },
    ["160548"] = { -- Tabard of the Voldunai
        FACTION = 2158 
    },
    ["160545"] = { -- Tabard of the Honorbound
        FACTION = 2157 
    },
    ["160544"] = { -- Champions of Azeroth Tabard
        FACTION = 2164 
    },
    ["160543"] = { -- Tabard of the Tortollan Seekers
        FACTION = 2163 
    },
    ["174648"] = { -- Uldum Accord Tabard
        FACTION = 2417 
    },
    ["174647"] = { -- Rajani Tabard
        FACTION = 2415 
    }
};