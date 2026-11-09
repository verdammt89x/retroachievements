// Super Monkey Ball Adventure
// #ID = 21141


// ============= HELPER ==================

NULL = 0

mirror = (v) => v // Dummy accessor for ptr for if the pointed-to address is desired
// Thanks to Souzooka for that function
function ptr(base, offsets, accessor=dword)
{
    val = base
    
    for i in range(0, length(offsets) - 1)
    {
        addr = val + offsets[i]
        if (i == length(offsets) - 1)
        {
            val = accessor(addr)
        }
        else
        {
            val = dword(addr)
        }
    }
    
    return val
}

// ============= DEFINES ==================
GAMEMODE_STORY = 0x00
GAMEMODE_CHALLENGE = 0x01
GAMEMODE_MENU = 0x02
GAMEMODE_FIGHT = 0x03
GAMEMODE_RACE = 0x04
GAMEMODE_TARGET = 0x05
GAMEMODE_BOUNCE = 0x06
GAMEMODE_CANNON = 0x07
GAMEMODE_TAG = 0x08


QUESTID_JUNGLE_CHASE_BIRDS = 0x3e
QUESTID_JUNGLE_WAKE_GUARDS = 0x40
QUESTID_JUNGLE_FIND_DAUGHTER = 0x47
QUESTID_JUNGLE_PRINCE_AND_PRINCESS = 0x48
QUESTID_JUNGLE_GET_RID_OF_PLANTS = 0x53
QUESTID_TAKE_PHOTO = 0x55
QUESTID_JUNGLE_HATCH_CHICKS = 0x63
QUESTID_JUNGLE_DELIVER_LUNCH = 0x65
QUESTID_JUNGLE_RETURN_BEES = 0x70
QUESTID_MOONHAVEN_LITTLE_UN_LEVERS = 0x97
QUESTID_MOONHAVEN_DYNAMO = 0xaa
QUESTID_ZOOTOPIA_STRENGTH_TEST = 0xb4
QUESTID_MOONHAVEN_FIVE_RED_BALLOONS = 0xde
QUESTID_MOONHAVEN_RESCUE_CHILDREN = 0xf6
QUESTID_MOONHAVEN_FEED_FIRE_AUTOMATON = 0xf7
QUESTID_MOONHAVEN_FIND_TOOLBOX = 0xf8
QUESTID_ZOOTOPIA_STEALTH_DUCKS = 0x10e
QUESTID_MOONHAVEN_FROZEN_PUMPS = 0x115
QUESTID_BALLOON_DELIVERY = 0x116
QUESTID_MOONHAVEN_RELIGHT_FIRE_AUTOMATON = 0x119
QUESTID_MOONHAVEN_ALIGN_AIR_HORNS = 0x13b
QUESTID_MOONHAVEN_ICE_MOTHS = 0x13c
QUESTID_JUNGLE_WIND = 0x23e

MOVEMENT_NORMAL = 0x01
MOVEMENT_FLIGHT = 0x09

AREAS = {
    // For TakePhoto Village challenge (1)
    "JUNGLE_ISLAND_WOOD_1": {
        "x": {0: -36.8, 1: 27.57},
        "y": {0: 8.1,   1: 10.3},
        "z": {0: -7.8,  1: 59.47},
    },
    // For TakePhoto Village challenge (2)
    "JUNGLE_ISLAND_WOOD_2": {
        "x": {0: 11.04, 1: 45.13},
        "y": {0: 0.94,  1: 7.0},
        "z": {0: -15.36,1: -10.67},
    },
    // For "JungleExpress"
    "JUNGLE_START": {
        "x": {0: -29.7, 1: -19.5},
        "y": {0: -5.1,  1: -4.0},
        "z": {0: -178.4,1: -164.41},
    },
    // For "JungleExpress"
    "JUNGLE_THRONE": {
        "x": {0:  27.47, 1:  49.6},
        "y": {0: -29.0,  1: -27.0},
        "z": {0:  -1.0,  1: 27.18},
    },
    // For "Water You Afraid Of?"
    "ZOO_COASTER_1": {
        "x": {0: -106.0, 1: -102.0},
        "y": {0: -112.0, 1: -110.0},
        "z": {0: -113.0, 1: -118.0},
    }
    "ZOO_COASTER_2": {
        "x": {0: -197.0, 1: -187.0},
        "y": {0: -89.0,  1: -99.0},
        "z": {0: -2.0,   1: 8.0},
    }
    "ZOO_COASTER_3": {
        "x": {0: -136.0, 1: -126.0},
        "y": {0: -83.0,  1: -73.0},
        "z": {0: -55.0,  1: -45.0},
    }
}

// ============= MEMORY ===================

function m_region_byte() => byte(0x101000) // 0x01 = EU, 0x02 = US

function m_disk_id_us() => byte(0x444FC0) // "SLUS_212.72" = US
function m_disk_id_eu() => byte(0x43E870) // "SLES_537.01" = EU

function m_race_handicap_enabled_us() => byte(0x4725C8)

function m_race_items_enabled_us() => byte(0x4725C9)

function m_race_computer_players_enabled_us() => byte(0x4725CA)

function m_race_lap_count_us() => dword(0x472AD8)

function m_game_state_root_us() => dword(0x47317C)
function m_game_state_root_eu() => dword(0x47BDE4)

function m_player_state_us() => dword(0x473224)
function m_player_state_eu() => dword(0x47BE8C)

function m_progression_state_us() => dword(0x4735B8)
function m_progression_state_eu() => dword(0x47C220)

function m_action_state_us() => dword(0x472C2C)
function m_action_state_eu() => dword(0x46B8B4)

function m_controller_manager_us() => dword(0x472C2C)
function m_controller_manager_eu() => dword(0x46B8B4)

// ============= MEMORY HELPER =============
EU = 1
US = 2
Regions = [EU, US]

function IsRegion(region)
{
    return m_region_byte() == region
}

MDiskID = {
    US: m_disk_id_us(),
    EU: m_disk_id_eu(),
}

MGameState = {
    US: m_game_state_root_us(),
    EU: m_game_state_root_eu(),
}

MPlayerState = {
    US: m_player_state_us(),
    EU: m_player_state_eu(),
}

MProgressionState = {
    US: m_progression_state_us(),
    EU: m_progression_state_eu(),
}

MActionState = {
    US: ptr(m_action_state_us(), [0x24]),
    EU: ptr(m_action_state_eu(), [0x24]),
}

MController = {
    US: m_controller_manager_us(),
    EU: m_controller_manager_eu(),
}
// ============= GAME_DATA =================

Controller = {
    US: {
        "Player1": {
            "L2": ptr(MController[US], [0x04, 0x08, 0x560], bit0),
            "R2": ptr(MController[US], [0x04, 0x08, 0x560], bit1),
            "L1": ptr(MController[US], [0x04, 0x08, 0x560], bit2),
            "R1": ptr(MController[US], [0x04, 0x08, 0x560], bit3),
            "Triangle": ptr(MController[US], [0x04, 0x08, 0x560], bit4),
            "Circle": ptr(MController[US], [0x04, 0x08, 0x560], bit5),
            "X": ptr(MController[US], [0x04, 0x08, 0x560], bit6),
            "Square": ptr(MController[US], [0x04, 0x08, 0x560], bit7),
            "Select": ptr(MController[US], [0x04, 0x08, 0x561], bit0),
            "L3": ptr(MController[US], [0x04, 0x08, 0x561], bit1),
            "R3": ptr(MController[US], [0x04, 0x08, 0x561], bit2),
            "Start": ptr(MController[US], [0x04, 0x08, 0x561], bit3),
            "Up": ptr(MController[US], [0x04, 0x08, 0x561], bit4),
            "Right": ptr(MController[US], [0x04, 0x08, 0x561], bit5),
            "Down": ptr(MController[US], [0x04, 0x08, 0x561], bit6),
            "Left": ptr(MController[US], [0x04, 0x08, 0x561], bit7),
            "JoyRightX": ptr(MController[US], [0x04, 0x08, 0x57C], byte),
            "JoyRightY": ptr(MController[US], [0x04, 0x08, 0x57D], byte),
            "JoyLeftX": ptr(MController[US], [0x04, 0x08, 0x57E], byte),
            "JoyLeftY": ptr(MController[US], [0x04, 0x08, 0x57F], byte),
        },
    },
    EU: {
        "Player1": {
            "L2": ptr(MController[EU], [0x04, 0x08, 0x560], bit0),
            "R2": ptr(MController[EU], [0x04, 0x08, 0x560], bit1),
            "L1": ptr(MController[EU], [0x04, 0x08, 0x560], bit2),
            "R1": ptr(MController[EU], [0x04, 0x08, 0x560], bit3),
            "Triangle": ptr(MController[EU], [0x04, 0x08, 0x560], bit4),
            "Circle": ptr(MController[EU], [0x04, 0x08, 0x560], bit5),
            "X": ptr(MController[EU], [0x04, 0x08, 0x560], bit6),
            "Square": ptr(MController[EU], [0x04, 0x08, 0x560], bit7),
            "Select": ptr(MController[EU], [0x04, 0x08, 0x561], bit0),
            "L3": ptr(MController[EU], [0x04, 0x08, 0x561], bit1),
            "R3": ptr(MController[EU], [0x04, 0x08, 0x561], bit2),
            "Start": ptr(MController[EU], [0x04, 0x08, 0x561], bit3),
            "Up": ptr(MController[EU], [0x04, 0x08, 0x561], bit4),
            "Right": ptr(MController[EU], [0x04, 0x08, 0x561], bit5),
            "Down": ptr(MController[EU], [0x04, 0x08, 0x561], bit6),
            "Left": ptr(MController[EU], [0x04, 0x08, 0x561], bit7),
            "JoyRightX": ptr(MController[EU], [0x04, 0x08, 0x57C], byte),
            "JoyRightY": ptr(MController[EU], [0x04, 0x08, 0x57D], byte),
            "JoyLeftX": ptr(MController[EU], [0x04, 0x08, 0x57E], byte),
            "JoyLeftY": ptr(MController[EU], [0x04, 0x08, 0x57F], byte),
        },
    },
}

ProgressionFlags = {
    US: {
        "Active": {
            "WorldIndex": ptr(MProgressionState[US], [0x26F0]),
            "TaskActive": ptr(MProgressionState[US], [0x26F4]),
            "NpcDialogueID": ptr(MProgressionState[US], [0x2930]),
            "BananaCount": ptr(MProgressionState[US], [0x270C]),
            "Boxingball": ptr(MProgressionState[US], [0x27E8]),
            "Tetherball": ptr(MProgressionState[US], [0x27E0]),
            "Scalarball": ptr(MProgressionState[US], [0x27C8]),
            "Invisiball": ptr(MProgressionState[US], [0x27CC]),
            "Stickyball": ptr(MProgressionState[US], [0x27D0]),
            "Woodball": ptr(MProgressionState[US], [0x27D8]),
            "Speedyball": ptr(MProgressionState[US], [0x27E4]),
            "Hoverball": ptr(MProgressionState[US], [0x27DC]),
        },
        "ChantUnlocks": {
            "Boxingball": ptr(MProgressionState[US], [0x266C]),
            "Tetherball": ptr(MProgressionState[US], [0x2670]),
            "Scalarball": ptr(MProgressionState[US], [0x26B8]),
            "Invisiball": ptr(MProgressionState[US], [0x26BC]),
            "Stickyball": ptr(MProgressionState[US], [0x26C0]),
            "Fire": ptr(MProgressionState[US], [0x26C8]),
            "Woodball": ptr(MProgressionState[US], [0x26CC]),
            "Speedyball": ptr(MProgressionState[US], [0x26D0]),
            "Hoverball": ptr(MProgressionState[US], [0x26D4]),
            "Teleport_JungleIsland": ptr(MProgressionState[US], [0x2804]),
            "Teleport_Zootopia": ptr(MProgressionState[US], [0x2810]),
            "Teleport_Moonhaven": ptr(MProgressionState[US], [0x2808]),
            "Teleport_Monkitropolis": ptr(MProgressionState[US], [0x280C]),
        },
        "Purchases": {
            "FutureAiAi": ptr(MProgressionState[US], [0x29A8]),
            "PriceAbeAbe": ptr(MProgressionState[US], [0x29AC]),
            "AleWat": ptr(MProgressionState[US], [0x29B0]),
            "Simian": ptr(MProgressionState[US], [0x29B4]),
            "ChChi": ptr(MProgressionState[US], [0x29B8]),
            "PrincessDeeDee": ptr(MProgressionState[US], [0x29BC]),
            "QueenJenjen": ptr(MProgressionState[US], [0x29C0]),
            "JeckJeck": ptr(MProgressionState[US], [0x29C4]),
            "MadKee": ptr(MProgressionState[US], [0x29C8]),
            "Mermer": ptr(MProgressionState[US], [0x29D0]),
            "PaiPai": ptr(MProgressionState[US], [0x29D4]),
            "Papa": ptr(MProgressionState[US], [0x29D8]),
            "PodPow": ptr(MProgressionState[US], [0x29DC]),
            "Sisi": ptr(MProgressionState[US], [0x29E0]),
            "Sumsum": ptr(MProgressionState[US], [0x29E4]),
            "Toktok": ptr(MProgressionState[US], [0x29E8]),
            "MeeNee": ptr(MProgressionState[US], [0x29CC]),
            "Bounce2": ptr(MProgressionState[US], [0x2A40]),
            "Bounce3": ptr(MProgressionState[US], [0x2A44]),
            "Bounce4": ptr(MProgressionState[US], [0x2A48]),
            "Race2": ptr(MProgressionState[US], [0x2A4C]),
            "Race3": ptr(MProgressionState[US], [0x2A50]),
            "Race4": ptr(MProgressionState[US], [0x2A54]),
            "Fight2": ptr(MProgressionState[US], [0x2A58]),
            "Fight3": ptr(MProgressionState[US], [0x2A5C]),
            "Fight4": ptr(MProgressionState[US], [0x2A60]),
            "Target2": ptr(MProgressionState[US], [0x2A64]),
            "Target3": ptr(MProgressionState[US], [0x2A68]),
            "Target4": ptr(MProgressionState[US], [0x2A6C]),
            "Tag2": ptr(MProgressionState[US], [0x2A70]),
            "Cannon2": ptr(MProgressionState[US], [0x2A74]),
        },
        "JungleIsland": {
            "Joy60": ptr(MProgressionState[US], [0x2840]),
            "Joy100": ptr(MProgressionState[US], [0x288C]),
            "Bananas": ptr(MProgressionState[US], [0x2A1C]),
            "MakmakDonation": ptr(MProgressionState[US], [0x273C]),
            "FindDaughter": ptr(MProgressionState[US], [0x26A0]),
            "GetRidOfPlants": ptr(MProgressionState[US], [0x26A4]),
            "ChaseAwayBirds": ptr(MProgressionState[US], [0x26A8]),
            "RingTheBells": ptr(MProgressionState[US], [0x26D8]),
            "WakeTheGuards": ptr(MProgressionState[US], [0x26DC]),
            "HatchChicks": ptr(MProgressionState[US], [0x26E0]),
            "RelightLighthouse": ptr(MProgressionState[US], [0x26E4]),
            "Photo_Island": ptr(MProgressionState[US], [0x26E8]),
            "ReturnBees": ptr(MProgressionState[US], [0x26EC]),
            "DeliverLunch": ptr(MProgressionState[US], [0x2708]),
            "Photo_Village": ptr(MProgressionState[US], [0x2770]),
            "Photo_Palace": ptr(MProgressionState[US], [0x2774]),
            "IdentifyPrince": ptr(MProgressionState[US], [0x2854]),
            "DeliverMessage": ptr(MProgressionState[US], [0x28E8]),
            "WindPathToPalace": ptr(MProgressionState[US], [0x29F4]),
            "Naysayer_Palace": ptr(MProgressionState[US], [0x29F8]),
            "Naysayer_Island": ptr(MProgressionState[US], [0x29FC]),
        },
        "Zootopia": {
            "Joy60": ptr(MProgressionState[US], [0x2848]),
            "Joy100": ptr(MProgressionState[US], [0x2894]),
            "Bananas": ptr(MProgressionState[US], [0x2A20]),
            "MakmakDonation": ptr(MProgressionState[US], [0x2744]),
            "Visited": ptr(MProgressionState[US], [0x28FC]),
            "BumperCar": ptr(MProgressionState[US], [0x2790]),
            "CoasterOutOfControl": ptr(MProgressionState[US], [0x27A8]),
            "RemoteBallRace": ptr(MProgressionState[US], [0x27AC]),
            "StrengthTest": ptr(MProgressionState[US], [0x27B0]),
            "MagicShow": ptr(MProgressionState[US], [0x27B4]),
            "ParkCleanup": ptr(MProgressionState[US], [0x27BC]),
            "StealthAndDucks": ptr(MProgressionState[US], [0x27EC]),
            "ShutdownPuzzle": ptr(MProgressionState[US], [0x281C]),
            "RescueStudents": ptr(MProgressionState[US], [0x2820]),
            "FreeFatCatMascots": ptr(MProgressionState[US], [0x2828]),
            "Photo_Hedge": ptr(MProgressionState[US], [0x2834]),
            "Photo_Coaster": ptr(MProgressionState[US], [0x2864]),
            "DeliverMessage": ptr(MProgressionState[US], [0x2950]),
            "EightCatBalloons": ptr(MProgressionState[US], [0x2954]),
            "Naysayer_Hedge": ptr(MProgressionState[US], [0x2A08]),
            "Naysayer_FatCat": ptr(MProgressionState[US], [0x2A0C]),
            
        },
        "Moonhaven": {
            "Joy60": ptr(MProgressionState[US], [0x2844]),
            "Joy100": ptr(MProgressionState[US], [0x2890]),
            "Bananas": ptr(MProgressionState[US], [0x2A24]),
            "MakmakDonation": ptr(MProgressionState[US], [0x2740]),
            "Visited": ptr(MProgressionState[US], [0x28F4]),
            "OilGreatGears": ptr(MProgressionState[US], [0x2718]),
            "PickUpBananaSkins": ptr(MProgressionState[US], [0x271C]),
            "TimedSwitches": ptr(MProgressionState[US], [0x2720]),
            "KeepIceMothsAway": ptr(MProgressionState[US], [0x27B8]),
            "FindToolbox": ptr(MProgressionState[US], [0x27F0]),
            "FeedFireAutomaton": ptr(MProgressionState[US], [0x27F4]),
            "RelightFireAutomaton": ptr(MProgressionState[US], [0x27F8]),
            "FiveBalloons": ptr(MProgressionState[US], [0x27FC]),
            "RescueChildren": ptr(MProgressionState[US], [0x2800]),
            "AlignHorns": ptr(MProgressionState[US], [0x2814]),
            "FrozenPumps": ptr(MProgressionState[US], [0x2818]),
            "Levers": ptr(MProgressionState[US], [0x283C]),
            "Photo_Automaton": ptr(MProgressionState[US], [0x2858]),
            "PatchLeaks": ptr(MProgressionState[US], [0x2948]),
            "DeliverBalloon": ptr(MProgressionState[US], [0x2958]),
            "Naysayer_Arrival": ptr(MProgressionState[US], [0x2A80]),
            
        },
        "Monkitropolis": {
            "Joy60": ptr(MProgressionState[US], [0x284C]),
            "Joy100": ptr(MProgressionState[US], [0x2898]),
            "Bananas": ptr(MProgressionState[US], [0x2A28]),
            "MakmakDonation": ptr(MProgressionState[US], [0x2748]),
            "CaptureMonsters": ptr(MProgressionState[US], [0x2750]),
            "StopMetalMonkeys": ptr(MProgressionState[US], [0x278C]),
            "ShootRobochimps": ptr(MProgressionState[US], [0x2794]),
            "RealignLenses": ptr(MProgressionState[US], [0x27A0]),
            "DragCrabs": ptr(MProgressionState[US], [0x27A4]),
            "UnblockPipes": ptr(MProgressionState[US], [0x27C0]),
            "TurnTowers": ptr(MProgressionState[US], [0x27C4]),
            "WaterTrees": ptr(MProgressionState[US], [0x2824]),
            "RealignPipes": ptr(MProgressionState[US], [0x2830]),
            "RacewayChallenge": ptr(MProgressionState[US], [0x2838]),
            "Photo_Police": ptr(MProgressionState[US], [0x2870]),
            "StopRobochimpsCutting": ptr(MProgressionState[US], [0x290C]),
            "UnmaskMonsters": ptr(MProgressionState[US], [0x2920]),
            "PatchLeaks": ptr(MProgressionState[US], [0x2924]),
            "DeliverMessageRedMonkey": ptr(MProgressionState[US], [0x294C]),
            "DeliverMessageFactory": ptr(MProgressionState[US], [0x295C]),
            "Naysayer_Underwater": ptr(MProgressionState[US], [0x2A18]),
            "Photo_Kongrila": ptr(MProgressionState[US], [0x2A78]),
            "RacewayCleanup": ptr(MProgressionState[US], [0x2A7C]),
        },
        "Moonhaven_Zootopia": ptr(MProgressionState[US], [0x28E4]),
        "Joy100Total": ptr(MProgressionState[US], [0x2ACC]),
        "ChallengeUnlocks": ptr(MProgressionState[US], [0x2778]),
        "ZoneBananasBase": ptr(MProgressionState[US], [0x0804, 0x18]),
    },
    
    EU: {
        "Active": {
            "WorldIndex": ptr(MProgressionState[EU], [0x26F0]),
            "TaskActive": ptr(MProgressionState[EU], [0x26F4]),
            "NpcDialogueID": ptr(MProgressionState[EU], [0x2930]),
            "BananaCount": ptr(MProgressionState[EU], [0x270C]),
            "Boxingball": ptr(MProgressionState[EU], [0x27E8]),
            "Tetherball": ptr(MProgressionState[EU], [0x27E0]),
            "Scalarball": ptr(MProgressionState[EU], [0x27C8]),
            "Invisiball": ptr(MProgressionState[EU], [0x27CC]),
            "Stickyball": ptr(MProgressionState[EU], [0x27D0]),
            "Woodball": ptr(MProgressionState[EU], [0x27D8]),
            "Speedyball": ptr(MProgressionState[EU], [0x27E4]),
            "Hoverball": ptr(MProgressionState[EU], [0x27DC]),
        },
        "ChantUnlocks": {
            "Boxingball": ptr(MProgressionState[EU], [0x266C]),
            "Tetherball": ptr(MProgressionState[EU], [0x2670]),
            "Scalarball": ptr(MProgressionState[EU], [0x26B8]),
            "Invisiball": ptr(MProgressionState[EU], [0x26BC]),
            "Stickyball": ptr(MProgressionState[EU], [0x26C0]),
            "Fire": ptr(MProgressionState[EU], [0x26C8]),
            "Woodball": ptr(MProgressionState[EU], [0x26CC]),
            "Speedyball": ptr(MProgressionState[EU], [0x26D0]),
            "Hoverball": ptr(MProgressionState[EU], [0x26D4]),
            "Teleport_JungleIsland": ptr(MProgressionState[EU], [0x2804]),
            "Teleport_Zootopia": ptr(MProgressionState[EU], [0x2810]),
            "Teleport_Moonhaven": ptr(MProgressionState[EU], [0x2808]),
            "Teleport_Monkitropolis": ptr(MProgressionState[EU], [0x280C]),
        },
        "Purchases": {
            "FutureAiAi": ptr(MProgressionState[EU], [0x29A8]),
            "PriceAbeAbe": ptr(MProgressionState[EU], [0x29AC]),
            "AleWat": ptr(MProgressionState[EU], [0x29B0]),
            "Simian": ptr(MProgressionState[EU], [0x29B4]),
            "ChChi": ptr(MProgressionState[EU], [0x29B8]),
            "PrincessDeeDee": ptr(MProgressionState[EU], [0x29BC]),
            "QueenJenjen": ptr(MProgressionState[EU], [0x29C0]),
            "JeckJeck": ptr(MProgressionState[EU], [0x29C4]),
            "MadKee": ptr(MProgressionState[EU], [0x29C8]),
            "Mermer": ptr(MProgressionState[EU], [0x29D0]),
            "PaiPai": ptr(MProgressionState[EU], [0x29D4]),
            "Papa": ptr(MProgressionState[EU], [0x29D8]),
            "PodPow": ptr(MProgressionState[EU], [0x29DC]),
            "Sisi": ptr(MProgressionState[EU], [0x29E0]),
            "Sumsum": ptr(MProgressionState[EU], [0x29E4]),
            "Toktok": ptr(MProgressionState[EU], [0x29E8]),
            "MeeNee": ptr(MProgressionState[EU], [0x29CC]),
            "Bounce2": ptr(MProgressionState[EU], [0x2A40]),
            "Bounce3": ptr(MProgressionState[EU], [0x2A44]),
            "Bounce4": ptr(MProgressionState[EU], [0x2A48]),
            "Race2": ptr(MProgressionState[EU], [0x2A4C]),
            "Race3": ptr(MProgressionState[EU], [0x2A50]),
            "Race4": ptr(MProgressionState[EU], [0x2A54]),
            "Fight2": ptr(MProgressionState[EU], [0x2A58]),
            "Fight3": ptr(MProgressionState[EU], [0x2A5C]),
            "Fight4": ptr(MProgressionState[EU], [0x2A60]),
            "Target2": ptr(MProgressionState[EU], [0x2A64]),
            "Target3": ptr(MProgressionState[EU], [0x2A68]),
            "Target4": ptr(MProgressionState[EU], [0x2A6C]),
            "Tag2": ptr(MProgressionState[EU], [0x2A70]),
            "Cannon2": ptr(MProgressionState[EU], [0x2A74]),
        },
        "JungleIsland": {
            "Joy60": ptr(MProgressionState[EU], [0x2840]),
            "Joy100": ptr(MProgressionState[EU], [0x288C]),
            "Bananas": ptr(MProgressionState[EU], [0x2A1C]),
            "MakmakDonation": ptr(MProgressionState[EU], [0x273C]),
            "FindDaughter": ptr(MProgressionState[EU], [0x26A0]),
            "GetRidOfPlants": ptr(MProgressionState[EU], [0x26A4]),
            "ChaseAwayBirds": ptr(MProgressionState[EU], [0x26A8]),
            "RingTheBells": ptr(MProgressionState[EU], [0x26D8]),
            "WakeTheGuards": ptr(MProgressionState[EU], [0x26DC]),
            "HatchChicks": ptr(MProgressionState[EU], [0x26E0]),
            "RelightLighthouse": ptr(MProgressionState[EU], [0x26E4]),
            "Photo_Island": ptr(MProgressionState[EU], [0x26E8]),
            "ReturnBees": ptr(MProgressionState[EU], [0x26EC]),
            "DeliverLunch": ptr(MProgressionState[EU], [0x2708]),
            "Photo_Village": ptr(MProgressionState[EU], [0x2770]),
            "Photo_Palace": ptr(MProgressionState[EU], [0x2774]),
            "IdentifyPrince": ptr(MProgressionState[EU], [0x2854]),
            "DeliverMessage": ptr(MProgressionState[EU], [0x28E8]),
            "WindPathToPalace": ptr(MProgressionState[EU], [0x29F4]),
            "Naysayer_Palace": ptr(MProgressionState[EU], [0x29F8]),
            "Naysayer_Island": ptr(MProgressionState[EU], [0x29FC]),
        },
        "Zootopia": {
            "Joy60": ptr(MProgressionState[EU], [0x2848]),
            "Joy100": ptr(MProgressionState[EU], [0x2894]),
            "Bananas": ptr(MProgressionState[EU], [0x2A20]),
            "MakmakDonation": ptr(MProgressionState[EU], [0x2744]),
            "Visited": ptr(MProgressionState[EU], [0x28FC]),
            "BumperCar": ptr(MProgressionState[EU], [0x2790]),
            "CoasterOutOfControl": ptr(MProgressionState[EU], [0x27A8]),
            "RemoteBallRace": ptr(MProgressionState[EU], [0x27AC]),
            "StrengthTest": ptr(MProgressionState[EU], [0x27B0]),
            "MagicShow": ptr(MProgressionState[EU], [0x27B4]),
            "ParkCleanup": ptr(MProgressionState[EU], [0x27BC]),
            "StealthAndDucks": ptr(MProgressionState[EU], [0x27EC]),
            "ShutdownPuzzle": ptr(MProgressionState[EU], [0x281C]),
            "RescueStudents": ptr(MProgressionState[EU], [0x2820]),
            "FreeFatCatMascots": ptr(MProgressionState[EU], [0x2828]),
            "Photo_Hedge": ptr(MProgressionState[EU], [0x2834]),
            "Photo_Coaster": ptr(MProgressionState[EU], [0x2864]),
            "DeliverMessage": ptr(MProgressionState[EU], [0x2950]),
            "EightCatBalloons": ptr(MProgressionState[EU], [0x2954]),
            "Naysayer_Hedge": ptr(MProgressionState[EU], [0x2A08]),
            "Naysayer_FatCat": ptr(MProgressionState[EU], [0x2A0C]),
            
        },
        "Moonhaven": {
            "Joy60": ptr(MProgressionState[EU], [0x2844]),
            "Joy100": ptr(MProgressionState[EU], [0x2890]),
            "Bananas": ptr(MProgressionState[EU], [0x2A24]),
            "MakmakDonation": ptr(MProgressionState[EU], [0x2740]),
            "Visited": ptr(MProgressionState[EU], [0x28F4]),
            "OilGreatGears": ptr(MProgressionState[EU], [0x2718]),
            "PickUpBananaSkins": ptr(MProgressionState[EU], [0x271C]),
            "TimedSwitches": ptr(MProgressionState[EU], [0x2720]),
            "KeepIceMothsAway": ptr(MProgressionState[EU], [0x27B8]),
            "FindToolbox": ptr(MProgressionState[EU], [0x27F0]),
            "FeedFireAutomaton": ptr(MProgressionState[EU], [0x27F4]),
            "RelightFireAutomaton": ptr(MProgressionState[EU], [0x27F8]),
            "FiveBalloons": ptr(MProgressionState[EU], [0x27FC]),
            "RescueChildren": ptr(MProgressionState[EU], [0x2800]),
            "AlignHorns": ptr(MProgressionState[EU], [0x2814]),
            "FrozenPumps": ptr(MProgressionState[EU], [0x2818]),
            "Levers": ptr(MProgressionState[EU], [0x283C]),
            "Photo_Automaton": ptr(MProgressionState[EU], [0x2858]),
            "PatchLeaks": ptr(MProgressionState[EU], [0x2948]),
            "DeliverBalloon": ptr(MProgressionState[EU], [0x2958]),
            "Naysayer_Arrival": ptr(MProgressionState[EU], [0x2A80]),
            
        },
        "Monkitropolis": {
            "Joy60": ptr(MProgressionState[EU], [0x284C]),
            "Joy100": ptr(MProgressionState[EU], [0x2898]),
            "Bananas": ptr(MProgressionState[EU], [0x2A28]),
            "MakmakDonation": ptr(MProgressionState[EU], [0x2748]),
            "CaptureMonsters": ptr(MProgressionState[EU], [0x2750]),
            "StopMetalMonkeys": ptr(MProgressionState[EU], [0x278C]),
            "ShootRobochimps": ptr(MProgressionState[EU], [0x2794]),
            "RealignLenses": ptr(MProgressionState[EU], [0x27A0]),
            "DragCrabs": ptr(MProgressionState[EU], [0x27A4]),
            "UnblockPipes": ptr(MProgressionState[EU], [0x27C0]),
            "TurnTowers": ptr(MProgressionState[EU], [0x27C4]),
            "WaterTrees": ptr(MProgressionState[EU], [0x2824]),
            "RealignPipes": ptr(MProgressionState[EU], [0x2830]),
            "RacewayChallenge": ptr(MProgressionState[EU], [0x2838]),
            "Photo_Police": ptr(MProgressionState[EU], [0x2870]),
            "StopRobochimpsCutting": ptr(MProgressionState[EU], [0x290C]),
            "UnmaskMonsters": ptr(MProgressionState[EU], [0x2920]),
            "PatchLeaks": ptr(MProgressionState[EU], [0x2924]),
            "DeliverMessageRedMonkey": ptr(MProgressionState[EU], [0x294C]),
            "DeliverMessageFactory": ptr(MProgressionState[EU], [0x295C]),
            "Naysayer_Underwater": ptr(MProgressionState[EU], [0x2A18]),
            "Photo_Kongrila": ptr(MProgressionState[EU], [0x2A78]),
            "RacewayCleanup": ptr(MProgressionState[EU], [0x2A7C]),
        },
        "Moonhaven_Zootopia": ptr(MProgressionState[EU], [0x28E4]),
        "Joy100Total": ptr(MProgressionState[EU], [0x2ACC]),
        "ChallengeUnlocks": ptr(MProgressionState[EU], [0x2778]),
        "ZoneBananasBase": ptr(MProgressionState[EU], [0x0804, 0x18]),
    },
}


GameState = {
    US: {
        "GameMode": ptr(MGameState[US], [0xC0, 0x434]),
        "Player1": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x464]),
        }
    },
    EU: {
        "GameMode": ptr(MGameState[EU], [0xC0, 0x434]),
        "Player1": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x464]),
        }
    },
}

PlayerState = {
    US: {
        "Valid": ptr(MPlayerState[US], [0xC0, 0x4AC]),
        "LevelName": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x04], mirror),
        "LevelName3": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x08], mirror),
        "LevelName5": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x10], mirror),
        "LevelName6": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x14], mirror),
        "LevelNameLength": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x13C]),
        "ActiveQuestPtr": ptr(MPlayerState[US], [0xC0, 0x1C0C]),
        "ActiveQuest": ptr(MPlayerState[US], [0xC0, 0x1C0C, 0x04]),
        "PunchActive": ptr(MPlayerState[US], [0xC0, 0x4AC, 0xEB4]),
        "FlightActive": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x194]),
        "InvisiballTimer": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x484], float),
        "Ball": {
            "pos": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08]),
            "x": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08, 0x40], float),
            "y": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08, 0x44], float),
            "z": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08, 0x48], float),
        }
    },
    EU: {
        "Valid": ptr(MPlayerState[EU], [0xC0, 0x4AC]),
        "LevelName": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x04], mirror),
        "LevelName3": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x08], mirror),
        "LevelName5": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x10], mirror),
        "LevelName6": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x14], mirror),
        "LevelNameLength": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x13C]),
        "ActiveQuestPtr": ptr(MPlayerState[EU], [0xC0, 0x1C0C]),
        "ActiveQuest": ptr(MPlayerState[EU], [0xC0, 0x1C0C, 0x04]),
        "PunchActive": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0xEB4]),
        "FlightActive": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x194]),
        "InvisiballTimer": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x484], float),
        "Ball": {
            "pos": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08]),
            "x": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08, 0x40], float),
            "y": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08, 0x44], float),
            "z": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08, 0x48], float),
        }
    },
}

// ============= LOGIC =====================

function in_puzzle(region) {
    // "puzzle"
    return ascii_string_equals(PlayerState[region]["LevelName3"], "uzzl")
}

function InWorld(region, world) {
    return ascii_string_equals(PlayerState[region]["LevelName3"], world)
}

function InZone(region, zone) {
    return ascii_string_equals(PlayerState[region]["LevelName5"], zone)
}

function PauseWrongRegion(region) {
    return unless(!IsRegion(region))
}

function InGame(region) {
    return PlayerState[region]["Valid"] != 0x00000000
}
function InMenu(region) => GameState[region]["GameMode"] == GAMEMODE_MENU
function InMode(region, mode) => GameState[region]["GameMode"] == mode

function InQuest(region, questID) {
    return ProgressionFlags[region]["Active"]["TaskActive"] == 0x01 &&
           PlayerState[region]["ActiveQuest"] == questID
}

function QuestActive(region) {
    return ProgressionFlags[region]["Active"]["TaskActive"] == 0x01
}

function QuestActiveStable(region) {
    return prev(ProgressionFlags[region]["Active"]["TaskActive"]) == ProgressionFlags[region]["Active"]["TaskActive"]
}

function QuestStartedInZoneCheckpoint(region, zone, questID) {
    return once(ascii_string_equals(PlayerState[region]["LevelName5"], zone) &&
           PlayerState[region]["ActiveQuest"] == questID && 
           prev(ProgressionFlags[region]["Active"]["TaskActive"] == 0x00) &&
           ProgressionFlags[region]["Active"]["TaskActive"] == 0x01)
}

function QuestStartedCheckpoint(region, questID) {
    return (PlayerState[region]["ActiveQuest"] == questID && 
           once(prev(ProgressionFlags[region]["Active"]["TaskActive"] == 0x00) &&
           ProgressionFlags[region]["Active"]["TaskActive"] == 0x01))
}


function QuestCompleted(region, world, quest) {
    return prev(ProgressionFlags[region][world][quest] == 0x00) && ProgressionFlags[region][world][quest] == 0x01
}

function NotInQuestReset(region) {
    return never(QuestActiveStable(region) && !QuestActive(region))
}

function QuestCountJungle(region) {
    return  (ProgressionFlags[region]["JungleIsland"]["MakmakDonation"]) +
            (ProgressionFlags[region]["JungleIsland"]["FindDaughter"]) +
            (ProgressionFlags[region]["JungleIsland"]["GetRidOfPlants"]) +
            (ProgressionFlags[region]["JungleIsland"]["ChaseAwayBirds"]) +
            (ProgressionFlags[region]["JungleIsland"]["WakeTheGuards"]) +
            (ProgressionFlags[region]["JungleIsland"]["HatchChicks"]) +
            (ProgressionFlags[region]["JungleIsland"]["RelightLighthouse"]) +
            (ProgressionFlags[region]["JungleIsland"]["Photo_Island"]) +
            (ProgressionFlags[region]["JungleIsland"]["ReturnBees"]) +
            (ProgressionFlags[region]["JungleIsland"]["DeliverLunch"]) +
            (ProgressionFlags[region]["JungleIsland"]["Photo_Village"]) +
            (ProgressionFlags[region]["JungleIsland"]["Photo_Palace"]) +
            (ProgressionFlags[region]["JungleIsland"]["DeliverMessage"]) +
            (ProgressionFlags[region]["JungleIsland"]["WindPathToPalace"])
}

function IsChantActive(region, chant) {
    return ProgressionFlags[region]["Active"][chant] == 0x01
}

function Punched(region) {
    return ProgressionFlags[region]["Active"]["Boxingball"] == 0x01 &&
           prev(Controller[region]["Player1"]["X"] == 0x00) &&
           Controller[region]["Player1"]["X"] == 0x01
}

function CountPunches(region, amount) {
    return tally(16, Punched(region))
}

function InFlightMode(region) {
    return PlayerState[region]["FlightActive"] == MOVEMENT_FLIGHT
}

function LeftFlightMode(region) {
    return prev(PlayerState[region]["FlightActive"] == MOVEMENT_FLIGHT) && PlayerState[region]["FlightActive"] != MOVEMENT_FLIGHT
}

function IsRevealedInvisiball(region) {
    return PlayerState[region]["InvisiballTimer"] > 0.0
}

CurrentPositionPtr = {
    US: remembered(PlayerState[US]["Ball"]["pos"]),
    EU: remembered(PlayerState[EU]["Ball"]["pos"]),
}
OffX = 0x40
OffY = 0x44
OffZ = 0x48

function IsInHorizontalArea(region, area) {
    return ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0] && 
           ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1] &&
           ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0] && 
           ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1]
}
function EnteredHorizontalArea(region, area) {
    return (
        prev(ptr(CurrentPositionPtr[region], [OffX], float) < AREAS[area]["x"][0]) || 
        prev(ptr(CurrentPositionPtr[region], [OffX], float) > AREAS[area]["x"][1]) ||
        prev(ptr(CurrentPositionPtr[region], [OffZ], float) < AREAS[area]["z"][0]) ||
        prev(ptr(CurrentPositionPtr[region], [OffZ], float) > AREAS[area]["z"][1])
    ) &&    
    ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0] && 
    ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1] &&
    ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0] && 
    ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1]
}

function IsInHorizontalAreaWithZone(region, area, zone) {
    return InZone(region, zone) &&
           ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0] && 
           ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1] &&
           ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0] && 
           ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1]
}

function EnteredHorizontalAreaWithZone(region, area, zone) {
    return (
        prev(!InZone(region, zone)) ||
        prev(ptr(CurrentPositionPtr[region], [OffX], float)) < AREAS[area]["x"][0] ||
        prev(ptr(CurrentPositionPtr[region], [OffX], float)) > AREAS[area]["x"][1] ||
        prev(ptr(CurrentPositionPtr[region], [OffZ], float)) < AREAS[area]["z"][0] ||
        prev(ptr(CurrentPositionPtr[region], [OffZ], float)) > AREAS[area]["z"][1]
    ) &&
    InZone(region, zone) &&
    ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0] && 
    ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1] &&
    ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0] && 
    ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1]
}

function IsInArea(region, area) {
    return ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0] && 
           ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1] &&
           ptr(CurrentPositionPtr[region], [OffY], float) >= AREAS[area]["y"][0] && 
           ptr(CurrentPositionPtr[region], [OffY], float) <= AREAS[area]["y"][1] &&
           ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0] && 
           ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1]
}

function EnteredArea(region, area) {
    return (
        prev(ptr(CurrentPositionPtr[region], [OffX], float) < AREAS[area]["x"][0]) || 
        prev(ptr(CurrentPositionPtr[region], [OffX], float) > AREAS[area]["x"][1]) ||
        prev(ptr(CurrentPositionPtr[region], [OffY], float) < AREAS[area]["y"][0]) || 
        prev(ptr(CurrentPositionPtr[region], [OffY], float) > AREAS[area]["y"][1]) ||
        prev(ptr(CurrentPositionPtr[region], [OffZ], float) < AREAS[area]["z"][0]) || 
        prev(ptr(CurrentPositionPtr[region], [OffZ], float) > AREAS[area]["z"][1])
    ) &&
    ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0] && 
    ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1] &&
    ptr(CurrentPositionPtr[region], [OffY], float) >= AREAS[area]["y"][0] && 
    ptr(CurrentPositionPtr[region], [OffY], float) <= AREAS[area]["y"][1] &&
    ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0] && 
    ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1]
}

// ============= ACHIEVEMENTS ==============

achievement(
    title = "Welcome to the Jungle", points = 2, type="progression",
    description = "Complete your first story quest. This game uses autosave which will block you out of some missables. It is recommended to disable autosave.",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                prev(QuestCountJungle(region)) == 0 && 
                QuestCountJungle(region) == 1
              ))
)

achievement(
    title = "Loading Screens? No Thanks!", points = 1, type="progression",
    description = "Complete the story quest \"Path to Palace\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "WindPathToPalace")
              ))
)

achievement(
    title = "Sixty Shades of Joy", points = 10, type="progression",
    description = "Reach 60 Joy in Jungle Island and unlock \"Find the Prince and Princess\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "Joy60")
              ))
)

achievement(
    title = "Royal Reunion", points = 2, type="progression",
    description = "Complete \"Find the Prince and Princess\" and unlock Zootopia and Moonhaven",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "IdentifyPrince")
              ))
)

achievement(
    title = "Weed Whacker", points = 5, type="missable",
    description = "Complete \"Weeds in the wells\" without missing a single boxing punch",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_JUNGLE_GET_RID_OF_PLANTS) &&

                // Challenge failed condition
                never(CountPunches(region, 16)) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "JungleIsland", "GetRidOfPlants"))
              ))
)

achievement(
    title = "The Floor Is Lumber", points = 5, type="missable",
    description = "Complete \"Picture at the hives\" without touching wooden ground for more than 1 second",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedInZoneCheckpoint(region, "vill", QUESTID_TAKE_PHOTO) &&

                // Challenge failed condition
                never(tally(60, 
                    IsInArea(region, "JUNGLE_ISLAND_WOOD_1"), 
                    IsInArea(region, "JUNGLE_ISLAND_WOOD_2"))) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "JungleIsland", "Photo_Village"))
              ))
)

achievement(
    title = "You Snooze, You Lose", points = 10, type="missable",
    description = "Complete \"Wake the Guards\" in 0'40\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_JUNGLE_WAKE_GUARDS) &&

                // Challenge failed condition
                never(tally(2400, always_true())) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "JungleIsland", "WakeTheGuards"))
              ))
)


achievement(
    title = "Eggcellent Flight", points = 5, type="missable",
    description = "Complete \"Floating Eggs\" while delivering all eggs in one go without ever touching the ground after shooting off the cannon",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_JUNGLE_HATCH_CHICKS) &&

                // Challenge failed condition
                never(LeftFlightMode(region)) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "JungleIsland", "HatchChicks"))
              ))
)

achievement(
    title = "Jungle Express", points = 10, type="",
    description = "In Jungle Island, go from the starting position to the throne room in less than 2'00\"00 without using chants or flying",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // Checkpoint logic when entered the starting area
                once(IsInHorizontalAreaWithZone(region, "JUNGLE_START", "vill")) &&

                // Challenge failed conditions
                (
                    never(repeated(7200,
                        always_true() &&
                        never(IsInHorizontalAreaWithZone(region, "JUNGLE_START", "vill"))
                    )) &&
                    never(IsChantActive(region, "Speedyball")) &&
                    once(always_true())
                ) &&
                // Challenge failed conditions
                //(
                //    // WARNING: The first never should be a ResetNextIf, but RAScript generates a ResetIf
                //    //          Has to be replaced manually (BOTH ALTS!)
                //    never(IsInHorizontalAreaWithZone(region, "JUNGLE_START", "vill")) &&
                //    never(tally(7200, always_true())) &&
                //    never(IsChantActive(region, "Speedyball"))
                //) &&
                
                // Actual trigger
                trigger_when(EnteredHorizontalAreaWithZone(region, "JUNGLE_THRONE", "pali"))
              ))
)

achievement(
    title = "Welcome to the Wild Side", points = 1, type="progression",
    description = "Arrive at Zootopia for the first time",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Zootopia", "Visited")
              ))
)

achievement(
    title = "Powering Up", points = 10, type="progression",
    description = "Reach 60 Joy in Zootopia and unlock \"Shutdown Puzzle\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Zootopia", "Joy60")
              ))
)

achievement(
    title = "Monkey in the Machine", points = 2, type="progression",
    description = "Complete \"Shutdown Puzzle\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Zootopia", "ShutdownPuzzle")
              ))
)

achievement(
    title = "Quack Ops", points = 10, type="missable",
    description = "Complete \"Stealth and Ducks\" without being detected a single time",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_ZOOTOPIA_STEALTH_DUCKS) &&

                // Challenge failed condition
                never(IsRevealedInvisiball(region)) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Zootopia", "StealthAndDucks"))
              ))
)

achievement(
    title = "Stronger than Glue", points = 10, type="missable",
    description = "Complete \"Test of Strength\" without using the Stickyball",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_ZOOTOPIA_STRENGTH_TEST) &&

                // Challenge failed condition
                never(IsChantActive(region, "Stickyball")) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Zootopia", "StrengthTest"))
              ))
)

achievement(
    title = "Woodn't Need It", points = 5, type="missable",
    description = "Complete \"Picture below the coaster\" without using the Woodball",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedInZoneCheckpoint(region, "rc01", QUESTID_TAKE_PHOTO) &&

                // Challenge failed condition
                never(IsChantActive(region, "Woodball")) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Zootopia", "Photo_Coaster"))
              ))
)

// ============= LEADERBOARDS ==============


// ============= RICH_PRESENCE =============


AdventureLevelNameLookup = {
    "ls\\jungisle\\village": "Jungle Island - Village",
    "ls\\jungisle\\jipath": "Jungle Island - Path to Palace",
    "ls\\jungisle\\palext": "Jungle Island - Palace Exterior",
    "ls\\jungisle\\pallock": "Jungle Island - Palace Lock",
    "ls\\jungisle\\palint": "Jungle Island - Palace Interior",
    "ls\\jungisle\\chamber": "Jungle Island - Palace Exterior <-> Distant Islands",
    "ls\\jungisle\\beach": "Jungle Island - Distant Islands",
    "ls\\jungisle\\gateway": "Jungle Island - Village <-> Distant Islands",
    "ls\\jungisle\\jimount": "Jungle Island - Mountain Junction",
    "ls\\newhave\\arvlpark": "Moonhaven - Arrival Park",
    "ls\\newhave\\coglock": "Moonhaven - Arrival Park <-> Air Automaton",
    "ls\\newhave\\airauto": "Moonhaven - Air Automaton",
    "ls\\newhave\\tmbllock": "Moonhaven - Air Automaton <-> Undercity",
    "ls\\newhave\\undrcity": "Moonhaven - Undercity",
    "ls\\newhave\\liftlock": "Moonhaven - Undercity <-> Water Automaton",
    "ls\\newhave\\watrpark": "Moonhaven - Water Automaton",
    "ls\\newhave\\locklock": "Moonhaven - Arrival Park <-> Water Automaton",
    "ls\\zootopib\\mainst": "Zootopia - Main Street",
    "ls\\zootopib\\zt_link": "Zootopia - Main Street <-> Hedge Maze",
    "ls\\zootopib\\zt_maze": "Zootopia - Hedge Maze",
    "ls\\zootopib\\z_al1": "Zootopia - Main Street <-> Roller Coaster",
    "ls\\zootopib\\z_al2": "Zootopia - Roller Coaster <-> Fat Cat's Tower",
    "ls\\zootopib\\z_al3": "Zootopia - Hedge Maze <-> Fat Cat's Tower",
    "ls\\zootopib\\rc01": "Zootopia - Roller Coaster",
    "ls\\zootopib\\fatcat": "Zootopia - Fat Cat's Tower",
    "ls\\monktrop\\mk_pol": "Monkitropolis - Police Station",
    "ls\\monktrop\\mk_race": "Monkitropolis - Raceway",
    "ls\\monktrop\\link": "Monkitropolis - Police Station <-> Raceway",
    //"ls\\monktrop\\tlink1": "Monkitropolis - Throne Room <-> Kongri-la",
    //"ls\\monktrop\\tlink2": "Monkitropolis - Raceway <-> Throne Room",
    "ls\\monktrop\\tlink": "Monkitropolis - Palace Elevator",
    "ls\\monktrop\\throne": "Monkitropolis - Throne Room",
    "ls\\monktrop\\mk_kong": "Kongri-la - Atoll",
    //"ls\\monktrop\\mk_kong1": "Kongri-la - Underwater City",
    //"ls\\monktrop\\mk_kong2": "Kongri-la - Lower Tunnels",
    "ls\\monktrop\\mk_lift": "Kongri-la - Lift",
    "ls\\monktrop\\mk_dlink": "Kongri-la - Underwater Junction",
    "ls\\monktrop\\d_link2": "Kongri-la - Lower Tunnels <-> Throne Room",
}

AdventureLevelBananaCountLookup = {
    "ls\\jungisle\\village": "81",
    "ls\\jungisle\\jipath": "0",
    "ls\\jungisle\\palext": "94",
    "ls\\jungisle\\pallock": "0",
    "ls\\jungisle\\palint": "20",
    "ls\\jungisle\\chamber": "0",
    "ls\\jungisle\\beach": "62",
    "ls\\jungisle\\gateway": "0",
    "ls\\jungisle\\jimount": "0",
    "ls\\newhave\\arvlpark": "63",
    "ls\\newhave\\coglock": "0",
    "ls\\newhave\\airauto": "27",
    "ls\\newhave\\tmbllock": "0",
    "ls\\newhave\\undrcity": "63",
    "ls\\newhave\\liftlock": "0",
    "ls\\newhave\\watrpark": "47",
    "ls\\newhave\\locklock": "0",
    "ls\\zootopib\\mainst": "26",
    "ls\\zootopib\\zt_link": "0",
    "ls\\zootopib\\zt_maze": "46",
    "ls\\zootopib\\z_al1": "0",
    "ls\\zootopib\\z_al2": "0",
    "ls\\zootopib\\z_al3": "0",
    "ls\\zootopib\\rc01": "74",
    "ls\\zootopib\\fatcat": "78",
    "ls\\monktrop\\mk_pol": "75",
    "ls\\monktrop\\mk_race": "67",
    "ls\\monktrop\\link": "0",
    "ls\\monktrop\\tlink": "0",
    "ls\\monktrop\\throne": "0",
    "ls\\monktrop\\mk_kong": "60",
    //"ls\\monktrop\\mk_kong1": "43",
    //"ls\\monktrop\\mk_kong2": "42",
    "ls\\monktrop\\mk_link": "0",
    "ls\\monktrop\\mk_dlink": "0",
    "ls\\monktrop\\d_link2": "0",
}

PuzzleLevelNameLookup = {
    "ls\\puzzles\\p02_everdecreasing\\edc01": "p02_everdecreasing - edc01",
    "ls\\puzzles\\p08_ripple\\rb01": "Ripple",
    "ls\\puzzles\\p09_plughole\\dtp01": "Plughole",
    "ls\\puzzles\\p12_wells\\gw01": "Gravity Wells",
    "ls\\puzzles\\p13_cog\\cog01": "Cog",
    "ls\\puzzles\\p23_cascade\\casc01": "Cascade",
    "ls\\puzzles\\p24_zzstop\\zzs01": "ZZ Stop",
    "ls\\puzzles\\p25_jump\\jump01": "Jump",
    "ls\\puzzles\\p29_tiptoe\\tt01": "Tiptoe",
    "ls\\puzzles\\p31_squeegee\\sq02": "Squeegee",
    "ls\\puzzles\\p33_checkmate\\chk01": "Checkmate",
    "ls\\puzzles\\p35_breadbasket\\bb01": "Bread Basket",
    "ls\\puzzles\\p37_dimple\\dim01": "Dimple",
    "ls\\puzzles\\p39_overun\\vr01": "Overrun",
    "ls\\puzzles\\p40_bumps\\bnb01": "Bumps",
    "ls\\puzzles\\p41_simplesplit\\ss01": "Simple Split",
    "ls\\puzzles\\p43_smile\\grin01": "Smile",
    "ls\\puzzles\\p44_roundabout\\rab01": "p44_roundabout - rab01",
    "ls\\puzzles\\p48_ridgewalker\\rw01": "Ridge Walker",
    "ls\\puzzles\\p49_hairpins\\hir01": "Hairpins",
    "ls\\puzzles\\p51_serpent\\asp01": "Serpent",
    "ls\\puzzles\\p52_skidbiffers\\skid01": "Skid Slalom",
    "ls\\puzzles\\p53_electricbiffersofdoom\\ebd01": "Slider",
    "ls\\puzzles\\p57_spindle\\spin01": "p57_spindle - spin01",
    "ls\\puzzles\\p56_shuffle\\shfl01": "Shuffle",
    "ls\\puzzles\\p59_holes\\hole01": "Holes",
    "ls\\puzzles\\p10_whirlpool\\wp01": "p10_whirlpool - wp01",
    "ls\\puzzles\\p32_funnelrun\\fun01": "Funrun",
    "ls\\puzzles\\p36_overthehills\\oth01": "Over The Hills",
    "ls\\puzzles\\p55_spiralscratch\\sp01": "Spiral Scratch",
    "ls\\puzzles\\p62_sequencer\\seq01": "Sequencer",
    "ls\\puzzles\\p85_tonguetwister\\tw01": "Tongue Twister",
    "ls\\puzzles\\p84_captureflag\\cf01": "p84_captureflag - cf01",
    "ls\\puzzles\\p67_eternal\\et01": "Eternal",
    "ls\\puzzles\\p71_slalom\\sm01": "Slalom",
    "ls\\puzzles\\p14_elementary\\el01": "Elementary",
    "ls\\puzzles\\p47_hoopsnake\\hs01": "Hoopsnake",
    "ls\\puzzles\\p03_slipknot\\sk01": "Slipknot",
    "ls\\puzzles\\p11_drag\\dd01": "p11_drag - dd01",
    "ls\\puzzles\\p16_sega\\s01": "p16_sega - s01",
    "ls\\puzzles\\p81_sissi\\sis01": "p81_sissi - sis01",
    "ls\\puzzles\\p42_celticknots\\ck02": "Celtic Knots",
    "ls\\puzzles\\p82_whirlingdervishes\\wd01": "p82_whirlingdervishes - wd01",
    "ls\\puzzles\\p26_spinnera\\sa01": "p26_spinnera - sa01",
    "ls\\puzzles\\p07_frightrings\\fr01": "p07_frightrings - fr01",
    "ls\\puzzles\\p01_ringgoal\\rg01": "p01_ringgoal - rg01",
    "ls\\puzzles\\p77_jawbridge\\jb01": "Jawbridge",
    "ls\\puzzles\\p65_mesmerise\\mes01": "p65_mesmerise - mes01",
    "ls\\puzzles\\p107_stinkysteps\\stst01": "Stinkysteps",
    "ls\\puzzles\\pp12_backslider\\bu01": "Backslider",
    "ls\\puzzles\\p54_floorslider\\fs01": "Floor Sliders",
    "ls\\puzzles\\pp11_deadline\\uad01": "Deadline",
    "ls\\puzzles\\p112_gankanny\\htl01": "Gankanny",
    "ls\\puzzles\\p104_threebie\\thr01": "Headlong",
    "ls\\puzzles\\pp14_backflip\\bf01": "Backflip",
    "ls\\puzzles\\p58_crossroads\\cros01": "Crossroads",
    "ls\\puzzles\\p113_bowls\\b01": "Bowls",
    "ls\\puzzles\\p108_threewheel\\twh01": "Freewheeler",
    "ls\\puzzles\\p114_sidestep\\sst01": "Sidestep",
    "ls\\puzzles\\pp13_pitchnputt\\pnp01": "Pitch And Putt",
    "ls\\puzzles\\p105_threedom\\td01": "Circuits",
    "ls\\puzzles\\pp15_loopit\\lit01": "Loop It",
}

BounceLevelNameLookup = {
    "ls\\partygames\\bounce\\bounce": "Monkey Bounce",
}

FightLevelNameLookup = {
    "ls\\partygames\\boxing\\zootopia\\boxarena": "boxing - zootopia - boxarena",
    "ls\\partygames\\boxing\\jungleisland\\boxarena": "boxing - jungleisland - boxarena",
}

TargetLevelNameLookup = {
    "ls\\partygames\\glide\\glide3": "glide - glide3",
    "ls\\partygames\\glide\\glide2": "glide - glide2",
    "ls\\partygames\\glide\\glide_a": "glide - glide_A",
    "ls\\partygames\\glide\\glide1": "glide - glide1",
}

RaceLevelNameLookup = {
    "ls\\partygames\\race\\track_a": "race - track_a",
    "ls\\partygames\\race\\track_am": "race - track_am",
    "ls\\partygames\\race\\track_b": "race - track_b",
    "ls\\partygames\\race\\track_bm": "race - track_bm",
    "ls\\partygames\\race\\track_c": "race - track_c",
    "ls\\partygames\\race\\track_cm": "race - track_cm",
    "ls\\partygames\\race\\track_d": "race - track_d",
    "ls\\partygames\\race\\track_dm": "race - track_dm",
}

CannonLevelNameLookup = {
    "ls\\partygames\\castles\\castle": "castles - castle",
}

TagLevelNameLookup = {
    "ls\\partygames\\monkytag\\monktaga": "monkytag - monktaga",
    "ls\\partygames\\monkytag\\monktagb": "monkytag - monktagb",
}

RpAdventureLevel = {
    US: rich_presence_ascii_string_lookup("ADVENTURE_LEVEL", PlayerState[US]["LevelName"], AdventureLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("ADVENTURE_LEVEL", PlayerState[EU]["LevelName"], AdventureLevelNameLookup),
}
RpAdventureLevelBananaCount = {
    US: rich_presence_ascii_string_lookup("ADVENTURE_LEVEL_BANANA", PlayerState[US]["LevelName"], AdventureLevelBananaCountLookup),
    EU: rich_presence_ascii_string_lookup("ADVENTURE_LEVEL_BANANA", PlayerState[EU]["LevelName"], AdventureLevelBananaCountLookup),
}
RpPuzzleLevel = {
    US: rich_presence_ascii_string_lookup("PUZZLE_LEVEL", PlayerState[US]["LevelName"], PuzzleLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("PUZZLE_LEVEL", PlayerState[EU]["LevelName"], PuzzleLevelNameLookup),
}
RpBounceLevel = {
    US: rich_presence_ascii_string_lookup("BOUNCE_LEVEL", PlayerState[US]["LevelName"], BounceLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("BOUNCE_LEVEL", PlayerState[EU]["LevelName"], BounceLevelNameLookup),
}
RpFightLevel = {
    US: rich_presence_ascii_string_lookup("BOXING_LEVEL", PlayerState[US]["LevelName"], FightLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("BOXING_LEVEL", PlayerState[EU]["LevelName"], FightLevelNameLookup),
}
RpTargetLevel = {
    US: rich_presence_ascii_string_lookup("TARGET_LEVEL", PlayerState[US]["LevelName"], TargetLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("TARGET_LEVEL", PlayerState[EU]["LevelName"], TargetLevelNameLookup),
}
RpRaceLevel = {
    US: rich_presence_ascii_string_lookup("RACE_LEVEL", PlayerState[US]["LevelName"], RaceLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("RACE_LEVEL", PlayerState[EU]["LevelName"], RaceLevelNameLookup),
}
RpCannonLevel = {
    US: rich_presence_ascii_string_lookup("CANNON_LEVEL", PlayerState[US]["LevelName"], CannonLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("CANNON_LEVEL", PlayerState[EU]["LevelName"], CannonLevelNameLookup),
}
RpTagLevel = {
    US: rich_presence_ascii_string_lookup("TAG_LEVEL", PlayerState[US]["LevelName"], TagLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("TAG_LEVEL", PlayerState[EU]["LevelName"], TagLevelNameLookup),
}


/*
CountBananasBase = {
    US: remembered(ProgressionFlags[US]["ZoneBananasBase"]),
    EU: remembered(ProgressionFlags[EU]["ZoneBananasBase"]),
}

function CountBananas(region, world) {
    
    val = 0
    for single in Locations[location]["BananaSingle"]
    {
    
        temp = remembered(ptr(ProgressionFlags[region]["ZoneBananasBase"], [single["offset"]], mirror))
        val = val + bitcount(temp & single["mask"])
    }

    for bunch in Locations[location]["BananaBunch"]
    {
        val = val + (5 * bitcount((ptr(ProgressionFlags[region]["ZoneBananasBase"], [bunch["offset"]], mirror) & bunch["mask"])))
    }

    return val
}*/


rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_STORY) && in_puzzle(US),
    "[US] In Puzzle Level: {0}",
    RpPuzzleLevel[US]
)
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_BOUNCE),
    "[US] In Bounce Level: {0}",
    RpBounceLevel[US]
)
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_FIGHT),
    "[US] In Boxing Level: {0}",
    RpFightLevel[US]
)
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_TARGET),
    "[US] In Target Level: {0}",
    RpTargetLevel[US]
)
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_RACE),
    "[US] In Race Level: {0}",
    RpRaceLevel[US]
)
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_CANNON),
    "[US] In Cannon Level: {0}",
    RpCannonLevel[US]
)
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_TAG),
    "[US] In Tag Level: {0}",
    RpTagLevel[US]
)

// Display for Jungle Village
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_STORY) && InWorld(US, "ungi"),
    "[US] In Adventure Level: {0} | 🍌 {1}/600",
    RpAdventureLevel[US],
    rich_presence_value("BANANAS", ProgressionFlags[US]["JungleIsland"]["Bananas"])
)

// Display for Zootopia
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_STORY) && InWorld(US, "ooto"),
    "[US] In Adventure Level: {0} | 🍌 {1}/600",
    RpAdventureLevel[US],
    rich_presence_value("BANANAS", ProgressionFlags[US]["JungleIsland"]["Bananas"])
)

// Display for Moonhaven
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_STORY) && InWorld(US, "ewha"),
    "[US] In Adventure Level: {0} | 🍌 {1}/750",
    RpAdventureLevel[US],
    rich_presence_value("BANANAS", ProgressionFlags[US]["JungleIsland"]["Bananas"])
)

// Display for Monkitropolis
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_STORY) && InWorld(US, "onkt"),
    "[US] In Adventure Level: {0} | 🍌 {1}/600",
    RpAdventureLevel[US],
    rich_presence_value("BANANAS", ProgressionFlags[US]["JungleIsland"]["Bananas"])
)

// Default, use village as this should never happen
rich_presence_conditional_display(
    InGame(US) && InMode(US, GAMEMODE_STORY),
    "[US] In Adventure Level: {0} | 🍌 {1}/600",
    RpAdventureLevel[US],
    rich_presence_value("BANANAS", ProgressionFlags[US]["JungleIsland"]["Bananas"])
)

rich_presence_display("In title menu or a loading screen.")