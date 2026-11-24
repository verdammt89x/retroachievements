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
EU = 1
US = 2
Regions = [EU, US]
RegionFlags = {
    US: "US",
    EU: "EU"
}

PUZZLES = {
    "RIPPLE": "08_r",
    "PLUGHOLE": "09_p",
    "GRAVITY_WELLS": "12_w",
    "COG": "13_c",
    "CASCADE": "23_c",
    "ZZSTOP": "24_z",
    "JUMP": "25_j",
    "TIPTOE": "29_t",
    "SQUEEGEE": "31_s",
    "CHECKMATE": "33_c",
    "BREADBASKET": "35_b",
    "DIMPLE": "37_d",
    "OVERRUN": "39_o",
    "BUMPS": "40_b",
    "SIMPLESPLIT": "41_s",
    "SMILE": "p43_",
    "ROUNDABOUT": "44_r",
    "RIDGEWALKER": "48_r",
    "HAIRPINS": "49_h",
    "SERPENT": "51_s",
    "SKID_SLALOM" : "52_s",
    "SLIDER" : "53_e",
    "SPINDLE" : "57_s",
    "SHUFFLE" : "56_s",
    "HOLES" : "59_h",
    "WHIRLPOOL" : "10_w",
    "FUNRUN" : "32_f",
    "OVER_THE_HILLS" : "36_o",
    "SPIRAL_SCRATCH" : "55_s",
    "SEQUENCER" : "62_s",
    "TONGUE_TWISTER" : "85_t",
    "CAPTUREFLAG" : "84_c",
    "ETERNAL" : "67_e",
    "SLALOM" : "71_s",
    "ELEMENTARY" : "14_e",
    "HOOPSNAKE" : "47_h",
    "SLIPKNOT" : "03_s",
    "DRAG" : "11_d",
    "SEGA" : "16_s",
    "SISSI" : "81_s",
    "CELTIC_KNOTS" : "42_c",
    "WHIRLING_DERVISHES" : "82_w",
    "SPINNERA" : "26_s",
    "FRIGHTRINGS" : "07_f",
    "RINGGOAL" : "01_r",
    "JAWBRIDGE" : "77_j",
    "MESMERISE" : "65_m",
    "STINKYSTEPS" : "107_",
    "BACKSLIDER" : "p12_",
    "FLOOR_SLIDERS" : "54_f",
    "DEADLINE" : "p11_",
    "GANKANNY" : "112_",
    "HEADLONG" : "104_",
    "BACKFLIP" : "p14_",
    "CROSSROADS" : "58_c",
    "BOWLS" : "113_",
    "FREEWHEELER" : "108_",
    "SIDESTEP" : "114_",
    "PITCH_AND_PUTT" : "13_p",
    "CIRCUITS" : "105_",
    "LOOP_IT" : "p15_",
}


GAMEMODE_STORY = 0x00
GAMEMODE_CHALLENGE = 0x01
GAMEMODE_MENU = 0x02
GAMEMODE_FIGHT = 0x03
GAMEMODE_RACE = 0x04
GAMEMODE_TARGET = 0x05
GAMEMODE_BOUNCE = 0x06
GAMEMODE_CANNON = 0x07
GAMEMODE_TAG = 0x08

PAUSEMENU_MAIN = 0x0044DE20
PAUSEMENU_WORLD = 0x0044D790
PAUSEMENU_WORLD_PROGRESS = 0x0044CB70
PAUSEMENU_WORLD_MAP = 0x0044DDC8
PAUSEMENU_OPTIONS = 0x0044DA38
PAUSEMENU_OPTIONS_SOUND = 0x0044D378
PAUSEMENU_OPTIONS_CAMERA = 0x0044D3D0
PAUSEMENU_OPTIONS_GRAPHICS = 0x0044D490
PAUSEMENU_OPTIONS_VIBRATION = 0x0044D550
PAUSEMENU_GAME_DATA = 0x0044D738
PAUSEMENU_VIEW_CHANTS = 0x0044D7E8

QUESTID_JUNGLE_RELIGHT_LIGHTHOUSE = 0x23
QUESTID_JUNGLE_CHASE_BIRDS = 0x3e
QUESTID_JUNGLE_WAKE_GUARDS = 0x40
QUESTID_JUNGLE_RING_BELLS = 0x41
QUESTID_JUNGLE_FIND_DAUGHTER = 0x47
QUESTID_JUNGLE_PRINCE_AND_PRINCESS = 0x48
QUESTID_JUNGLE_GET_RID_OF_PLANTS = 0x53
QUESTID_TAKE_PHOTO = 0x55
QUESTID_JUNGLE_HATCH_CHICKS = 0x63
QUESTID_JUNGLE_DELIVER_LUNCH = 0x65
QUESTID_JUNGLE_RETURN_BEES = 0x70
QUESTID_MOONHAVEN_PICK_UP_BANANA_SKINS = 0x96
QUESTID_MOONHAVEN_LITTLE_UN_LEVERS = 0x97
QUESTID_MAKMAK_DONATION = 0x98
QUESTID_MONKITROPOLIS_CATCH_MONSTERS = 0x9b
QUESTID_MOONHAVEN_TIMED_SWITCHES = 0xaa
QUESTID_MOONHAVEN_OIL_GREAT_GEARS = 0xab
QUESTID_ZOOTOPIA_STRENGTH_TEST = 0xb4
QUESTID_KONGRILA_STOP_METAL_MONKEYS = 0xcf
QUESTID_ZOOTOPIA_BUMPER_CAR_ACTION = 0xd3
QUESTID_MONKITROPOLIS_ROBOCHIMP = 0xda
QUESTID_KONGRILA_DRAG_CRABS = 0xdb
QUESTID_MOONHAVEN_FIVE_RED_BALLOONS = 0xde
QUESTID_KONGRILA_REALIGN_SUNLIGHT_LENSES = 0xdf
QUESTID_ZOOTOPIA_EIGHT_CAT_BALLOONS = 0xe7
QUESTID_ZOOTOPIA_STOP_COASTER = 0xea
QUESTID_ZOOTOPIA_REMOTE_BALL_RACE = 0xeb
QUESTID_MOONHAVEN_RESCUE_CHILDREN = 0xf6
QUESTID_MOONHAVEN_FEED_FIRE_AUTOMATON = 0xf7
QUESTID_MOONHAVEN_FIND_TOOLBOX = 0xf8
QUESTID_ZOOTOPIA_PARK_CLEANUP = 0x102
QUESTID_MONKITROPOLIS_UNBLOCK_SOUND_PIPES = 0x106
QUESTID_KONGRILA_TURN_SCREAMING_TOWERS = 0x10c
QUESTID_ZOOTOPIA_STEALTH_DUCKS = 0x10e
QUESTID_MOONHAVEN_FROZEN_PUMPS = 0x115
QUESTID_BALLOON_DELIVERY = 0x116
QUESTID_MOONHAVEN_RELIGHT_FIRE_AUTOMATON = 0x119
QUESTID_ZOOTOPIA_MAGIC_SHOW = 0x126
QUESTID_MOONHAVEN_ALIGN_AIR_HORNS = 0x13b
QUESTID_MOONHAVEN_ICE_MOTHS = 0x13c
QUESTID_ZOOTOPIA_SHUTDOWN_PUZZLE = 0x13d
QUESTID_ZOOTOPIA_RESCUE_BALLOON_STUDENTS = 0x140
QUESTID_KONGRILA_WATER_BANANA_TREES = 0x141
QUESTID_MONKITROPOLIS_REALIGN_NOISE_PIPES = 0x145
QUESTID_MONKITROPOLIS_UNDERCOVER_RACEWAY = 0x148
QUESTID_ZOOTOPIA_FREE_FAT_CAT_MASCOTS = 0x15f
QUESTID_MONKITROPOLIS_STOP_ROBOCHIMPS = 0x1ab
QUESTID_KONGRILA_PATCH_TUNNEL_LEAKS = 0x1ba
QUESTID_MONKITROPOLIS_UNMASK_MONSTERS = 0x1c4
QUESTID_MOONHAVEN_PATCH_AIR_AUTOMATON = 0x1e5
QUESTID_JUNGLE_WIND = 0x23e
QUESTID_MONKITROPOLIS_RACEWAY_CLEANUP = 0x25b

MOVEMENT_NORMAL = 0x01
MOVEMENT_FLIGHT = 0x09
MOVEMENT_IN_CANNON = 0x0b

RACE_MODE_SINGLE = 0x00
RACE_MODE_GRAND_PRIX = 0x01
RACE_MODE_TIME_TRIAL = 0x02

FIGHT_MODE_NORMAL = 0x00
FIGHT_MODE_SURVIVAL = 0x01

CANNON_MODE_LAST_MAN_STANDING = 0x00
CANNON_MODE_TOP_GUN = 0x01

CANNON_PHASE_COUNTDOWN = 0x01
CANNON_PHASE_ATTACK = 0x02
CANNON_PHASE_FORTIFY = 0x03
CANNON_PHASE_RESULTS = 0x04

TAG_MODE_BURGLAR = 0x01
TAG_MODE_BALLOON_BUMP = 0x02

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
    // For "Ghost Rider"
    "GHOSTER_RIDER_LEFT_UPPER": {
        "x": {0: -250.0, 1: -110.0},
        "y": {0:    0.0, 1:    0.0},
        "z": {0:   40.0, 1:  170.0},
    },
    "GHOSTER_RIDER_LEFT_LOWER": {
        "x": {0:  -35.0, 1: -70.0},
        "y": {0:    0.0, 1:   0.0},
        "z": {0: -225.0, 1: -52.0},
    },
    "GHOSTER_RIDER_BOTTOM": {
        "x": {0:  -30.0, 1:  140.0},
        "y": {0:    0.0, 1:    0.0},
        "z": {0: -270.0, 1: -225.0},
    },
    "GHOSTER_RIDER_TOP": {
        "x": {0: -250.0, 1:  90.0},
        "y": {0:    0.0, 1:   0.0},
        "z": {0:  170.0, 1: 230.0},
    },
    "GHOSTER_RIDER_RIGHT": {
        "x": {0:    0.0, 1:  90.0},
        "y": {0:    0.0, 1:   0.0},
        "z": {0: -225.0, 1: 170.0},
    },
    "STOMP": {
        "x": {0: -70.0, 1: -49.0},
        "y": {0: 115.0, 1: 120.0},
        "z": {0: 112.0, 1: 135.0},
    },
    "OVERRUN1": {
        "x": {0:  8.0, 1:  9.0},
        "y": {0:  0.0, 1:  0.0},
        "z": {0: 12.0, 1: 15.0},
    },
    "OVERRUN2": {
        "x": {0: 15.0, 1: 17.0},
        "y": {0:  0.0, 1:  0.0},
        "z": {0:  8.0, 1: 15.0},
    },
}

CONES = {
    0: {
        "x": -2.3, // >
        "z": -168.0, // Gate
    },
    1: {
        "x": 2.1, // <
        "z": -136.0, // Gate
    },
    2: {
        "x": -1.8, // >
        "z": -104.0, // Gate
    },
    3: {
        "x": 1.6, // <
        "z": -71.8, // Gate
    },
    4: {
        "x": -1.35, // >
        "z": -40.0, // Gate
    },
    5: {
        "x": 1.1, // <
        "z": -7.8, // Gate
    },
    6: {
        "x": -0.86, // >
        "z": 24.0, // Gate
    },
    7: {
        "x": 0.62, // <
        "z": 56.1, // Gate
    },
    8: {
        "x": -0.34, // >
        "z": 88.0, // Gate
    },
    9: {
        "x": 0.13, // <
        "z": 120.0, // Gate
    },
    10: {
        "x": 0.1, // >
        "z": 151.7, // Gate
    },
    11: {
        "x": -0.34, // <
        "z": 184.0, // Gate
    },
}
CHECKMATE_SQUARES = [
    // x1, x2, z1, z2 
    // large
    [ -1.0,   9.0,  31.0,  41.0],
    [ -9.0,   1.0,  39.0,  49.0],
    [ -1.0,   9.0,  47.0,  57.0],
    [-17.0,  -7.0,  47.0,  57.0],
    [ -9.0,   1.0,  55.0,  65.0],
    [-25.0, -15.0,  55.0,  65.0],
    [ -1.0,   9.0,  63.0,  73.0],
    [-17.0,  -7.0,  63.0,  73.0],
    [-33.0, -23.0,  63.0,  73.0],
    [ -9.0,   1.0,  71.0,  81.0],
    [-25.0, -15.0,  71.0,  81.0],
    [-41.0, -31.0,  71.0,  81.0],
    [ -1.0,   9.0,  79.0,  89.0],
    [-17.0,  -7.0,  79.0,  89.0],
    [-33.0, -23.0,  79.0,  89.0],
    [-49.0, -39.0,  79.0,  89.0],
    [ -9.0,   1.0,  87.0,  97.0],
    [-25.0, -15.0,  87.0,  97.0],
    [-41.0, -31.0,  87.0,  97.0],
    [-57.0, -47.0,  87.0,  97.0],
    [ -1.0,   9.0,  95.0, 105.0],
    [-17.0,  -7.0,  95.0, 105.0],
    [-33.0, -23.0,  95.0, 105.0],
    [-49.0, -39.0,  95.0, 105.0],
    [-65.0, -55.0,  95.0, 105.0],
    [ -9.0,   1.0, 103.0, 113.0],
    [-25.0, -15.0, 103.0, 113.0],
    [-41.0, -31.0, 103.0, 113.0],
    [-57.0, -47.0, 103.0, 113.0],
    [-73.0, -63.0, 103.0, 113.0],
    // medium
    [  7.0,  15.0, 119.0, 127.0],
    [ 13.0,  21.0, 125.0, 133.0],
    [  7.0,  15.0, 131.0, 139.0],
    [ 19.0,  27.0, 131.0, 139.0],
    [ 13.0,  21.0, 137.0, 145.0],
    [ 25.0,  33.0, 137.0, 145.0],
    [  7.0,  15.0, 143.0, 151.0],
    [ 19.0,  27.0, 143.0, 151.0],
    [ 31.0,  39.0, 143.0, 151.0],
    [ 13.0,  21.0, 149.0, 157.0],
    [ 25.0,  33.0, 149.0, 157.0],
    [ 37.0,  45.0, 149.0, 157.0],
    [  7.0,  15.0, 155.0, 163.0],
    [ 19.0,  27.0, 155.0, 163.0],
    [ 31.0,  39.0, 155.0, 163.0],
    [ 43.0,  51.0, 155.0, 163.0],
    [ 13.0,  21.0, 161.0, 169.0],
    [ 25.0,  33.0, 161.0, 169.0],
    [ 37.0,  45.0, 161.0, 169.0],
    [ 49.0,  57.0, 161.0, 169.0],
    [  7.0,  15.0, 167.0, 175.0],
    [ 19.0,  27.0, 167.0, 175.0],
    [ 31.0,  39.0, 167.0, 175.0],
    [ 43.0,  51.0, 167.0, 175.0],
    [ 55.0,  63.0, 167.0, 175.0],
    [ 13.0,  21.0, 173.0, 181.0],
    [ 25.0,  33.0, 173.0, 181.0],
    [ 37.0,  45.0, 173.0, 181.0],
    [ 49.0,  57.0, 173.0, 181.0],
    [ 61.0,  69.0, 173.0, 181.0],
    // small
    [  3.0,   9.0, 185.0, 191.0],
    [ -1.0,   5.0, 189.0, 195.0],
    [  3.0,   9.0, 193.0, 199.0],
    [ -5.0,   1.0, 193.0, 199.0],
    [ -1.0,   5.0, 197.0, 203.0],
    [ -9.0,  -3.0, 197.0, 203.0],
    [  3.0,   9.0, 201.0, 207.0],
    [ -5.0,   1.0, 201.0, 207.0],
    [-13.0,  -7.0, 201.0, 207.0],
    [ -1.0,   5.0, 205.0, 211.0],
    [ -9.0,  -3.0, 205.0, 211.0],
    [-17.0, -11.0, 205.0, 211.0],
    [  3.0,   9.0, 209.0, 215.0],
    [ -5.0,   1.0, 209.0, 215.0],
    [-13.0,  -7.0, 209.0, 215.0],
    [-21.0, -15.0, 209.0, 215.0],
    [ -1.0,   5.0, 213.0, 219.0],
    [ -9.0,  -3.0, 213.0, 219.0],
    [-17.0, -11.0, 213.0, 219.0],
    [-25.0, -19.0, 213.0, 219.0],
    [  3.0,   9.0, 217.0, 223.0],
    [ -5.0,   1.0, 217.0, 223.0],
    [-13.0,  -7.0, 217.0, 223.0],
    [-21.0, -15.0, 217.0, 223.0],
    [-29.0, -23.0, 217.0, 223.0],
    [ -1.0,   5.0, 221.0, 227.0],
    [ -9.0,  -3.0, 221.0, 227.0],
    [-17.0, -11.0, 221.0, 227.0],
    [-25.0, -19.0, 221.0, 227.0],
    [-33.0, -27.0, 221.0, 227.0],
    // connecting
    [ -7.0,   1.0,  15.0,  23.0],
    [ -1.0,   7.0,  21.0,  29.0],
    [ -5.0,   1.0,  27.0,  33.0],
    [ -1.0,   9.0, 111.0, 121.0],
    [  7.0,  15.0, 179.0, 187.0],
    [  3.0,   9.0, 225.0, 231.0],
    [  7.0,  17.0, 229.0, 239.0],
    [  1.0,   9.0, 237.0, 245.0],
]

TIME_LIMITS = {
    US: {
        "TheFloorIsLumber": 60, // 1 second
        "WakeTheGuards": 2400, // 40 seconds
        "JungleExpress": 7200, // 2 minutes
        "RollerCoaster": 10800, // 3 minutes
        "ParkCleanup": 7800, // 2 minutes 10 seconds
        "AlignHorns": 1500, // 25 seconds
        "SurvivalFight": 480, // 8 seconds
    },
    EU: {
        "TheFloorIsLumber": 50, // 1 second
        "WakeTheGuards": 2000, // 40 seconds
        "JungleExpress": 6000, // 2 minutes
        "RollerCoaster": 9000, // 3 minutes
        "ParkCleanup": 6500, // 2 minutes 10 seconds
        "AlignHorns": 1250, // 25 seconds
        "SurvivalFight": 400, // 8 seconds
    },
}

JUNGLE_ISLAND_ALL_QUESTS = ["FindDaughter", 
                            "GetRidOfPlants", 
                            "ChaseAwayBirds", 
                            "RingTheBells", 
                            "WakeTheGuards",
                            "HatchChicks",
                            "RelightLighthouse",
                            "Photo_Island",
                            "ReturnBees",
                            "DeliverLunch",
                            "Photo_Village",
                            "Photo_Palace",
                            "IdentifyPrince",
                            "DeliverMessage",
                            "WindPathToPalace",
                            "MakmakDonation"
                        ]

ZOOTOPIA_ALL_QUESTS = [ "BumperCar",
                        "CoasterOutOfControl",
                        "RemoteBallRace",
                        "StrengthTest",
                        "MagicShow",
                        "ParkCleanup",
                        "StealthAndDucks",
                        "ShutdownPuzzle",
                        "RescueStudents",
                        "FreeFatCatMascots",
                        "Photo_Hedge",
                        "Photo_Coaster",
                        "DeliverMessage",
                        "EightCatBalloons",
                        "MakmakDonation"
                    ]

MOONHAVEN_ALL_QUESTS = ["OilGreatGears",
                        "PickUpBananaSkins",
                        "TimedSwitches",
                        "KeepIceMothsAway",
                        "FindToolbox",
                        "FeedFireAutomaton",
                        "RelightFireAutomaton",
                        "FiveBalloons",
                        "RescueChildren",
                        "AlignHorns",
                        "FrozenPumps",
                        "Levers",
                        "Photo_Automaton",
                        "PatchLeaks",
                        "DeliverBalloon",
                        "MakmakDonation"
                    ]

MONKITROPOLIS_ALL_QUESTS = ["CaptureMonsters",
                            "UnblockPipes",
                            "RealignPipes",
                            "Photo_Police",
                            "RacewayChallenge",
                            "DeliverMessageFactory",
                            "UnmaskMonsters",
                            "RacewayCleanup",
                            "StopRobochimpsCutting",
                            "MakmakDonation"
                        ]

KONGRILA_ALL_QUESTS = [ "ShootRobochimps",
                        "RealignLenses",
                        "DragCrabs",
                        "TurnTowers",
                        "WaterTrees",
                        "StopMetalMonkeys",
                        "DeliverMessageRedMonkey",
                        "PatchLeaks",
                        "Photo_Kongrila"
                    ]

// ============= MEMORY ===================

// Region related
function m_region_byte() => byte(0x101000) // 0x01 = EU, 0x02 = US
function m_disk_id_us() => byte(0x444FC0) // "SLUS_212.72" = US
function m_disk_id_eu() => byte(0x43E870) // "SLES_537.01" = EU

// Main pointers
function m_game_state_root_us() => dword(0x47317C)
function m_game_state_root_eu() => dword(0x46BDE4)

function m_player_state_us() => dword(0x473224)
function m_player_state_eu() => dword(0x46BE8C)

function m_progression_state_us() => dword(0x4735B8)
function m_progression_state_eu() => dword(0x46C220)

function m_controller_manager_us() => dword(0x472C2C)
function m_controller_manager_eu() => dword(0x46B8B4)

function m_ice_moth_quest_us() => dword(0x004A34EC)
function m_ice_moth_quest_eu() => dword(0x0049BD6C)

// No-Pointer Notes
function m_race_handicap_us() => byte(0x4725C8)
function m_race_items_us() => byte(0x4725C9)
function m_race_computer_players_us() => byte(0x4725CA)
function m_race_lap_count_us() => dword(0x472AD8)
function m_race_mode_us() => dword(0x4725C4)

function m_race_handicap_eu() => byte(0x46B248)
function m_race_items_eu() => byte(0x46B249)
function m_race_computer_players_eu() => byte(0x46B24A)
function m_race_lap_count_eu() => dword(0x46B760)
function m_race_mode_eu() => dword(0x46B244)

function m_fight_mode_us() => byte(0x00472511)
function m_fight_mode_eu() => byte(0x0046B191)

function m_bounce_board_us() => dword(0x00472540)
function m_bounce_board_eu() => dword(0x0046B1C0)

function m_party_conf_round_us() => dword(0x00472548)
function m_party_conf_round_eu() => dword(0x0046B1C8)

function m_party_current_round_us() => dword(0x0047254C)
function m_party_current_round_eu() => dword(0x0046B1CC)

function m_target_conf_round_us() => dword(0x00472590)
function m_target_conf_round_eu() => dword(0x0046B210)

function m_target_current_round_us() => dword(0x0047408C)
function m_target_current_round_eu() => dword(0x0046CC5C)

function m_tag_mode_us() => dword(0x00472604)
function m_tag_mode_eu() => dword(0x0046B284)

function m_tag_phase_us() => dword(0x004725FC)
function m_tag_phase_eu() => dword(0x0046B27C)

function m_cannon_mode_us() => dword(0x00472568)
function m_cannon_mode_eu() => dword(0x0046B1E8)

function m_cannon_fortify_cycle_counter_us() => dword(0x00472580)
function m_cannon_fortify_cycle_counter_eu() => dword(0x0046B200)

function m_frame_counter_us() => dword(0x00472F90)
function m_frame_counter_eu() => dword(0x0046BC18)

// ============= MEMORY HELPER =============

// Region related
function IsRegion(region)
{
    return m_region_byte() == region
}

MDiskID = {
    US: m_disk_id_us(),
    EU: m_disk_id_eu(),
}

// Main pointers
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

MController = {
    US: m_controller_manager_us(),
    EU: m_controller_manager_eu(),
}

MIceMothQuest = {
    US: m_ice_moth_quest_us(),
    EU: m_ice_moth_quest_eu(),
}

// No-pointer nodes
MRaceMode = {
    US: m_race_mode_us(),
    EU: m_race_mode_eu(),
}

MRaceHandicap = {
    US: m_race_handicap_us(),
    EU: m_race_handicap_eu(),
}

MRaceItems = {
    US: m_race_items_us(),
    EU: m_race_items_eu(),
}

MRaceCPU = {
    US: m_race_computer_players_us(),
    EU: m_race_computer_players_eu(),
}

MRaceLapCount = {
    US: m_race_lap_count_us(),
    EU: m_race_lap_count_eu(),
}

MFightMode = {
    US: m_fight_mode_us(),
    EU: m_fight_mode_eu(),
}

MBounceBoard = {
    US: m_bounce_board_us(),
    EU: m_bounce_board_eu(),
}

MPartyConfRound = {
    US: m_party_conf_round_us(),
    EU: m_party_conf_round_eu(),
}

MPartyCurrentRound = {
    US: m_party_current_round_us(),
    EU: m_party_current_round_eu(),
}

MTargetConfRound = {
    US: m_target_conf_round_us(),
    EU: m_target_conf_round_eu(),
}

MTargetCurrentRound = {
    US: m_target_current_round_us(),
    EU: m_target_current_round_eu(),
}

MTagMode = {
    US: m_tag_mode_us(),
    EU: m_tag_mode_eu(),
}

MTagPhase = {
    US: m_tag_phase_us(),
    EU: m_tag_phase_eu(),
}

MCannonMode = {
    US: m_cannon_mode_us(),
    EU: m_cannon_mode_eu(),
}

MCannonFortifyCycleCounter = {
    US: m_cannon_fortify_cycle_counter_us(),
    EU: m_cannon_fortify_cycle_counter_eu(),
}

MFrameCounter = {
    US: m_frame_counter_us(),
    EU: m_frame_counter_eu(),
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
            "Visited": ptr(MProgressionState[US], [0x28F8]),
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
        "Quests": {
            "IceMoth": {
                "NumberFlamesLit": ptr(MIceMothQuest[US], [0x00, 0xB88, 0xc8], byte)
            },
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
            "Visited": ptr(MProgressionState[EU], [0x28F8]),
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
        "Quests": {
            "IceMoth": {
                "NumberFlamesLit": ptr(MIceMothQuest[EU], [0x00, 0xB88, 0xc8], byte)
            },
        },
        "Moonhaven_Zootopia": ptr(MProgressionState[EU], [0x28E4]),
        "Joy100Total": ptr(MProgressionState[EU], [0x2ACC]),
        "ChallengeUnlocks": ptr(MProgressionState[EU], [0x2778]),
        "ZoneBananasBase": ptr(MProgressionState[EU], [0x0804, 0x18]),
    },
}

GameState = {
    US: {
        "Pause": {
            "Ptr": ptr(MGameState[US], [0x115AC]),
            "Menu": ptr(MGameState[US], [0x115AC, 0x54], dword),
            "Completion": ptr(MGameState[US], [0x115AC, 0x88], float),
        },
        "FloorSliders": {
            "Platform1Z": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x164, 0xC00, 0x08, 0x38], float)
        },
        "GameMode": ptr(MGameState[US], [0xC0, 0x434]),
        "TaskCounter": ptr(MGameState[US], [0xC0, 0x4AC, 0xC38], word),
        "PuzzleRemainingTimeRounded": ptr(MGameState[US], [0xC0, 0x3B4C]),
        "PuzzleRemainingTime": ptr(MGameState[US], [0xC0, 0x3B50], float),
        "Character": ptr(MGameState[US], [0xC0, 0x438]),
        "HumanPlayers": ptr(MGameState[US], [0xC0, 0x4E0]),
        "ResultScreen": ptr(MGameState[US], [0xC0, 0x542B4], bit1),
        "PauseScreen": ptr(MGameState[US], [0xC0, 0x5142C], bit1),
        "RoundResultScreen": ptr(MGameState[US], [0xC0, 0x514CC], bit1),
        "Player1": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x464]),
            "PartyPtr": ptr(MGameState[US], [0xC0, 0x4B0]),
            "Party": {
                "RoundScore": ptr(MGameState[US], [0xC0, 0x4B0, 0xEE4]),
                "TotalScore": ptr(MGameState[US], [0xC0, 0x4B0, 0xEE8]),
                "Rank": ptr(MGameState[US], [0xC0, 0x4B0, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4B0, 0xEFC]),
            },
            "Race": {
                "Ptr": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4]),
                "Phase": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x00]),
                "CurrentLap": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x10]),
                "CurrentPosition": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x20]),
                "RaceEndPosition": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x24]),
                "Lap1Time": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x3C], float),
                "Lap2Time": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x40], float),
                "Lap3Time": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x44], float),
                "TimeAttackTime": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0x68], float),
                "Item1": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0xB8]),
                "Item2": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0xBC]),
                "Item3": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0xC0]),
                "Item4": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A4, 0xC4]),
            },
            "Bounce": {
                "Active": ptr(MGameState[US], [0xC0, 0x3B654], bit1),
                "TileCount": ptr(MGameState[US], [0xC0, 0x3B770], word),
            },
            "Fight": {
                "Active": ptr(MGameState[US], [0xC0, 0x58BC], bit1),
                "SurvivalActive": ptr(MGameState[US], [0xC0, 0x5A04], bit1),
                "RemainingTime": ptr(MGameState[US], [0xC0, 0x58F8], float),
            },
            "Target": {
                "Ptr": ptr(MGameState[US], [0xC0, 0x4B0, 0xFEC]),
                "CurrentRoundScore": ptr(MGameState[US], [0xC0, 0x4B0, 0xFEC, 0x54]),
                "Score": ptr(MGameState[US], [0xC0, 0x4B0, 0xFEC, 0x5C]),
            },
            "Cannon": {
                "Ptr": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A8]),
                "Score": ptr(MGameState[US], [0xC0, 0x4B0, 0x2A8, 0x04]),
                "Active": ptr(MGameState[US], [0xC0, 0x3B794], bit1),
                "Phase": ptr(MGameState[US], [0xC0, 0x47408]),
                "Castle": ptr(MGameState[US], [0xC0, 0x47420]),
            },
            "Tag": {
                "Ptr": ptr(MGameState[US], [0xC0, 0x4B0, 0x600]),
                "Score": ptr(MGameState[US], [0xC0, 0x4B0, 0x600, 0x4A4]),
            },
        },
        "Player2": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x468]),
            "Party": {
                "RoundScore": ptr(MGameState[US], [0xC0, 0x4B4, 0xEE4]),
                "Rank": ptr(MGameState[US], [0xC0, 0x4B4, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4B4, 0xEFC]),
            },
            "Bounce": {
                "TileCount": ptr(MGameState[US], [0xC0, 0x3B772], word),
            },
        },
        "Player3": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x46C]),
            "Party": {
                "RoundScore": ptr(MGameState[US], [0xC0, 0x4B8, 0xEE4]),
                "Rank": ptr(MGameState[US], [0xC0, 0x4B8, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4B8, 0xEFC]),
            },
            "Bounce": {
                "TileCount": ptr(MGameState[US], [0xC0, 0x3B774], word),
            },
        },
        "Player4": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x470]),
            "Party": {
                "RoundScore": ptr(MGameState[US], [0xC0, 0x4BC, 0xEE4]),
                "Rank": ptr(MGameState[US], [0xC0, 0x4BC, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4BC, 0xEFC]),
            },
        },
        "Player5": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x474]),
            "Party": {
                "Rank": ptr(MGameState[US], [0xC0, 0x4C0, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4C0, 0xEFC]),
            },
            "Bounce": {
                "TileCount": ptr(MGameState[US], [0xC0, 0x3B776], word),
            },
        },
        "Player6": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x478]),
            "Party": {
                "Rank": ptr(MGameState[US], [0xC0, 0x4C4, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4C4, 0xEFC]),
            },
        },
        "Player7": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x47C]),
            "Party": {
                "Rank": ptr(MGameState[US], [0xC0, 0x4C8, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4C8, 0xEFC]),
            },
        },
        "Player8": {
            "Handicap": ptr(MGameState[US], [0xC0, 0x480]),
            "Party": {
                "Rank": ptr(MGameState[US], [0xC0, 0x4CC, 0xEEC]),
                "Participating": ptr(MGameState[US], [0xC0, 0x4CC, 0xEFC]),
            },
        },
        "ChallengeMode": {
            "SelectedDifficulty": ptr(MGameState[US], [0xC0, 0xC60]),
            "CurrentStage": ptr(MGameState[US], [0xC0, 0xC64]),
            "ChallengeState": ptr(MGameState[US], [0xC0, 0xC68]),
            "Score": ptr(MGameState[US], [0xC0, 0xC70]),
        }
    },
    EU: {
        "Pause": {
            "Ptr": ptr(MGameState[EU], [0x115AC]),
            "Menu": ptr(MGameState[EU], [0x115AC, 0x54], dword),
            "Completion": ptr(MGameState[EU], [0x115AC, 0x88], float),
        },
        "FloorSliders": {
            "Platform1Z": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x164, 0xC00, 0x08, 0x38], float)
        },
        "GameMode": ptr(MGameState[EU], [0xC0, 0x434]),
        "TaskCounter": ptr(MGameState[EU], [0xC0, 0x4AC, 0xC38], word),
        "PuzzleRemainingTimeRounded": ptr(MGameState[EU], [0xC0, 0x3B4C]),
        "PuzzleRemainingTime": ptr(MGameState[EU], [0xC0, 0x3B50], float),
        "Character": ptr(MGameState[EU], [0xC0, 0x438]),
        "HumanPlayers": ptr(MGameState[EU], [0xC0, 0x4E0]),
        "ResultScreen": ptr(MGameState[EU], [0xC0, 0x542B4], bit1),
        "PauseScreen": ptr(MGameState[EU], [0xC0, 0x5142C], bit1),
        "RoundResultScreen": ptr(MGameState[EU], [0xC0, 0x514CC], bit1),
        "Player1": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x464]),
            "PartyPtr": ptr(MGameState[EU], [0xC0, 0x4B0]),
            "Party": {
                "RoundScore": ptr(MGameState[EU], [0xC0, 0x4B0, 0xEE4]),
                "TotalScore": ptr(MGameState[EU], [0xC0, 0x4B0, 0xEE8]),
                "Rank": ptr(MGameState[EU], [0xC0, 0x4B0, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4B0, 0xEFC]),
            },
            "Race": {
                "Ptr": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4]),
                "Phase": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x00]),
                "CurrentLap": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x10]),
                "CurrentPosition": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x20]),
                "RaceEndPosition": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x24]),
                "Lap1Time": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x3C], float),
                "Lap2Time": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x40], float),
                "Lap3Time": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x44], float),
                "TimeAttackTime": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0x68], float),
                "Item1": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0xB8]),
                "Item2": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0xBC]),
                "Item3": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0xC0]),
                "Item4": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A4, 0xC4]),
            },
            "Bounce": {
                "Active": ptr(MGameState[EU], [0xC0, 0x3B654], bit1),
                "TileCount": ptr(MGameState[EU], [0xC0, 0x3B770], word),
            },
            "Fight": {
                "Active": ptr(MGameState[EU], [0xC0, 0x58BC], bit1),
                "SurvivalActive": ptr(MGameState[EU], [0xC0, 0x5A04], bit1),
                "RemainingTime": ptr(MGameState[EU], [0xC0, 0x58F8], float),
            },
            "Target": {
                "Ptr": ptr(MGameState[EU], [0xC0, 0x4B0, 0xFEC]),
                "CurrentRoundScore": ptr(MGameState[EU], [0xC0, 0x4B0, 0xFEC, 0x54]),
                "Score": ptr(MGameState[EU], [0xC0, 0x4B0, 0xFEC, 0x5C]),
            },
            "Cannon": {
                "Ptr": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A8]),
                "Score": ptr(MGameState[EU], [0xC0, 0x4B0, 0x2A8, 0x04]),
                "Active": ptr(MGameState[EU], [0xC0, 0x3B794], bit1),
                "Phase": ptr(MGameState[EU], [0xC0, 0x47408]),
                "Castle": ptr(MGameState[EU], [0xC0, 0x47420]),
            },
            "Tag": {
                "Ptr": ptr(MGameState[EU], [0xC0, 0x4B0, 0x600]),
                "Score": ptr(MGameState[EU], [0xC0, 0x4B0, 0x600, 0x4A4]),
                "PendingScoreGain": ptr(MGameState[EU], [0xC0, 0x4B0, 0x600, 0x4A8]),
                "PendingScoreLoss": ptr(MGameState[EU], [0xC0, 0x4B0, 0x600, 0x4AC]),
            },
        },
        "Player2": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x468]),
            "Party": {
                "RoundScore": ptr(MGameState[EU], [0xC0, 0x4B4, 0xEE4]),
                "Rank": ptr(MGameState[EU], [0xC0, 0x4B4, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4B4, 0xEFC]),
            },
            "Bounce": {
                "TileCount": ptr(MGameState[EU], [0xC0, 0x3B772], word),
            },
        },
        "Player3": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x46C]),
            "Party": {
                "RoundScore": ptr(MGameState[EU], [0xC0, 0x4B8, 0xEE4]),
                "Rank": ptr(MGameState[EU], [0xC0, 0x4B8, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4B8, 0xEFC]),
            },
            "Bounce": {
                "TileCount": ptr(MGameState[EU], [0xC0, 0x3B774], word),
            },
        },
        "Player4": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x470]),
            "Party": {
                "RoundScore": ptr(MGameState[EU], [0xC0, 0x4BC, 0xEE4]),
                "Rank": ptr(MGameState[EU], [0xC0, 0x4BC, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4BC, 0xEFC]),
            },
            "Bounce": {
                "TileCount": ptr(MGameState[EU], [0xC0, 0x3B776], word),
            },
        },
        "Player5": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x474]),
            "Party": {
                "Rank": ptr(MGameState[EU], [0xC0, 0x4C0, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4C0, 0xEFC]),
            },
        },
        "Player6": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x478]),
            "Party": {
                "Rank": ptr(MGameState[EU], [0xC0, 0x4C4, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4C4, 0xEFC]),
            },
        },
        "Player7": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x47C]),
            "Party": {
                "Rank": ptr(MGameState[EU], [0xC0, 0x4C8, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4C8, 0xEFC]),
            },
        },
        "Player8": {
            "Handicap": ptr(MGameState[EU], [0xC0, 0x480]),
            "Party": {
                "Rank": ptr(MGameState[EU], [0xC0, 0x4CC, 0xEEC]),
                "Participating": ptr(MGameState[EU], [0xC0, 0x4CC, 0xEFC]),
            },
        },
        "ChallengeMode": {
            "SelectedDifficulty": ptr(MGameState[EU], [0xC0, 0xC60]),
            "CurrentStage": ptr(MGameState[EU], [0xC0, 0xC64]),
            "ChallengeState": ptr(MGameState[EU], [0xC0, 0xC68]),
            "Score": ptr(MGameState[EU], [0xC0, 0xC70]),
        }
    },
}

PlayerState = {
    US: {
        "Valid": ptr(MPlayerState[US], [0xC0, 0x4AC]),
        "LevelName": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x04], mirror),
        "LevelName3": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x08], mirror),
        "LevelName4": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x0C], mirror),
        "LevelName5": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x10], mirror),
        "LevelName6": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x14], mirror),
        "LevelName7": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x18], mirror),
        "LevelName8": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x1C], mirror),
        "LevelNameAdd1": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x15], byte),
        "LevelNameAdd2": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x17], byte),
        "LevelNameLength": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0xA0, 0x13C]),
        "ActiveQuestPtr": ptr(MPlayerState[US], [0xC0, 0x1C0C]),
        "ActiveQuest": ptr(MPlayerState[US], [0xC0, 0x1C0C, 0x04]),
        "PunchReady": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x2B0, 0x1B8], byte),
        "FloorContact": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x37E], byte),
        "Collision": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x3F0], byte),
        "MovementState": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x194]),
        "InvisiballTimer": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x484], float),
        "ActiveLifecycles": {
            "Endscreen": ptr(MPlayerState[US], [0xC0, 0x161C], bit1),
            "Puzzle": ptr(MPlayerState[US], [0xC0, 0x3B14], bit1),
            "READY": ptr(MPlayerState[US], [0xC0, 0x3EE4], bit1),
            "FALLOUT": ptr(MPlayerState[US], [0xC0, 0x42A4], bit1),
            "TIMEOUT": ptr(MPlayerState[US], [0xC0, 0x42DC], bit1),
            "GOAL": ptr(MPlayerState[US], [0xC0, 0x46AC], bit1),
            "Shop": ptr(MPlayerState[US], [0xC0, 0x5ADC], bit1),
        },
        "StoryTimer": {
            "StartValue": ptr(MPlayerState[US], [0xC0, 0x182C], float),
            "RemainingRounded": ptr(MPlayerState[US], [0xC0, 0x1830]),
            "Remaining": ptr(MPlayerState[US], [0xC0, 0x1834], float),
            "Ptr": ptr(MPlayerState[US], [0xC0, 0x183C]),
        },
        "Ball": {
            "pos": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08]),
            "x": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08, 0x40], float),
            "y": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08, 0x44], float),
            "z": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x00, 0x08, 0x48], float),
            "Deformation": ptr(MPlayerState[US], [0xC0, 0x4AC, 0x258, 0x3D0], float),
        }
    },
    EU: {
        "Valid": ptr(MPlayerState[EU], [0xC0, 0x4AC]),
        "LevelName": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x04], mirror),
        "LevelName3": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x08], mirror),
        "LevelName4": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x0C], mirror),
        "LevelName5": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x10], mirror),
        "LevelName6": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x14], mirror),
        "LevelName7": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x18], mirror),
        "LevelName8": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x1C], mirror),
        "LevelNameAdd1": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x15], byte),
        "LevelNameAdd2": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x138, 0x17], byte),
        "LevelNameLength": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0xA0, 0x13C]),
        "ActiveQuestPtr": ptr(MPlayerState[EU], [0xC0, 0x1C0C]),
        "ActiveQuest": ptr(MPlayerState[EU], [0xC0, 0x1C0C, 0x04]),
        "PunchReady": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x2B0, 0x1B8], byte),
        "FloorContact": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x37E], byte),
        "Collision": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x3F0], byte),
        "MovementState": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x194]),
        "InvisiballTimer": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x484], float),
        "ActiveLifecycles": {
            "Endscreen": ptr(MPlayerState[EU], [0xC0, 0x161C], bit1),
            "Puzzle": ptr(MPlayerState[EU], [0xC0, 0x3B14], bit1),
            "READY": ptr(MPlayerState[EU], [0xC0, 0x3EE4], bit1),
            "FALLOUT": ptr(MPlayerState[EU], [0xC0, 0x42A4], bit1),
            "TIMEOUT": ptr(MPlayerState[EU], [0xC0, 0x42DC], bit1),
            "GOAL": ptr(MPlayerState[EU], [0xC0, 0x46AC], bit1),
            "Shop": ptr(MPlayerState[EU], [0xC0, 0x5ADC], bit1),
        },
        "StoryTimer": {
            "StartValue": ptr(MPlayerState[EU], [0xC0, 0x182C], float),
            "RemainingRounded": ptr(MPlayerState[EU], [0xC0, 0x1830]),
            "Remaining": ptr(MPlayerState[EU], [0xC0, 0x1834], float),
            "Ptr": ptr(MPlayerState[EU], [0xC0, 0x183C]),
        },
        "Ball": {
            "pos": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08]),
            "x": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08, 0x40], float),
            "y": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08, 0x44], float),
            "z": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x00, 0x08, 0x48], float),
            "Deformation": ptr(MPlayerState[EU], [0xC0, 0x4AC, 0x258, 0x3D0], float),
        }
    },
}

// ============= LOGIC =====================

function InPuzzle(region) {
    // "puzzle"
    return ascii_string_equals(PlayerState[region]["LevelName3"], "uzzl")
}

function InPuzzleLevel(region, puzzle) {
    return ascii_string_equals(PlayerState[region]["LevelName5"], puzzle)
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
function PauseMenuOpen(region) {
    return GameState[region]["PauseScreen"] == 0x01
}
    

function GeneralNotInGameReset(region) {
    return never(PlayerState[region]["Valid"] == 0x00000000)
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

function QuestCount(region, world, list) {
    val = ProgressionFlags[region][world][list[0]]

    for i in range(1, length(list) - 1)
    {
        val = val + ProgressionFlags[region][world][list[i]]
    }
    return val
}

function PurchaseCount(region, type) {
    if type == "characters"
        return  (ProgressionFlags[region]["Purchases"]["FutureAiAi"]) +
                (ProgressionFlags[region]["Purchases"]["PriceAbeAbe"]) +
                (ProgressionFlags[region]["Purchases"]["AleWat"]) +
                (ProgressionFlags[region]["Purchases"]["Simian"]) +
                (ProgressionFlags[region]["Purchases"]["ChChi"]) +
                (ProgressionFlags[region]["Purchases"]["PrincessDeeDee"]) +
                (ProgressionFlags[region]["Purchases"]["QueenJenjen"]) +
                (ProgressionFlags[region]["Purchases"]["JeckJeck"]) +
                (ProgressionFlags[region]["Purchases"]["MadKee"]) +
                (ProgressionFlags[region]["Purchases"]["Mermer"]) +
                (ProgressionFlags[region]["Purchases"]["PaiPai"]) +
                (ProgressionFlags[region]["Purchases"]["Papa"]) +
                (ProgressionFlags[region]["Purchases"]["PodPow"]) +
                (ProgressionFlags[region]["Purchases"]["Sisi"]) +
                (ProgressionFlags[region]["Purchases"]["Sumsum"]) +
                (ProgressionFlags[region]["Purchases"]["Toktok"]) +
                (ProgressionFlags[region]["Purchases"]["MeeNee"])
    else if type == "bounce"
        return  (ProgressionFlags[region]["Purchases"]["Bounce2"]) +
                (ProgressionFlags[region]["Purchases"]["Bounce3"]) +
                (ProgressionFlags[region]["Purchases"]["Bounce4"])
    else if type == "race"
        return  (ProgressionFlags[region]["Purchases"]["Race2"]) +
                (ProgressionFlags[region]["Purchases"]["Race3"]) +
                (ProgressionFlags[region]["Purchases"]["Race4"])
    else if type == "fight"
        return  (ProgressionFlags[region]["Purchases"]["Fight2"]) +
                (ProgressionFlags[region]["Purchases"]["Fight3"]) +
                (ProgressionFlags[region]["Purchases"]["Fight4"])
    else if type == "target"
        return  (ProgressionFlags[region]["Purchases"]["Target2"]) +
                (ProgressionFlags[region]["Purchases"]["Target3"]) +
                (ProgressionFlags[region]["Purchases"]["Target4"])
    else if type == "tag"
        return  (ProgressionFlags[region]["Purchases"]["Tag2"])
    else if type == "cannon"
        return  (ProgressionFlags[region]["Purchases"]["Cannon2"])
}

function IsChantActive(region, chant) {
    return ProgressionFlags[region]["Active"][chant] == 0x01
}

function IsAnyChantActive(region) {
    return (ProgressionFlags[region]["Active"]["Boxingball"] == 0x01 ||
            ProgressionFlags[region]["Active"]["Tetherball"] == 0x01 ||
            ProgressionFlags[region]["Active"]["Scalarball"] == 0x01 ||
            ProgressionFlags[region]["Active"]["Invisiball"] == 0x01 ||
            ProgressionFlags[region]["Active"]["Stickyball"] == 0x01 ||
            ProgressionFlags[region]["Active"]["Woodball"]   == 0x01 ||
            ProgressionFlags[region]["Active"]["Speedyball"] == 0x01 ||
            ProgressionFlags[region]["Active"]["Hoverball"]  == 0x01
           )
}

function ChantLearnedCount(region) {
    return (ProgressionFlags[region]["ChantUnlocks"]["Boxingball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Tetherball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Scalarball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Invisiball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Stickyball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Woodball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Speedyball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Hoverball"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Teleport_JungleIsland"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Teleport_Zootopia"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Teleport_Moonhaven"]) +
           (ProgressionFlags[region]["ChantUnlocks"]["Teleport_Monkitropolis"])
}

function Punched(region) {
    return ProgressionFlags[region]["Active"]["Boxingball"] == 0x01 &&
           prev(PlayerState[region]["PunchReady"] == 0x01) &&
           PlayerState[region]["PunchReady"] == 0x00
}

function CountPunches(region, amount) {
    return tally(16, Punched(region))
}

function InFlightMode(region) {
    return PlayerState[region]["MovementState"] == MOVEMENT_FLIGHT
}

function LeftFlightMode(region) {
    return prev(PlayerState[region]["MovementState"] == MOVEMENT_FLIGHT) && PlayerState[region]["MovementState"] != MOVEMENT_FLIGHT
}

function IsRevealedInvisiball(region) {
    return PlayerState[region]["InvisiballTimer"] > 0.0
}

function ShotFiredRobochimp(region) {
    return PlayerState[region]["MovementState"] == MOVEMENT_IN_CANNON && 
           prev(PlayerState[region]["FloorContact"]) == 0x01 &&
           PlayerState[region]["FloorContact"] == 0x00
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
function IsInHorizontalCoordinates(region, x1, x2, z1, z2) {
    return ptr(CurrentPositionPtr[region], [OffX], float) >= x1 && 
           ptr(CurrentPositionPtr[region], [OffX], float) <= x2 &&
           ptr(CurrentPositionPtr[region], [OffZ], float) >= z1 && 
           ptr(CurrentPositionPtr[region], [OffZ], float) <= z2
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

function ExitedArea(region, area) {
    return (
        prev(ptr(CurrentPositionPtr[region], [OffX], float) >= AREAS[area]["x"][0]) && 
        prev(ptr(CurrentPositionPtr[region], [OffX], float) <= AREAS[area]["x"][1]) &&
        prev(ptr(CurrentPositionPtr[region], [OffY], float) >= AREAS[area]["y"][0]) && 
        prev(ptr(CurrentPositionPtr[region], [OffY], float) <= AREAS[area]["y"][1]) &&
        prev(ptr(CurrentPositionPtr[region], [OffZ], float) >= AREAS[area]["z"][0]) && 
        prev(ptr(CurrentPositionPtr[region], [OffZ], float) <= AREAS[area]["z"][1])
    ) && (
        ptr(CurrentPositionPtr[region], [OffX], float) < AREAS[area]["x"][0] ||
        ptr(CurrentPositionPtr[region], [OffX], float) > AREAS[area]["x"][1] ||
        ptr(CurrentPositionPtr[region], [OffY], float) < AREAS[area]["y"][0] || 
        ptr(CurrentPositionPtr[region], [OffY], float) > AREAS[area]["y"][1] ||
        ptr(CurrentPositionPtr[region], [OffZ], float) < AREAS[area]["z"][0] || 
        ptr(CurrentPositionPtr[region], [OffZ], float) > AREAS[area]["z"][1]
    )
}

function CalculateCompletion(region) {
    return ((100 * ProgressionFlags[region]["JungleIsland"]["Joy100"]) +
     (100 * ProgressionFlags[region]["Zootopia"]["Joy100"]) +
     (100 * ProgressionFlags[region]["Moonhaven"]["Joy100"]) +
     (100 * ProgressionFlags[region]["Monkitropolis"]["Joy100"]) +
     (ProgressionFlags[region]["JungleIsland"]["Bananas"] / 6.00) +
     (ProgressionFlags[region]["Zootopia"]["Bananas"] / 7.50) +
     (ProgressionFlags[region]["Moonhaven"]["Bananas"] / 7.50) +
     (ProgressionFlags[region]["Monkitropolis"]["Bananas"] / 9.00)) / 8
}

// ================= PUZZLE LEVEL HELPERS ===================

function PuzzleStartedCommon(region) {
    return InPuzzle(region) && 
           prev(PlayerState[region]["ActiveLifecycles"]["READY"] == 0x01) &&
           PlayerState[region]["ActiveLifecycles"]["READY"] == 0x00
}

function PuzzleStartedSpecific(region, puzzle) {
    return InPuzzle(region) && 
           InPuzzleLevel(region, puzzle) &&
           prev(PlayerState[region]["ActiveLifecycles"]["READY"] == 0x01) &&
           PlayerState[region]["ActiveLifecycles"]["READY"] == 0x00
}

function PuzzleFailedReset(region) {
    return never(prev(PlayerState[region]["ActiveLifecycles"]["FALLOUT"] == 0x00) &&
           PlayerState[region]["ActiveLifecycles"]["FALLOUT"] == 0x01) &&
           never(prev(PlayerState[region]["ActiveLifecycles"]["TIMEOUT"] == 0x00) &&
           PlayerState[region]["ActiveLifecycles"]["TIMEOUT"] == 0x01)  
}

function PuzzleFailedResetContinuous(region) {
    return never(PlayerState[region]["ActiveLifecycles"]["FALLOUT"] == 0x01) &&
           never(PlayerState[region]["ActiveLifecycles"]["TIMEOUT"] == 0x01)  
}

function PuzzleResetOnReady(region) {
    return never(prev(PlayerState[region]["ActiveLifecycles"]["READY"] == 0x00) &&
           PlayerState[region]["ActiveLifecycles"]["READY"] == 0x01)
}

function PuzzleLeftReset(region, puzzle) {
    return never(!InPuzzleLevel(region, puzzle))
}

function PuzzleCompletedCommon(region) {
    return prev(PlayerState[region]["ActiveLifecycles"]["GOAL"] == 0x00) &&
           PlayerState[region]["ActiveLifecycles"]["GOAL"] == 0x01
}

function PuzzleCompletedSpecific(region, puzzle) {
    return InPuzzle(region) && 
           InPuzzleLevel(region, puzzle) &&
           prev(PlayerState[region]["ActiveLifecycles"]["GOAL"] == 0x00) &&
           PlayerState[region]["ActiveLifecycles"]["GOAL"] == 0x01
}

function CheckmateSquareVisited(region, square) {
    return once(IsInHorizontalCoordinates(region, square[0], square[1], square[2], square[3]))
}

function CheckmateEnterAllSquares(region) {
    ret = once(IsInHorizontalCoordinates(region, CHECKMATE_SQUARES[0][0], CHECKMATE_SQUARES[0][1], CHECKMATE_SQUARES[0][2], CHECKMATE_SQUARES[0][3]))
    
    for i in range(1, length(CHECKMATE_SQUARES) - 1)
    {
        ret = ret && once(IsInHorizontalCoordinates(region, CHECKMATE_SQUARES[i][0], CHECKMATE_SQUARES[i][1], CHECKMATE_SQUARES[i][2], CHECKMATE_SQUARES[i][3]))
    }
    return ret
}

// ================= PARTY GAME HELPER ======================
function TimeTrialReset(region, time) {
    return never(
        (
            GameState[region]["Player1"]["Race"]["Lap1Time"] +
            GameState[region]["Player1"]["Race"]["Lap2Time"] +
            GameState[region]["Player1"]["Race"]["Lap3Time"]
        ) > time
    )
}

function PartyWinnerPlayer1(region) {
    return GameState[region]["Player1"]["Party"]["Rank"] == 0x00 &&
           GameState[region]["Player2"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player3"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player4"]["Party"]["Rank"] != 0x00
}

function RaceWinnerPlayer1(region) {
    return GameState[region]["Player1"]["Party"]["Rank"] == 0x00 &&
           GameState[region]["Player2"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player3"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player4"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player5"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player6"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player7"]["Party"]["Rank"] != 0x00 &&
           GameState[region]["Player8"]["Party"]["Rank"] != 0x00
}



// ================= ROLLER COASTER HELPERS =================

function CoasterStart(region) {
    return prev(PlayerState[region]["Ball"]["x"]) > -100.0 &&
           PlayerState[region]["Ball"]["x"] <= -100.0
}

function CoasterCheckpoint1(region) {
    return prev(PlayerState[region]["Ball"]["z"]) < -50.0 &&
           PlayerState[region]["Ball"]["z"] >= -50.0
}

function CoasterCheckpoint2(region) {
    return prev(PlayerState[region]["Ball"]["x"]) < -130.0 &&
           PlayerState[region]["Ball"]["x"] >= -130.0
}

function CoasterCheckpoint3(region) {
    return prev(PlayerState[region]["Ball"]["x"]) < -25.0 &&
           PlayerState[region]["Ball"]["x"] >= -25.0
}

function CoasterFinish(region) {
    return prev(PlayerState[region]["Ball"]["x"]) > -90.0 &&
           PlayerState[region]["Ball"]["x"] <= -90.0
}

// Detects that FINISH was crossed on the preceding frame.
// This closes the previous lap before another START is accepted.
function CoasterFinishedPreviousFrame(region) {
    return prior(PlayerState[region]["Ball"]["x"]) > -90.0 &&
           prev(PlayerState[region]["Ball"]["x"]) <= -90.0
}


function FunrunSlalomReset(region) {
    return never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[0]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[0]["z"] &&
                PlayerState[region]["Ball"]["x"] >= CONES[0]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[1]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[1]["z"] &&
                PlayerState[region]["Ball"]["x"] <= CONES[1]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[2]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[2]["z"] &&
                PlayerState[region]["Ball"]["x"] >= CONES[2]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[3]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[3]["z"] &&
                PlayerState[region]["Ball"]["x"] <= CONES[3]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[4]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[4]["z"] &&
                PlayerState[region]["Ball"]["x"] >= CONES[4]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[5]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[5]["z"] &&
                PlayerState[region]["Ball"]["x"] <= CONES[5]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[6]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[6]["z"] &&
                PlayerState[region]["Ball"]["x"] >= CONES[6]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[7]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[7]["z"] &&
                PlayerState[region]["Ball"]["x"] <= CONES[7]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[8]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[8]["z"] &&
                PlayerState[region]["Ball"]["x"] >= CONES[8]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[9]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[9]["z"] &&
                PlayerState[region]["Ball"]["x"] <= CONES[9]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[10]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[10]["z"] &&
                PlayerState[region]["Ball"]["x"] >= CONES[10]["x"]
           ) &&
           never(
                prev(PlayerState[region]["Ball"]["z"]) < CONES[11]["z"] &&
                PlayerState[region]["Ball"]["z"] >= CONES[11]["z"] &&
                PlayerState[region]["Ball"]["x"] <= CONES[11]["x"]
           )
}

// ============= ACHIEVEMENTS ==============

achievement(
    title = "Welcome to the Jungle", points = 2, type="progression", id=649880,
    description = "Complete your first story quest. This game uses autosave which will block you out of some missables. It is recommended to disable autosave.",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                prev(QuestCountJungle(region)) == 0 && 
                QuestCountJungle(region) == 1
              ))
)

achievement(
    title = "Loading Screens? No Thanks!", points = 1, type="progression", id=650308,
    description = "Complete the story quest \"Path to Palace\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "WindPathToPalace")
              ))
)

achievement(
    title = "Sixty Shades of Joy", points = 10, type="progression", id=650309,
    description = "Reach 60 Joy in Jungle Island and unlock \"Find the Prince and Princess\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "Joy60")
              ))
)

achievement(
    title = "Royal Reunion", points = 2, type="progression", id=650310,
    description = "Complete \"Find the Prince and Princess\" and unlock Zootopia and Moonhaven",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "IdentifyPrince")
              ))
)

achievement(
    title = "Weed Whacker", points = 5, type="missable", id=650311,
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
    title = "The Floor Is Lumber", points = 5, type="missable", id=650331,
    description = "Complete \"Picture at the hives\" without touching wooden ground for more than 1 second",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedInZoneCheckpoint(region, "vill", QUESTID_TAKE_PHOTO) &&

                // Challenge failed condition
                never(tally(TIME_LIMITS[region]["TheFloorIsLumber"], 
                    IsInArea(region, "JUNGLE_ISLAND_WOOD_1"), 
                    IsInArea(region, "JUNGLE_ISLAND_WOOD_2"))) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "JungleIsland", "Photo_Village"))
              ))
)

achievement(
    title = "You Snooze, You Lose", points = 10, type="missable", id=650813,
    description = "Complete \"Wake the Guards\" in 0'40\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_JUNGLE_WAKE_GUARDS) &&

                // Challenge failed condition
                never(tally(TIME_LIMITS[region]["WakeTheGuards"], always_true())) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "JungleIsland", "WakeTheGuards"))
              ))
)


achievement(
    title = "Eggcellent Flight", points = 5, type="missable", id=650814,
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
    title = "Jungle Express", points = 10, type="", id=650816,
    description = "In Jungle Island, go from the starting position to the throne room in less than 2'00\"00 without using chants or flying",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // Checkpoint logic when entered the starting area
                once(IsInHorizontalAreaWithZone(region, "JUNGLE_START", "vill")) &&

                // Challenge failed conditions
                (
                    never(repeated(TIME_LIMITS[region]["JungleExpress"],
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
    title = "Welcome to the Wild Side", points = 1, type="progression", id=650818,
    description = "Arrive at Zootopia for the first time",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Zootopia", "Visited")
              ))
)

achievement(
    title = "Powering Up", points = 10, type="progression", id=650819,
    description = "Reach 60 Joy in Zootopia and unlock \"Shutdown Puzzle\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Zootopia", "Joy60")
              ))
)

achievement(
    title = "Monkey in the Machine", points = 2, type="progression", id=650820,
    description = "Complete \"Shutdown Puzzle\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Zootopia", "ShutdownPuzzle")
              ))
)

achievement(
    title = "Quack Ops", points = 10, type="missable", id=650821,
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
    title = "Stronger than Glue", points = 10, type="missable", id=650822,
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
    title = "Woodn't Need It", points = 5, type="missable", id=650823,
    description = "Complete \"Picture below the coaster\" without using the Woodball",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedInZoneCheckpoint(region, "rc01", QUESTID_TAKE_PHOTO) &&

                // Challenge failed condition
                never(IsChantActive(region, "Woodball")) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Zootopia", "Photo_Coaster"))
              ))
)

achievement(
    title = "Water You Afraid Of?", points = 10, type="", id=651011,
    description = "Complete five rounds on the roller coaster without falling down in the water in 3'00\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InZone(region, "rc01") && 

                // Shared attempt-active latch.
                // Becomes true at the first START and is cleared by any ResetIf.
                once(CoasterStart(region)) &&

                (
                    // Indicator-only alt: stays primed throughout the attempt.
                    trigger_when(always_false()) ||

                    // Validate the sequence START -> checkpoint 1 -> checkpoint 2 -> checkpoint 3 -> FINISH
                    (
                        // Wait for START / The previous FINISH closes the completed lap
                        disable_when(
                            always_true(),
                            until = once(
                                CoasterStart(region) &&
                                never(CoasterFinishedPreviousFrame(region))
                            )
                        ) &&

                        // Wait for checkpoint 1 / a new START clears the hit
                        disable_when(
                            always_true(),
                            until = once(
                                CoasterCheckpoint1(region) &&
                                never(CoasterStart(region))
                            )
                        ) &&

                        // Wait for checkpoint 2 / checkpoint 1 clears the hit
                        disable_when(
                            always_true(),
                            until = once(
                                CoasterCheckpoint2(region) &&
                                never(CoasterCheckpoint1(region))
                            )
                        ) &&

                        // Wait for checkpoint 3 / checkpoint 2 clears the hit
                        disable_when(
                            always_true(),
                            until = once(
                                CoasterCheckpoint3(region) &&
                                never(CoasterCheckpoint2(region))
                            )
                        ) &&

                        // Lap count / only increase when all previous checkpoints are passed in order
                        measured(repeated(5, CoasterFinish(region)))
                    ) ||

                    // Reset-only alt.
                    (
                        always_false() &&
                        never(tally(TIME_LIMITS[region]["RollerCoaster"], once(CoasterStart(region)) && always_true())) &&
                        never(PlayerState[region]["Ball"]["z"] < -120.0) &&
                        never(PlayerState[region]["Ball"]["y"] < -120.0)
                    )
                )
    ))
)


achievement(
    title = "Trash Dash", points = 10, type="missable", id=651013,
    description = "Complete \"Park Cleanup\" in 2'10\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_ZOOTOPIA_PARK_CLEANUP) &&

                // Challenge failed condition
                never(tally(TIME_LIMITS[region]["ParkCleanup"], always_true())) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Zootopia", "ParkCleanup"))
              ))
)

achievement(
    title = "Welcome to the Haven", points = 1, type="progression", id=651070,
    description = "Arrive at Moonhaven for the first time",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Moonhaven", "Visited")
              ))
)

achievement(
    title = "Every 60 Seconds, a Minute Passes", points = 10, type="progression", id=651071,
    description = "Reach 60 Joy in Moonhaven and unlock \"Little Un's on Levers\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Moonhaven", "Joy60")
              ))
)

achievement(
    title = "Leveraging the Little Things", points = 2, type="progression", id=651072,
    description = "Complete \"Little Un's on Levers\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Moonhaven", "Levers")
              ))
)

achievement(
    title = "Ahead of the Clock", points = 10, type="missable", id=651073,
    description = "Complete \"Timed Switches\" without letting the timer drop below 3 seconds at any time",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) &&// Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MOONHAVEN_TIMED_SWITCHES) &&

                // Challenge failed condition
                never(
                    PlayerState[region]["StoryTimer"]["Ptr"] != 0x00 &&
                    prev(PlayerState[region]["StoryTimer"]["RemainingRounded"]) == 0x03 &&
                    PlayerState[region]["StoryTimer"]["RemainingRounded"] == 0x02
                ) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Moonhaven", "TimedSwitches"))
              ))
)

achievement(
    title = "Speechless", points = 5, type="missable", id=651606,
    description = "Complete \"Five red balloons\" without using any chant",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MOONHAVEN_FIVE_RED_BALLOONS) &&

                // Challenge failed condition
                never(
                    IsAnyChantActive(region)
                ) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Moonhaven", "FiveBalloons"))
              ))
)


achievement(
    title = "Swift Silence", points = 25, type="missable", id=651607,
    description = "Complete \"Align the Air Automaton Horns\" in 0'25\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MOONHAVEN_ALIGN_AIR_HORNS) &&

                // Challenge failed condition
                never(tally(TIME_LIMITS[region]["AlignHorns"], always_true())) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Moonhaven", "AlignHorns"))
              ))
)

achievement(
    title = "Full Blaze", points = 10, type="missable", id=651608,
    description = "Complete \"Keep the flames lit\" with all flames lit",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MOONHAVEN_ICE_MOTHS) &&

                // Challenge failed
                never(
                    ProgressionFlags[region]["Quests"]["IceMoth"]["NumberFlamesLit"] == 0x03 &&
                    prev(PlayerState[region]["StoryTimer"]["Remaining"] > 0.05) &&
                    PlayerState[region]["StoryTimer"]["Remaining"] <= 0.05
                ) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Moonhaven", "KeepIceMothsAway"))
              ))
)

achievement(
    title = "Welcome to the City of Apes", points = 1, type="progression", id=651651,
    description = "Arrive at Monkitropolis/Kongri-La for the first time",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Monkitropolis", "Visited")
              ))
)

achievement(
    title = "Urban Euphoria", points = 10, type="progression", id=651652,
    description = "Reach 60 Joy in Monkitropolis/Kongri-La",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "Monkitropolis", "Joy60")
              ))
)

achievement(
    title = "No Strings Attached", points = 3, type="missable", id=651653,
    description = "Complete \"Picture in mid-air\" without using the Hoverball",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedInZoneCheckpoint(region, "mk_p", QUESTID_TAKE_PHOTO) &&

                // Challenge failed condition
                never(IsChantActive(region, "Hoverball")) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Monkitropolis", "Photo_Police"))
              ))
)

achievement(
    title = "You Shall Not Splash", points = 5, type="missable", id=651654,
    description = "Complete \"Arrest the monsters\" without letting any of the monsters escape into the sewers",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MONKITROPOLIS_CATCH_MONSTERS) &&

                // Challenge failed condition 
                never(prev(GameState[region]["TaskCounter"]) < GameState[region]["TaskCounter"]) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Monkitropolis", "CaptureMonsters"))
              ))
)

achievement(
    title = "Ghost Rider", points = 10, type="missable", id=651655,
    description = "Complete \"Speedway Cleanup\" by only going in the direction opposite to the traffic without turning around or moving with the traffic at any point",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MONKITROPOLIS_CATCH_MONSTERS) &&

                // Challenge failed conditions
                never(IsInHorizontalArea(region, "GHOSTER_RIDER_LEFT_UPPER") && 
                      prev(PlayerState[region]["Ball"]["z"]) > PlayerState[region]["Ball"]["z"]
                      ) &&

                never(IsInHorizontalArea(region, "GHOSTER_RIDER_LEFT_LOWER") && 
                      prev(PlayerState[region]["Ball"]["z"]) > PlayerState[region]["Ball"]["z"]
                      ) &&

                never(IsInHorizontalArea(region, "GHOSTER_RIDER_BOTTOM") && 
                      prev(PlayerState[region]["Ball"]["x"]) < PlayerState[region]["Ball"]["x"]
                      ) &&

                never(IsInHorizontalArea(region, "GHOSTER_RIDER_TOP") && 
                      prev(PlayerState[region]["Ball"]["x"]) > PlayerState[region]["Ball"]["x"]
                      ) &&
    
                never(IsInHorizontalArea(region, "GHOSTER_RIDER_RIGHT") && 
                      prev(PlayerState[region]["Ball"]["z"]) < PlayerState[region]["Ball"]["z"]
                      ) &&
                // Actual trigger
                trigger_when(QuestCompleted(region, "Monkitropolis", "RacewayCleanup"))
              ))
)

achievement(
    title = "Sharpshooter", points = 10, type="missable", id=652424,
    description = "Complete \"Launch those robots\" with 9 shots or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedCheckpoint(region, QUESTID_MONKITROPOLIS_ROBOCHIMP) &&

                // Challenge failed condition 
                never(tally(9, ShotFiredRobochimp(region))) &&

                // Actual trigger
                trigger_when(QuestCompleted(region, "Monkitropolis", "ShootRobochimps"))
              ))
)

achievement(
    title = "Stomped!", points = 2, type="", id=652425,
    description = "Get stomped",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // correct position
                InWorld(region, "onkt") &&
                InZone(region, "mk_r") &&
                IsInArea(region, "STOMP") &&

                // trigger (ball transformation)
                prev(PlayerState[region]["Ball"]["Deformation"] == 0.00) &&
                PlayerState[region]["Ball"]["Deformation"] < 0.00
              ))
)

achievement(
    title = "Say Cheese on Ball", points = 5, type="missable", id=652426,
    description = "Complete \"Kongri-La Photo\" without being in the Hoverball while the picture is shot",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                NotInQuestReset(region) && // Resets hitcounts when not in quest

                // Checkpoint logic when the quest is started
                QuestStartedInZoneCheckpoint(region, "mk_k", QUESTID_TAKE_PHOTO) &&

                // trigger (ball transformation)
                trigger_when(!IsChantActive(region, "Hoverball") && 
                              QuestCompleted(region, "Monkitropolis", "Photo_Kongrila") )
              ))
)

achievement(
    title = "Happily Ever After", points = 25, type="win_condition", id=652427,
    description = "Complete the main story by participating at the wedding",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                QuestCompleted(region, "JungleIsland", "RingTheBells")
              ))
)


achievement(
    title = "Beyond Completion", points = 25, type="", id=652953,
    description = "Reach 101% completion rating, by not forgetting to collect every banana in \"Adjust the Mirrors\" in Kongri-La",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(CalculateCompletion(region) < 101.0) &&
                CalculateCompletion(region) >= 101.0
              ))
)


achievement(
    title = "Jungle Joyride", points = 5, type="", id=652954,
    description = "Reach 100 Joy in Jungle Island",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                QuestCompleted(region, "JungleIsland", "Joy100")
              ))
)

achievement(
    title = "High-Voltage Happiness", points = 5, type="", id=652955,
    description = "Reach 100 Joy in Zootopia",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                QuestCompleted(region, "Zootopia", "Joy100")
              ))
)

achievement(
    title = "Certified Lunar-tic", points = 5, type="", id=652956,
    description = "Reach 100 Joy in Moonhaven",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                QuestCompleted(region, "Moonhaven", "Joy100")
              ))
)

achievement(
    title = "Harmony Skyline", points = 5, type="", id=652957,
    description = "Reach 100 Joy in Monkitropolis / Kongri-La",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                QuestCompleted(region, "Monkitropolis", "Joy100")
              ))
)


achievement(
    title = "Guardian of Jungle Island", points = 5, type="", id=652958,
    description = "Complete all 16 story missions in Jungle Island",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(QuestCount(region, "JungleIsland", JUNGLE_ISLAND_ALL_QUESTS)) == 15 &&
                measured(QuestCount(region, "JungleIsland", JUNGLE_ISLAND_ALL_QUESTS) == 16)
              ))
)

achievement(
    title = "Keeper of Zootopia", points = 5, type="", id=652959,
    description = "Complete all 15 story missions in Zootopia",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(QuestCount(region, "Zootopia", ZOOTOPIA_ALL_QUESTS)) == 14 &&
                measured(QuestCount(region, "Zootopia", ZOOTOPIA_ALL_QUESTS) == 15)
              ))
)

achievement(
    title = "Steward of Moonhaven", points = 5, type="", id=652960,
    description = "Complete all 16 story missions in Moonhaven",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(QuestCount(region, "Moonhaven", MOONHAVEN_ALL_QUESTS)) == 15 &&
                measured(QuestCount(region, "Moonhaven", MOONHAVEN_ALL_QUESTS) == 16)
              ))
)

achievement(
    title = "Champion of Monkitropolis", points = 5, type="", id=652961,
    description = "Complete all 10 story missions in Monkitropolis",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(QuestCount(region, "Monkitropolis", MONKITROPOLIS_ALL_QUESTS)) == 9 &&
                measured(QuestCount(region, "Monkitropolis", MONKITROPOLIS_ALL_QUESTS) == 10)
              ))
)


achievement(
    title = "Protector of Kongri-La", points = 5, type="", id=652962,
    description = "Complete all 9 story missions in Kongri-La",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(QuestCount(region, "Monkitropolis", KONGRILA_ALL_QUESTS)) == 8 &&
                measured(QuestCount(region, "Monkitropolis", KONGRILA_ALL_QUESTS) == 9)
              ))
)

achievement(
    title = "Ready, Set, Roll", points = 5, type="", id=653380,
    description = "In story mode, clear all 12 puzzles in Jungle Island in one session and without quitting to main menu",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // reset hits when not in game
                never(!InGame(region)) &&

                measured(tally(12, 
                      once(PuzzleCompletedSpecific(region, PUZZLES["CASCADE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["CELTIC_KNOTS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["CROSSROADS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["HOLES"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["JUMP"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["OVER_THE_HILLS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["OVERRUN"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["RIPPLE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SEQUENCER"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SHUFFLE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SIMPLESPLIT"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["TONGUE_TWISTER"]))
                ))
            ))
)

achievement(
    title = "Roller Coaster", points = 5, type="", id=653381,
    description = "In story mode, clear all 10 puzzles in Zootopia in one session and without quitting to main menu",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // reset hits when not in game
                never(!InGame(region)) &&

                measured(tally(10, 
                      once(PuzzleCompletedSpecific(region, PUZZLES["BREADBASKET"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["CHECKMATE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["CIRCUITS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["ETERNAL"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["HAIRPINS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["LOOP_IT"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["PLUGHOLE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["RIDGEWALKER"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["ZZSTOP"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["FUNRUN"]))
                ))
            ))
)

achievement(
    title = "One Small Roll for Monkeykind", points = 5, type="", id=653382,
    description = "In story mode, clear all 10 puzzles in Moonhaven in one session and without quitting to main menu",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // reset hits when not in game
                never(!InGame(region)) &&

                measured(tally(10, 
                      once(PuzzleCompletedSpecific(region, PUZZLES["BOWLS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["DIMPLE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["FREEWHEELER"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["GRAVITY_WELLS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["PITCH_AND_PUTT"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SERPENT"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SIDESTEP"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SKID_SLALOM"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SMILE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["TIPTOE"]))
                ))
            ))
)

achievement(
    title = "Rock and Roll City", points = 5, type="", id=653383,
    description = "In story mode, clear all 6 puzzles in Monkitropolis in one session and without quitting to main menu",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // reset hits when not in game
                never(!InGame(region)) &&

                measured(tally(6, 
                      once(PuzzleCompletedSpecific(region, PUZZLES["BACKFLIP"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["BUMPS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["HEADLONG"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SLIDER"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SPIRAL_SCRATCH"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SQUEEGEE"]))
                ))
            ))
)

achievement(
    title = "Kongri-Roll", points = 5, type="", id=653384,
    description = "In story mode, clear all 11 puzzles in Kongri-La in one session and without quitting to main menu",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // reset hits when not in game
                never(!InGame(region)) &&

                measured(tally(11, 
                      once(PuzzleCompletedSpecific(region, PUZZLES["BACKSLIDER"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["COG"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["DEADLINE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["ELEMENTARY"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["FLOOR_SLIDERS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["GANKANNY"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["HOOPSNAKE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["JAWBRIDGE"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SLALOM"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["STINKYSTEPS"])),
                      once(PuzzleCompletedSpecific(region, PUZZLES["SLIPKNOT"]))
                ))
            ))
)

achievement(
    title = "Donkey's Delicious Deposit", points = 25, type="", id=653385,
    description = "Collect 600 obtainable Bananas in Jungle Island",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ProgressionFlags[region]["JungleIsland"]["Bananas"]) > 590 &&
                prev(ProgressionFlags[region]["JungleIsland"]["Bananas"]) < 600 &&
                measured(ProgressionFlags[region]["JungleIsland"]["Bananas"] >= 600)
            ))
)

achievement(
    title = "Tiny's Thrilling Trove", points = 25, type="", id=653386,
    description = "Collect 750 obtainable Bananas in Zootopia",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ProgressionFlags[region]["Zootopia"]["Bananas"]) > 740 &&
                prev(ProgressionFlags[region]["Zootopia"]["Bananas"]) < 750 &&
                measured(ProgressionFlags[region]["Zootopia"]["Bananas"] >= 750)
            ))
)

achievement(
    title = "Lanky's Lunar Lunch", points = 25, type="", id=653387,
    description = "Collect 750 obtainable Bananas in Moonhaven",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ProgressionFlags[region]["Moonhaven"]["Bananas"]) > 740 &&
                prev(ProgressionFlags[region]["Moonhaven"]["Bananas"]) < 750 &&
                measured(ProgressionFlags[region]["Moonhaven"]["Bananas"] >= 750)
            ))
)

achievement(
    title = "Diddy's Downtown Delivery", points = 25, type="", id=653388,
    description = "Collect 900 obtainable Bananas in Monkitropolis/Kongri-La",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ProgressionFlags[region]["Monkitropolis"]["Bananas"]) > 890 &&
                prev(ProgressionFlags[region]["Monkitropolis"]["Bananas"]) < 900 &&
                measured(ProgressionFlags[region]["Monkitropolis"]["Bananas"] >= 900)
            ))
)

achievement(
    title = "Full House", points = 5, type="", id=653389,
    description = "Purchase all 17 additional characters",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "characters")) == 16 &&
                measured(PurchaseCount(region, "characters") == 17)
            ))
)

achievement(
    title = "License to Roll", points = 3, type="", id=653390,
    description = "Purchase all 3 additional \"Race\" tracks",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "race")) == 2 &&
                measured(PurchaseCount(region, "race") == 3)
            ))
)

achievement(
    title = "The Whole Bounce Package", points = 3, type="", id=653391,
    description = "Purchase all 3 additional \"Bounce\" modes",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "bounce")) == 2 &&
                measured(PurchaseCount(region, "bounce") == 3)
            ))
)

achievement(
    title = "Three Rings to Rule Them All", points = 3, type="", id=653392,
    description = "Purchase all 3 additional \"Fight\" rings",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "fight")) == 2 &&
                measured(PurchaseCount(region, "fight") == 3)
            ))
)

achievement(
    title = "Aim High, Buy Low", points = 3, type="", id=653393,
    description = "Purchase all 3 additional \"Target\" arenas",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "target")) == 2 &&
                measured(PurchaseCount(region, "target") == 3)
            ))
)

achievement(
    title = "Sale Tag", points = 2, type="", id=653394,
    description = "Purchase the additional \"Tag\" arena",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "tag")) == 0 &&
                PurchaseCount(region, "tag") == 1
            ))
)

achievement(
    title = "Price Breaker", points = 2, type="", id=653395,
    description = "Purchase the additional \"Cannon\" area",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(PurchaseCount(region, "cannon")) == 0 &&
                PurchaseCount(region, "cannon") == 1
            ))
)

achievement(
    title = "Now We're Talking", points = 1, type="", id=653396,
    description = "Learn your first Monkey Chant",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ChantLearnedCount(region)) == 0 &&
                ChantLearnedCount(region) == 1
            ))
)

achievement(
    title = "The Chantastic Six", points = 3, type="", id=653397,
    description = "Learn six Monkey Chants",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ChantLearnedCount(region)) < 6 &&
                ChantLearnedCount(region) >= 6
            ))
)

achievement(
    title = "Master of Chants", points = 5, type="", id=653398,
    description = "Learn every Chant",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                prev(ChantLearnedCount(region)) < 12 &&
                ChantLearnedCount(region) == 12
            ))
)

achievement(
    title = "The SHUFFLE Redemption", points = 5, type="", id=653399,
    description = "Reach the goal in \"SHUFFLE\" in 7 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["SHUFFLE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["SHUFFLE"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 53.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SHUFFLE"]))
            ))
)

achievement(
    title = "CASCADE Me If You Can", points = 5, type="", id=653400,
    description = "Reach the goal in \"CASCADE\" without touching any platform besides the start and the goal platform",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["CASCADE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["CASCADE"]) &&
                // ... or achievement specific condition
                never(
                    PlayerState[region]["Ball"]["y"] < 39.0 &&
                    PlayerState[region]["Ball"]["y"] > -89.0 &&
                    PlayerState[region]["Collision"] == 1
                ) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["CASCADE"]))
            ))
)

achievement(
    title = "The OVERRUN Identity", points = 10, type="", id=653401,
    description = "Reach the goal in \"OVERRUN\" in 17 seconds or less while switching to the other path midways",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["OVERRUN"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["OVERRUN"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 43.0) &&

                trigger_when(
                    // to detect a path switch, the player needs to enter 2 zones
                    once(IsInHorizontalAreaWithZone(region, "OVERRUN1", PUZZLES["OVERRUN"])) &&
                    once(IsInHorizontalAreaWithZone(region, "OVERRUN2", PUZZLES["OVERRUN"])) &&
                    PuzzleCompletedSpecific(region, PUZZLES["OVERRUN"])
                )
            ))
)

achievement(
    title = "The RIPPLE Effect", points = 4, type="", id=654595,
    description = "Reach the goal in \"RIPPLE\" in 5 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["RIPPLE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["RIPPLE"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 55.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["RIPPLE"]))
            ))
)


achievement(
    title = "KNOTing Hill", points = 5, type="", id=653402,
    description = "Reach the goal in \"CELTIC KNOTS\" in 6 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["CELTIC_KNOTS"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["CELTIC_KNOTS"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 54.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["CELTIC_KNOTS"]))
            ))
)

achievement(
    title = "A Series of Unfortunate HAIRPINS", points = 5, type="", id=653403,
    description = "Complete Puzzle level \"HAIRPINS\" in 17 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["HAIRPINS"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["HAIRPINS"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 43.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["HAIRPINS"]))
            ))
)

achievement(
    title = "Forrest FUNRUN", points = 10, type="", id=653404,
    description = "Except for the last cone, reach the goal in \"FUNRUN\" by doing a slalom around the cones starting on the left around the first cone",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["FUNRUN"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["FUNRUN"]) &&
                FunrunSlalomReset(region) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["FUNRUN"]))
            ))
)

achievement(
    title = "CHECKMATE Club", points = 25, type="", id=653414,
    description = "Reach the goal in \"CHECKMATE\" after being on at least 85 of the total 96 squares",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                unless(!InPuzzleLevel(region, PUZZLES["CHECKMATE"])) &&

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["CHECKMATE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedResetContinuous(region) &&
                PuzzleResetOnReady(region) &&
                PuzzleLeftReset(region, PUZZLES["CHECKMATE"]) &&

                // count the visited squares
                measured(tally_of(CHECKMATE_SQUARES, 85,
                    (square) => CheckmateSquareVisited(region, square)),
                    format="percent") &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["CHECKMATE"]))
            ))
)

achievement(
    title = "ZZ STOP: Sleepless in Seattle", points = 4, type="", id=653513,
    description = "Reach the goal in \"ZZ STOP\" in 5 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["ZZSTOP"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["ZZSTOP"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 55.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["ZZSTOP"]))
            ))
)

achievement(
    title = "PLUGHOLE Fiction", points = 4, type="", id=653514,
    description = "Reach the goal in \"PLUGHOLE\" in 4 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["PLUGHOLE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["PLUGHOLE"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 56.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["PLUGHOLE"]))
            ))
)

achievement(
    title = "PITCH Perfect", points = 4, type="", id=653515,
    description = "Reach the goal in \"PITCH AND PUTT\" by being midair while shooting through the goal",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["PITCH_AND_PUTT"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["PITCH_AND_PUTT"]) &&
                // ... or achievement specific condition

                trigger_when(PlayerState[region]["Collision"] == 0 &&
                             PuzzleCompletedSpecific(region, PUZZLES["PITCH_AND_PUTT"])
                )
            ))
)


achievement(
    title = "The Big BOWLski", points = 5, type="", id=653516,
    description = "Reach the goal in \"BOWLS\" in 8 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["BOWLS"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["BOWLS"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 52.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["BOWLS"]))
            ))
)

achievement(
    title = "Karate SKID", points = 10, type="", id=653517,
    description = "Reach the goal in \"SKID SLALOM\" in 30 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["SKID_SLALOM"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["SKID_SLALOM"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 30.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SKID_SLALOM"]))
            ))
)

achievement(
    title = "SMILE Another Day", points = 5, type="", id=653518,
    description = "Reach the goal in \"SMILE\" in 7 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["SMILE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["SMILE"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 53.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SMILE"]))
            ))
)

achievement(
    title = "Once upon a TIPTOE", points = 5, type="", id=653519,
    description = "Reach the goal in \"TIPTOE\" in 8 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["TIPTOE"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["TIPTOE"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 52.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["TIPTOE"]))
            ))
)

achievement(
    title = "BACKFLIP to the Future", points = 3, type="", id=653520,
    description = "Reach the goal in \"BACKFLIP\" in 4 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["BACKFLIP"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["BACKFLIP"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 57.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["BACKFLIP"]))
            ))
)

achievement(
    title = "SLIDERS of the Lost Ark", points = 10, type="", id=653521,
    description = "Reach the goal in \"SLIDER\" in 15 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["SLIDER"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["SLIDER"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 45.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SLIDER"]))
            ))
)


achievement(
    title = "Honey, I Skipped the STINKYSTEPS", points = 4, type="", id=653522,
    description = "Reach the goal in \"STINKYSTEPS\" without touching any platform besides the start and the goal platform",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["STINKYSTEPS"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["STINKYSTEPS"]) &&
                // ... or achievement specific condition
                never(
                    PlayerState[region]["Ball"]["y"] < 0.5 &&
                    PlayerState[region]["Ball"]["y"] > -118.0 &&
                    PlayerState[region]["Collision"] == 1
                ) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["STINKYSTEPS"]))
            ))
)

achievement(
    title = "FLOOR SLIDERS: No Slide Home", points = 5, type="", id=653523,
    description = "Reach the goal in \"FLOOR SLIDERS\" without sliding the floor after stepping onto the first slidable floor until leaving the last slidable floor",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["FLOOR_SLIDERS"])) &&


                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["FLOOR_SLIDERS"]) &&
                // ... or achievement specific condition
                never(
                    PlayerState[region]["Ball"]["x"] > -100.0 &&
                    PlayerState[region]["Ball"]["x"] < 140.0 &&
                    prev(GameState[region]["FloorSliders"]["Platform1Z"]) != GameState[region]["FloorSliders"]["Platform1Z"]
                ) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["FLOOR_SLIDERS"]))
            ))
)

achievement(
    title = "SLIPKNOT: Impossible", points = 5, type="", id=654596,
    description = "Reach the goal in \"SLIPKNOT\" in 7 seconds or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                // checkpoint when entered puzzle
                once(PuzzleStartedSpecific(region, PUZZLES["SLIPKNOT"])) &&

                // reset checkpoint with either general failed state ...
                PuzzleFailedReset(region) &&
                PuzzleLeftReset(region, PUZZLES["SLIPKNOT"]) &&
                // ... or achievement specific condition
                never(GameState[region]["PuzzleRemainingTime"] < 53.0) &&

                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SLIPKNOT"]))
            ))
)

achievement(
    title = "Training Wheels Off", points = 5, type="", id=653524,
    description = "In Challenge mode, complete all \"Beginner\" puzzles",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_CHALLENGE) &&

                PuzzleCompletedSpecific(region, PUZZLES["SIMPLESPLIT"])
            ))
)

achievement(
    title = "Beginner's Luck", points = 10, type="", id=653525,
    description = "In Challenge mode, complete all \"Beginner\" puzzles without losing a life",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                GeneralNotInGameReset(region) && // General not in game reset

                // Checkpoint for start of first level
                once(InMode(region, GAMEMODE_CHALLENGE) &&
                     PuzzleStartedSpecific(region, PUZZLES["CROSSROADS"])) &&

                // Reset condition: losing a life
                PuzzleFailedReset(region) &&

                // trigger condition
                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SIMPLESPLIT"]))
            ))
)

achievement(
    title = "Too Advanced for This", points = 10, type="", id=653526,
    description = "In Challenge mode, complete all \"Advanced\" puzzles",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_CHALLENGE) &&

                PuzzleCompletedSpecific(region, PUZZLES["BREADBASKET"])
            ))
)

achievement(
    title = "Advanced Life Support", points = 25, type="", id=653527,
    description = "In Challenge mode, complete all \"Advanced\" puzzles without losing a life",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                GeneralNotInGameReset(region) && // General not in game reset

                // Checkpoint for start of first level
                once(InMode(region, GAMEMODE_CHALLENGE) &&
                     PuzzleStartedSpecific(region, PUZZLES["BOWLS"])) &&

                // Reset condition: losing a life
                PuzzleFailedReset(region) &&

                // trigger condition
                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["BREADBASKET"]))
            ))
)

achievement(
    title = "Monkey Masterclass", points = 25, type="", id=653528,
    description = "In Challenge mode, complete all \"Expert\" puzzles",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_CHALLENGE) &&

                PuzzleCompletedSpecific(region, PUZZLES["SLIPKNOT"])
            ))
)


achievement(
    title = "No Room for Errors", points = 50, type="", id=653529,
    description = "In Challenge mode, complete all \"Expert\" puzzles without losing a life",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                GeneralNotInGameReset(region) && // General not in game reset

                // Checkpoint for start of first level
                once(InMode(region, GAMEMODE_CHALLENGE) &&
                     PuzzleStartedSpecific(region, PUZZLES["BACKFLIP"])) &&

                // Reset condition
                PuzzleFailedReset(region) &&

                // trigger condition
                trigger_when(PuzzleCompletedSpecific(region, PUZZLES["SLIPKNOT"]))
            ))
)

achievement(
    title = "High Roller", points = 3, type="", id=653530,
    description = "Win a \"Race\" event on \"High Road\" with at least three laps, items on, computer players enabled and only one human player",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_a") &&

                // race mode settings
                MRaceHandicap[region] > 0 &&
                MRaceItems[region] > 0 &&
                MRaceCPU[region] > 0 &&
                MRaceLapCount[region] >= 3 &&

                // game ended as 1st
                prev(GameState[region]["Player1"]["Race"]["RaceEndPosition"]) == 0xffffffff &&
                GameState[region]["Player1"]["Race"]["RaceEndPosition"] == 0x01
            ))
)

achievement(
    title = "Midnight Roller", points = 3, type="", id=653531,
    description = "Win a \"Race\" event on \"Midnight Air\" with at least three laps, items on, computer players enabled and only one human player",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_b") &&

                // race mode settings
                MRaceHandicap[region] > 0 &&
                MRaceItems[region] > 0 &&
                MRaceCPU[region] > 0 &&
                MRaceLapCount[region] >= 3 &&

                // game ended as 1st
                prev(GameState[region]["Player1"]["Race"]["RaceEndPosition"]) == 0xffffffff &&
                GameState[region]["Player1"]["Race"]["RaceEndPosition"] == 0x01
            ))
)

achievement(
    title = "Downward Roller", points = 3, type="", id=653532,
    description = "Win a \"Race\" event on \"Downward Spiral\" with at least three laps, items on, computer players enabled and only one human player",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_c") &&

                // race mode settings
                MRaceHandicap[region] > 0 &&
                MRaceItems[region] > 0 &&
                MRaceCPU[region] > 0 &&
                MRaceLapCount[region] >= 3 &&

                // game ended as 1st
                prev(GameState[region]["Player1"]["Race"]["RaceEndPosition"]) == 0xffffffff &&
                GameState[region]["Player1"]["Race"]["RaceEndPosition"] == 0x01
            ))
)

achievement(
    title = "Tipping Roller", points = 3, type="", id=653533,
    description = "Win a \"Race\" event on \"Tippers N Dippers\" with at least three laps, items on, computer players enabled and only one human player",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_d") &&

                // race mode settings
                MRaceHandicap[region] > 0 &&
                MRaceItems[region] > 0 &&
                MRaceCPU[region] > 0 &&
                MRaceLapCount[region] >= 3 &&

                // game ended as 1st
                prev(GameState[region]["Player1"]["Race"]["RaceEndPosition"]) == 0xffffffff &&
                GameState[region]["Player1"]["Race"]["RaceEndPosition"] == 0x01
            ))
)

achievement(
    title = "This Is Not Mario Kart!", points = 1, type="", id=653554,
    description = "In a \"Race\" event hold four items simultaneously",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check


                (
                    __ornext(prev(GameState[region]["Player1"]["Race"]["Item1"]) == 0xffffffff ||
                    prev(GameState[region]["Player1"]["Race"]["Item2"]) == 0xffffffff ||
                    prev(GameState[region]["Player1"]["Race"]["Item3"]) == 0xffffffff ||
                    prev(GameState[region]["Player1"]["Race"]["Item4"]) == 0xffffffff)
                ) && (
                    GameState[region]["Player1"]["Race"]["Item1"] != 0xffffffff &&
                    GameState[region]["Player1"]["Race"]["Item2"] != 0xffffffff &&
                    GameState[region]["Player1"]["Race"]["Item3"] != 0xffffffff &&
                    GameState[region]["Player1"]["Race"]["Item4"] != 0xffffffff
                )
            ))
)

achievement(
    title = "Highway Star", points = 10, type="", id=653560,
    description = "Complete a \"Time Attack Race\" event on \"High Road\" in 1'12\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GeneralNotInGameReset(region) && // General not in game reset
                TimeTrialReset(region, 72.0) &&

                // Time trial started checkpoint
                once(MRaceMode[region] == RACE_MODE_TIME_TRIAL &&
                     prev(GameState[region]["Player1"]["Race"]["Lap1Time"]) == 0.0 &&
                     GameState[region]["Player1"]["Race"]["Lap1Time"] > 0.0
                ) &&
                
                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_a") &&

                trigger_when(
                    GameState[region]["Player1"]["Race"]["TimeAttackTime"] <= 72.0 &&
                    prev(GameState[region]["ResultScreen"]) == 0x00 &&
                    GameState[region]["ResultScreen"] == 0x01
                )
            ))
)

achievement(
    title = "Midnight Express", points = 10, type="", id=654416,
    description = "Complete a \"Time Attack Race\" event on \"Midnight Air\" in 1'07\"00 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GeneralNotInGameReset(region) && // General not in game reset
                TimeTrialReset(region, 67.0) &&

                // Time trial started checkpoint
                once(MRaceMode[region] == RACE_MODE_TIME_TRIAL &&
                     prev(GameState[region]["Player1"]["Race"]["Lap1Time"]) == 0.0 &&
                     GameState[region]["Player1"]["Race"]["Lap1Time"] > 0.0
                ) &&
                
                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_b") &&

                trigger_when(
                    GameState[region]["Player1"]["Race"]["TimeAttackTime"] <= 67.0 &&
                    prev(GameState[region]["ResultScreen"]) == 0x00 &&
                    GameState[region]["ResultScreen"] == 0x01
                )
            ))
)

achievement(
    title = "Quick Descent", points = 10, type="", id=654417,
    description = "Complete a \"Time Attack Race\" event on \"Downward Spiral\" in 1'16\"50 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GeneralNotInGameReset(region) && // General not in game reset
                TimeTrialReset(region, 76.5) &&

                // Time trial started checkpoint
                once(MRaceMode[region] == RACE_MODE_TIME_TRIAL &&
                     prev(GameState[region]["Player1"]["Race"]["Lap1Time"]) == 0.0 &&
                     GameState[region]["Player1"]["Race"]["Lap1Time"] > 0.0
                ) &&
                
                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_c") &&

                trigger_when(
                    GameState[region]["Player1"]["Race"]["TimeAttackTime"] <= 76.5 &&
                    prev(GameState[region]["ResultScreen"]) == 0x00 &&
                    GameState[region]["ResultScreen"] == 0x01
                )
            ))
)

achievement(
    title = "Tipping the Clock", points = 10, type="", id=654418,
    description = "Complete a \"Time Attack Race\" event on \"Tippers N Dippers\" in 1'31\"50 or less",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GeneralNotInGameReset(region) && // General not in game reset
                TimeTrialReset(region, 91.5) &&

                // Time trial started checkpoint
                once(MRaceMode[region] == RACE_MODE_TIME_TRIAL &&
                     prev(GameState[region]["Player1"]["Race"]["Lap1Time"]) == 0.0 &&
                     GameState[region]["Player1"]["Race"]["Lap1Time"] > 0.0
                ) &&
                
                // check for specific race track
                ascii_string_equals(PlayerState[region]["LevelName6"], "ce\\t") &&
                ascii_string_equals(PlayerState[region]["LevelName8"], "_d") &&

                trigger_when(
                    GameState[region]["Player1"]["Race"]["TimeAttackTime"] <= 91.5 &&
                    prev(GameState[region]["ResultScreen"]) == 0x00 &&
                    GameState[region]["ResultScreen"] == 0x01
                )
            ))
)

achievement(
    title = "Grand Prix", points = 5, type="", id=654419,
    description = "Win a \"Race Grand Prix\" with CPUs on, handicap on, items on, computer players enabled and only one human player",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_RACE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // race mode settings
                MRaceHandicap[region] > 0 &&
                MRaceItems[region] > 0 &&
                MRaceCPU[region] > 0 &&
                MRaceMode[region] == RACE_MODE_GRAND_PRIX &&

                // game ended as 1st
                RaceWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)

achievement(
    title = "Four Grand Landing", points = 10, type="", id=654421,
    description = "Achieve 4000 points or more in a single round of a \"Target\"",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_TARGET) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                GameState[region]["Player1"]["Party"]["RoundScore"] >= 4000 &&
                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01

            ))
)

achievement(
    title = "Target Acquired", points = 10, type="", id=654423,
    description = "Achieve an average of 2500 points per round in \"Target\" with at least 4 rounds",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_TARGET) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MTargetConfRound[region] >= 4 &&

                (GameState[region]["Player1"]["Party"]["TotalScore"] / (MTargetConfRound[region] + 1)) >= 2500 &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01

            ))
)

achievement(
    title = "Fists of Furry", points = 3, type="", id=654424,
    description = "Win a \"Fight\" event with at least 3 rounds",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_FIGHT) &&
                MFightMode[region] == FIGHT_MODE_NORMAL &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                PartyWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)

achievement(
    title = "King of the Ring", points = 10, type="", id=654425,
    description = "Win a \"Fight\" event without a single fallout and at least 3 rounds",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_FIGHT) &&
                MFightMode[region] == FIGHT_MODE_NORMAL &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&
                        
                // checkpoint for start of fight event
                once(
                    MPartyCurrentRound[region] == 0 &&
                    prev(GameState[region]["Player1"]["Fight"]["Active"]) == 0 &&
                    GameState[region]["Player1"]["Fight"]["Active"] == 1
                ) &&
                

                never(!InMode(region, GAMEMODE_FIGHT)) && // either not in mode anymore
                never( // or kicked out
                    prev(GameState[region]["Player1"]["Party"]["Participating"]) == 0x02 &&
                    GameState[region]["Player1"]["Party"]["Participating"] == 0x01
                ) &&

                trigger_when(
                    PartyWinnerPlayer1(region) &&
                    prev(GameState[region]["ResultScreen"]) == 0x00 &&
                    GameState[region]["ResultScreen"] == 0x01
                )
            ))
)

achievement(
    title = "Primate K.O.", points = 5, type="", id=654426,
    description = "Win a \"Survival Fight\" round in under 8 seconds",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // checkpoint for start of survival fight event
                once(
                    InMode(region, GAMEMODE_FIGHT) &&
                    MFightMode[region] == FIGHT_MODE_SURVIVAL &&
                    prev(GameState[region]["Player1"]["Fight"]["SurvivalActive"]) == 0 &&
                    GameState[region]["Player1"]["Fight"]["SurvivalActive"] == 1
                ) &&

                never(GameState[region]["Player1"]["Fight"]["SurvivalActive"] == 0) &&

                // also reset after 8 seconds
                never(tally(TIME_LIMITS[region]["SurvivalFight"], always_true())) && 

                (prev(GameState[region]["Player1"]["Party"]["Participating"]) + 
                prev(GameState[region]["Player2"]["Party"]["Participating"]) + 
                prev(GameState[region]["Player3"]["Party"]["Participating"]) + 
                prev(GameState[region]["Player4"]["Party"]["Participating"])) >= 0x03 &&

                trigger_when(
                    (GameState[region]["Player1"]["Party"]["Participating"] +
                    GameState[region]["Player2"]["Party"]["Participating"] +
                    GameState[region]["Player3"]["Party"]["Participating"] +
                    GameState[region]["Player4"]["Party"]["Participating"]) == 0x02 &&
                    GameState[region]["Player1"]["Party"]["Participating"] == 0x02
                )
            ))
)

achievement(
    title = "The Grand Slam", points = 10, type="", id=654427,
    description = "Win on all four \"Fight\" arenas in one session",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check

                measured(tally(4, 
                    once( // Tree Ring
                        // each has to be done in the correct mode
                        InMode(region, GAMEMODE_FIGHT) &&
                        MFightMode[region] == FIGHT_MODE_NORMAL &&
                        GameState[region]["HumanPlayers"] == 1 && // single player check

                        // check for specific fight arena
                        ascii_string_equals(PlayerState[region]["LevelName6"], "xing") &&
                        ascii_string_equals(PlayerState[region]["LevelName7"], "\\jun") &&


                        // win condition
                        PartyWinnerPlayer1(region) &&
                        prev(GameState[region]["ResultScreen"]) == 0x00 &&
                        GameState[region]["ResultScreen"] == 0x01
                    ),
                    once( // Sky Ring
                        // each has to be done in the correct mode
                        InMode(region, GAMEMODE_FIGHT) &&
                        MFightMode[region] == FIGHT_MODE_NORMAL &&
                        GameState[region]["HumanPlayers"] == 1 && // single player check

                        // check for specific fight arena
                        ascii_string_equals(PlayerState[region]["LevelName6"], "xing") &&
                        ascii_string_equals(PlayerState[region]["LevelName7"], "\\moo") &&


                        // win condition
                        PartyWinnerPlayer1(region) &&
                        prev(GameState[region]["ResultScreen"]) == 0x00 &&
                        GameState[region]["ResultScreen"] == 0x01
                    ),
                    once( // Fat Cat Ring
                        // each has to be done in the correct mode
                        InMode(region, GAMEMODE_FIGHT) &&
                        MFightMode[region] == FIGHT_MODE_NORMAL &&
                        GameState[region]["HumanPlayers"] == 1 && // single player check

                        // check for specific fight arena
                        ascii_string_equals(PlayerState[region]["LevelName6"], "xing") &&
                        ascii_string_equals(PlayerState[region]["LevelName7"], "\\zoo") &&


                        // win condition
                        PartyWinnerPlayer1(region) &&
                        prev(GameState[region]["ResultScreen"]) == 0x00 &&
                        GameState[region]["ResultScreen"] == 0x01
                    ),
                    once( // Rooftop Ring
                        // each has to be done in the correct mode
                        InMode(region, GAMEMODE_FIGHT) &&
                        MFightMode[region] == FIGHT_MODE_NORMAL &&
                        GameState[region]["HumanPlayers"] == 1 && // single player check

                        // check for specific fight arena
                        ascii_string_equals(PlayerState[region]["LevelName6"], "xing") &&
                        ascii_string_equals(PlayerState[region]["LevelName7"], "\\mon") &&


                        // win condition
                        PartyWinnerPlayer1(region) &&
                        prev(GameState[region]["ResultScreen"]) == 0x00 &&
                        GameState[region]["ResultScreen"] == 0x01
                    )
                ))
            ))
)

achievement(
    title = "Bouncing for Gold", points = 3, type="", id=654431,
    description = "Win a \"Bounce\" event with at least 3 rounds",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_BOUNCE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                PartyWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)

achievement(
    title = "Tic Tac Takeover", points = 5, type="", id=654432,
    description = "Win a \"Bounce\" round on \"Tic Tac Toe\" with at least 60 tiles in your colour",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_BOUNCE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific bounce arena
                MBounceBoard[region] == 0x00 &&

                GameState[region]["Player1"]["Bounce"]["TileCount"] >= 60 &&
                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01
            ))
)

achievement(
    title = "Seeing Squares", points = 5, type="", id=654433,
    description = "Win a \"Bounce\" round on \"Checkerboard\" with at least 40 tiles in your colour",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_BOUNCE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific bounce arena
                MBounceBoard[region] == 0x01 &&

                GameState[region]["Player1"]["Bounce"]["TileCount"] >= 40 &&
                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01
            ))
)

achievement(
    title = "Valley of Plenty", points = 5, type="", id=654434,
    description = "Win a \"Bounce\" round on \"Valley\" with at least 70 tiles in your colour",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_BOUNCE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific bounce arena
                MBounceBoard[region] == 0x02 &&

                GameState[region]["Player1"]["Bounce"]["TileCount"] >= 70 &&
                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01
            ))
)

achievement(
    title = "Area 30", points = 5, type="", id=654435,
    description = "Win a \"Bounce\" round on \"Trisquare\" with at least 30 tiles in your colour",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_BOUNCE) &&
                GameState[region]["HumanPlayers"] == 1 && // single player check

                // check for specific bounce arena
                MBounceBoard[region] == 0x03 &&

                GameState[region]["Player1"]["Bounce"]["TileCount"] >= 30 &&
                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01
            ))
)

achievement(
    title = "Balls of Fire", points = 3, type="", id=654584,
    description = "Win a \"Cannon - Top Gun\" match",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_CANNON) &&
                MCannonMode[region] == CANNON_MODE_TOP_GUN &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                PartyWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)

ownscore = {
    US: remembered(GameState[US]["Player1"]["Party"]["RoundScore"]),
    EU: remembered(GameState[EU]["Player1"]["Party"]["RoundScore"]),
}
achievement(
    title = "King of the Castle", points = 10, type="", id=654586,
    description = "Win a \"Cannon - Top Gun\" round with the type \"Keep\" with least 30 points",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_CANNON) &&
                MCannonMode[region] == CANNON_MODE_TOP_GUN &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                // special arena
                GameState[region]["Player1"]["Cannon"]["Castle"] == 0x0c &&


                // reached certain score
                ownscore[region] >= 30 &&

                // have more points than others
                ownscore[region] > GameState[region]["Player2"]["Party"]["RoundScore"] &&
                ownscore[region] > GameState[region]["Player3"]["Party"]["RoundScore"] &&
                ownscore[region] > GameState[region]["Player4"]["Party"]["RoundScore"] &&

                // trigger point
                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01
            ))
)

achievement(
    title = "Last Monkey Standing", points = 3, type="", id=654587,
    description = "Win a \"Cannon - Last Man Standing\" match",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_CANNON) &&
                MCannonMode[region] == CANNON_MODE_LAST_MAN_STANDING &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                PartyWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)

achievement(
    title = "Tower Defense", points = 10, type="", id=654588,
    description = "Win a \"Cannon - Last Man Standing\" round with the type \"Skyscraper\" while having at least 30 points in every fortify scene",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                // checkpoint for start of challenge
                once(
                    InMode(region, GAMEMODE_CANNON) &&
                    MFightMode[region] == CANNON_MODE_LAST_MAN_STANDING &&
                    prev(GameState[region]["Player1"]["Cannon"]["Active"]) == 0 &&
                    GameState[region]["Player1"]["Cannon"]["Active"] == 1
                ) &&

                never(
                    MCannonFortifyCycleCounter[region] > 0 &&
                    GameState[region]["Player1"]["Cannon"]["Score"] < 30 &&
                    prev(GameState[region]["Player1"]["Cannon"]["Phase"]) == CANNON_PHASE_FORTIFY &&
                    GameState[region]["Player1"]["Cannon"]["Phase"] == CANNON_PHASE_COUNTDOWN
                ) &&

                never(GameState[region]["Player1"]["Cannon"]["Active"] == 0) &&

                trigger_when(
                    GameState[region]["Player1"]["Party"]["RoundScore"] == 0x0a && // having 10 points means that player1 won the round
                    prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                    GameState[region]["RoundResultScreen"] == 0x01
                )
            ))
)


achievement(
    title = "Inflated Victory", points = 3, type="", id=654592,
    description = "Win a \"Tag - Balloon Bump\" match",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_TAG) &&
                MTagMode[region] == TAG_MODE_BALLOON_BUMP &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                PartyWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)

achievement(
    title = "Pumped Up Points", points = 10, type="", id=654593,
    description = "Win a \"Tag - Balloon Bump\" round with at least 10000 points",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_TAG) &&
                MTagMode[region] == TAG_MODE_BALLOON_BUMP &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                // reached certain score
                ownscore[region] >= 10000 &&

                // have more points than others
                ownscore[region] > GameState[region]["Player2"]["Party"]["RoundScore"] &&
                ownscore[region] > GameState[region]["Player3"]["Party"]["RoundScore"] &&
                ownscore[region] > GameState[region]["Player4"]["Party"]["RoundScore"] &&

                prev(GameState[region]["RoundResultScreen"]) == 0x00 &&
                GameState[region]["RoundResultScreen"] == 0x01
            ))
)

achievement(
    title = "Grand Theft Balloon", points = 3, type="", id=654594,
    description = "Win a \"Tag - Balloon Burglar\" match",
    trigger = any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) && // General ingame check
                InMode(region, GAMEMODE_TAG) &&
                MTagMode[region] == TAG_MODE_BURGLAR &&
                GameState[region]["HumanPlayers"] == 1 && // single player check
                MPartyConfRound[region] >= 2 &&

                PartyWinnerPlayer1(region) &&
                prev(GameState[region]["ResultScreen"]) == 0x00 &&
                GameState[region]["ResultScreen"] == 0x01
            ))
)


// ============= LEADERBOARDS ==============


LB_TASK_LIST = [
    // Quest name | Progression Lookup World | Progression Lookup | Quest ID | Zone | ID

    // Jungle Island
    ["Find the Daughter", "JungleIsland", "FindDaughter", QUESTID_JUNGLE_FIND_DAUGHTER, "vill", 179721],
    ["Get Rid of the Plants", "JungleIsland", "GetRidOfPlants", QUESTID_JUNGLE_GET_RID_OF_PLANTS, "vill", 179759],
    ["Take the Village Photo", "JungleIsland", "Photo_Village", QUESTID_TAKE_PHOTO, "vill", 179760],
    ["Return the Bees", "JungleIsland", "ReturnBees", QUESTID_JUNGLE_RETURN_BEES, "vill", 179761],
    ["Deliver the Message Balloon to Dada", "JungleIsland", "DeliverMessage", QUESTID_BALLOON_DELIVERY, "vill", 179762],

    ["Open the Path to the Palace with Wind", "JungleIsland", "WindPathToPalace", QUESTID_JUNGLE_WIND, "jipa", 179763],

    ["Chase Away the Birds", "JungleIsland", "ChaseAwayBirds", QUESTID_JUNGLE_CHASE_BIRDS, "pale", 179764],
    ["Wake the Guards", "JungleIsland", "WakeTheGuards", QUESTID_JUNGLE_WAKE_GUARDS, "pale", 179765],
    ["Take the Palace Exterior Photo", "JungleIsland", "Photo_Palace", QUESTID_TAKE_PHOTO, "pale", 179766],

    ["Find the Prince and Princess", "JungleIsland", "IdentifyPrince", QUESTID_JUNGLE_PRINCE_AND_PRINCESS, "pali", 179767],
    ["Ring the Bells", "JungleIsland", "RingTheBells", QUESTID_JUNGLE_RING_BELLS, "pali", 179768],

    ["Relight the Lighthouse", "JungleIsland", "RelightLighthouse", QUESTID_JUNGLE_RELIGHT_LIGHTHOUSE, "beac", 179769],
    ["Take the Distant Islands Photo", "JungleIsland", "Photo_Island", QUESTID_TAKE_PHOTO, "beac", 179770],
    ["Hatch and Deliver the Organet Chicks", "JungleIsland", "HatchChicks", QUESTID_JUNGLE_HATCH_CHICKS, "beac", 179771],
    ["Deliver the Lunch Balloon", "JungleIsland", "DeliverLunch", QUESTID_JUNGLE_DELIVER_LUNCH, "beac", 179772],

    // Moonhaven
    ["Oil the Great Gears", "Moonhaven", "OilGreatGears", QUESTID_MOONHAVEN_OIL_GREAT_GEARS, "arvl", 179773],
    ["Pick Up the Banana Skins", "Moonhaven", "PickUpBananaSkins", QUESTID_MOONHAVEN_PICK_UP_BANANA_SKINS, "arvl", 179774],
    ["Timed Switches", "Moonhaven", "TimedSwitches", QUESTID_MOONHAVEN_TIMED_SWITCHES, "arvl", 179775],
    ["Little'uns on Levers", "Moonhaven", "Levers", QUESTID_MOONHAVEN_LITTLE_UN_LEVERS, "arvl", 179776],

    ["Rescue the Children from the Wind Pipes", "Moonhaven", "RescueChildren", QUESTID_MOONHAVEN_RESCUE_CHILDREN, "aira", 179777],
    ["Align the Air Automaton Horns", "Moonhaven", "AlignHorns", QUESTID_MOONHAVEN_ALIGN_AIR_HORNS, "aira", 179778],
    ["Take the Air Automaton Photo", "Moonhaven", "Photo_Automaton", QUESTID_TAKE_PHOTO, "aira", 179779],
    ["Patch the Air Automaton Bowl Leaks", "Moonhaven", "PatchLeaks", QUESTID_MOONHAVEN_PATCH_AIR_AUTOMATON, "aira", 179780],

    ["Find the Toolbox", "Moonhaven", "FindToolbox", QUESTID_MOONHAVEN_FIND_TOOLBOX, "undr", 179781],
    ["Feed the Fire Automaton", "Moonhaven", "FeedFireAutomaton", QUESTID_MOONHAVEN_FEED_FIRE_AUTOMATON, "undr", 179782],
    ["Relight the Fire Automaton", "Moonhaven", "RelightFireAutomaton", QUESTID_MOONHAVEN_RELIGHT_FIRE_AUTOMATON, "undr", 179783],
    ["Collect the Five Red Balloons", "Moonhaven", "FiveBalloons", QUESTID_MOONHAVEN_FIVE_RED_BALLOONS, "undr", 179784],
    ["Deliver the Message Balloon to the Tall Red Monkey in Moonhaven", "Moonhaven", "DeliverBalloon", QUESTID_BALLOON_DELIVERY, "undr", 179785],

    ["Thaw the Frozen Pumps", "Moonhaven", "FrozenPumps", QUESTID_MOONHAVEN_FROZEN_PUMPS, "watr", 179786],

    // Zootopia
    ["Rescue the Dunk-Tank Visitors", "Zootopia", "StealthAndDucks", QUESTID_ZOOTOPIA_STEALTH_DUCKS, "main", 179787],
    ["Test of Strength", "Zootopia", "StrengthTest", QUESTID_ZOOTOPIA_STRENGTH_TEST, "main", 179788],
    ["Assist the Magic Show", "Zootopia", "MagicShow", QUESTID_ZOOTOPIA_MAGIC_SHOW, "main", 179789],
    ["Free the Fat Cat Mascots", "Zootopia", "FreeFatCatMascots", QUESTID_ZOOTOPIA_FREE_FAT_CAT_MASCOTS, "main", 179790],

    ["Stop the Out-of-Control Coaster", "Zootopia", "CoasterOutOfControl", QUESTID_ZOOTOPIA_STOP_COASTER, "rc01", 179791],
    ["Remote Ball Race", "Zootopia", "RemoteBallRace", QUESTID_ZOOTOPIA_REMOTE_BALL_RACE, "rc01", 179792],
    ["Rescue the Eight Balloon Students", "Zootopia", "RescueStudents", QUESTID_ZOOTOPIA_RESCUE_BALLOON_STUDENTS, "rc01", 179793],
    ["Take the Roller Coaster Photo", "Zootopia", "Photo_Coaster", QUESTID_TAKE_PHOTO, "rc01", 179794],

    ["Bumper Car Action", "Zootopia", "BumperCar", QUESTID_ZOOTOPIA_BUMPER_CAR_ACTION, "zt_m", 179795],
    ["Park Cleanup", "Zootopia", "ParkCleanup", QUESTID_ZOOTOPIA_PARK_CLEANUP, "zt_m", 179796],
    ["Take the Hedge Maze Photo", "Zootopia", "Photo_Hedge", QUESTID_TAKE_PHOTO, "zt_m", 179797],
    ["Deliver the Message Balloon to Sumsum", "Zootopia", "DeliverMessage", QUESTID_BALLOON_DELIVERY, "zt_m", 179798],
    ["Collect the Eight Cat Balloons", "Zootopia", "EightCatBalloons", QUESTID_ZOOTOPIA_EIGHT_CAT_BALLOONS, "zt_m", 179799],

    ["Shutdown Puzzle", "Zootopia", "ShutdownPuzzle", QUESTID_ZOOTOPIA_SHUTDOWN_PUZZLE, "fatc", 179800],

    // Monkitropolis
    ["Capture the Four Monsters", "Monkitropolis", "CaptureMonsters", QUESTID_MONKITROPOLIS_CATCH_MONSTERS, "mk_p", 179801],
    ["Unblock the Sound Pipes", "Monkitropolis", "UnblockPipes", QUESTID_MONKITROPOLIS_UNBLOCK_SOUND_PIPES, "mk_p", 179802],
    ["Take the Police Station Photo", "Monkitropolis", "Photo_Police", QUESTID_TAKE_PHOTO, "mk_p", 179803],
    ["Unmask the Monsters", "Monkitropolis", "UnmaskMonsters", QUESTID_MONKITROPOLIS_UNMASK_MONSTERS, "mk_p", 179804],

    ["Realign the Noise Factory Pipes", "Monkitropolis", "RealignPipes", QUESTID_MONKITROPOLIS_REALIGN_NOISE_PIPES, "mk_r", 179805],
    ["Undercover Raceway Challenge", "Monkitropolis", "RacewayChallenge", QUESTID_MONKITROPOLIS_UNDERCOVER_RACEWAY, "mk_r", 179806],
    ["Stop the Robochimps Cutting the Sun Loose", "Monkitropolis", "StopRobochimpsCutting", QUESTID_MONKITROPOLIS_STOP_ROBOCHIMPS, "mk_r", 179807],
    ["Deliver the Message Balloon to the Factory Worker", "Monkitropolis", "DeliverMessageFactory", QUESTID_BALLOON_DELIVERY, "mk_r", 179808],
    ["Raceway Paper Cleanup", "Monkitropolis", "RacewayCleanup", QUESTID_MONKITROPOLIS_RACEWAY_CLEANUP, "mk_r", 179809],

    // Kongri-la
    ["Stop the Metal Monkeys Stealing Bananas", "Monkitropolis", "StopMetalMonkeys", QUESTID_KONGRILA_STOP_METAL_MONKEYS, "mk_k", 179810],
    ["Land Seven Robochimps on the Islands", "Monkitropolis", "ShootRobochimps", QUESTID_MONKITROPOLIS_ROBOCHIMP, "mk_k", 179811],
    ["Turn the Screaming Towers Away", "Monkitropolis", "TurnTowers", QUESTID_KONGRILA_TURN_SCREAMING_TOWERS, "mk_k", 179812],
    ["Water the Banana Trees", "Monkitropolis", "WaterTrees", QUESTID_KONGRILA_WATER_BANANA_TREES, "mk_k", 179813],

    ["Realign the Sunlight Lenses", "Monkitropolis", "RealignLenses", QUESTID_KONGRILA_REALIGN_SUNLIGHT_LENSES, "mk_k", 179814],
    ["Drag the Crabs to the Suction Pipe", "Monkitropolis", "DragCrabs", QUESTID_KONGRILA_DRAG_CRABS, "mk_k", 179815],
    ["Deliver the Message Balloon to the Tall Red Monkey in Kongri-la", "Monkitropolis", "DeliverMessageRedMonkey", QUESTID_BALLOON_DELIVERY, "mk_k", 179816],

    ["Patch the Underwater Tunnel Leaks", "Monkitropolis", "PatchLeaks", QUESTID_KONGRILA_PATCH_TUNNEL_LEAKS, "mk_k", 179817],
    ["Take the Kongri-la Photo", "Monkitropolis", "Photo_Kongrila", QUESTID_TAKE_PHOTO, "mk_k", 179818],
]

for lb_task in LB_TASK_LIST {

    leaderboard(
        title = "Task \"" + lb_task[0] + "\" - Fastest completion time",
        description = "Complete " + lb_task[0] + " as quickly as possible",
        id = lb_task[5],
        start =
            any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) &&
                InMode(region, GAMEMODE_STORY) &&

                ascii_string_equals(PlayerState[region]["LevelName5"], lb_task[4]) &&
                PlayerState[region]["ActiveQuestPtr"] != 0 &&
                PlayerState[region]["ActiveQuest"] == lb_task[3] &&
                ProgressionFlags[region][lb_task[1]][lb_task[2]] == 0 &&
                prev(ProgressionFlags[region]["Active"]["TaskActive"]) == 0 &&
                ProgressionFlags[region]["Active"]["TaskActive"] == 1
            )),
        cancel =
            any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                __ornext(!InGame(region) ||
                !InMode(region, GAMEMODE_STORY) ||
                ProgressionFlags[region]["Active"]["TaskActive"] == 0) &&
                ProgressionFlags[region][lb_task[1]][lb_task[2]] == 0
            )),
        submit =
            any_of(Regions, region => (
                PauseWrongRegion(region) && // Pause this alt for wrong region
                InGame(region) &&
                InMode(region, GAMEMODE_STORY) &&
                prev(ProgressionFlags[region][lb_task[1]][lb_task[2]]) == 0 &&
                ProgressionFlags[region][lb_task[1]][lb_task[2]] != 0
            )),
        value = max_of(
                measured(tally(0, !PauseMenuOpen(US)), when=IsRegion(US)),
                measured(tally(0, !PauseMenuOpen(EU), !PauseMenuOpen(EU) && MFrameCounter[EU] % 5 == 0), when=IsRegion(EU))
            ),
        format = "FRAMES",
        lower_is_better = true
    )
}

// ============= RICH_PRESENCE =============

CharacterNames = {
    0: "AiAi",
    1: "MeeMee",
    2: "Baby",
    3: "GonGon",
    4: "Future AiAi",
    5: "Prince AbeABE",
    6: "Ale'Wat",
    7: "Si'mian",
    8: "Ch'Chi",
    9: "Princess Dee-Dee",
    10: "Queen Jenjen",
    11: "Jeck-Jeck",
    12: "Ma d'Kee",
    13: "Mee'Nee",
    14: "Mermer",
    15: "Paipai",
    16: "Papa",
    17: "Po d'Pow",
    18: "Sisi",
    19: "Sumsum",
    20: "Toktok"
}

RpCharacter = {
    US: rich_presence_lookup("STORY_CHARACTER", GameState[US]["Character"], CharacterNames, "Unknown"),
    EU: rich_presence_lookup("STORY_CHARACTER", GameState[EU]["Character"], CharacterNames, "Unknown"),
}


// ==== BOUNCE ====

BounceBoards = {
    0: "Tic Tac Toe",
    1: "Checkerboard",
    2: "Valley",
    3: "Trisquare"
}

RpBounceBoard = {
    US: rich_presence_lookup("BOUNCE_BOARD", MBounceBoard[US], BounceBoards, "Unknown board"),
    EU: rich_presence_lookup("BOUNCE_BOARD", MBounceBoard[EU], BounceBoards, "Unknown board"),
}

for region in Regions {
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_BOUNCE) &&
        GameState[region]["Player1"]["PartyPtr"] != 0,
        RegionFlags[region] + " | 🟦 | {0} playing Monkey Bounce - {1} - {2} points",
        RpCharacter[region], RpBounceBoard[region],
        rich_presence_value("PARTY_POINTS", GameState[region]["Player1"]["Party"]["RoundScore"])
    )
}


// ==== FIGHT ====

FightLevelNameLookup = {
    "ls\\partygames\\boxing\\jungleisland\\boxarena": "Tree Ring",
    "ls\\partygames\\boxing\\moonhaven\\boxarena": "Sky Ring",
    "ls\\partygames\\boxing\\zootopia\\boxarena": "Fat Cat Ring",
    "ls\\partygames\\boxing\\monkitropolis\\boxingmt": "Rooftop Ring",
}

RpFightLevel = {
    US: rich_presence_ascii_string_lookup("FIGHT_LEVEL", PlayerState[US]["LevelName"], FightLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("FIGHT_LEVEL", PlayerState[EU]["LevelName"], FightLevelNameLookup),
}

for region in Regions {
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_FIGHT) &&
        GameState[region]["Player1"]["PartyPtr"] != 0 && MFightMode[region] == 0,
        RegionFlags[region] + " | 🥊 | {0} playing Monkey Fight - Normal - {1} - {2} points - Round {3}/{4}",
        RpCharacter[region], RpFightLevel[region],
        rich_presence_value("PARTY_POINTS", GameState[region]["Player1"]["Party"]["RoundScore"]),
        rich_presence_value("FIGHT_ROUND", MPartyCurrentRound[region] + 1),
        rich_presence_value("FIGHT_ROUNDS", MPartyConfRound[region])
    )

    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_FIGHT) &&
        MFightMode[region] == 1,
        RegionFlags[region] + " | 🥊 | {0} playing Monkey Fight - Survival - {1}",
        RpCharacter[region], RpFightLevel[region]
    )
}

// ==== TARGET ====

TargetLevelNameLookup = {
    "ls\\partygames\\glide\\glide3": "Ridge Back Glide",
    "ls\\partygames\\glide\\glide_a": "Horseshoe Canyon",
    "ls\\partygames\\glide\\glide2": "Lone Tree Glide",
    "ls\\partygames\\glide\\glide1": "Waterfall Canyon",
}

RpTargetLevel = {
    US: rich_presence_ascii_string_lookup("TARGET_LEVEL", PlayerState[US]["LevelName"], TargetLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("TARGET_LEVEL", PlayerState[EU]["LevelName"], TargetLevelNameLookup),
}

for region in Regions {
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_TARGET) &&
        GameState[region]["Player1"]["PartyPtr"] != 0 && GameState[region]["Player1"]["Target"]["Ptr"] != 0,
        RegionFlags[region] + " | 🎯 | {0} playing Monkey Target - {1} - {2} points - Round {3}/{4}",
        RpCharacter[region], RpTargetLevel[region],
        rich_presence_value("TARGET_POINTS", GameState[region]["Player1"]["Target"]["Score"]),
        rich_presence_value("TARGET_THROW", MTargetCurrentRound[region] + 1),
        rich_presence_value("TARGET_THROWS", MTargetConfRound[region] + 1)
    )
}
// ==== RACE ====

RaceLevelNameLookup = {
    "ls\\partygames\\race\\track_a": "High Road",
    "ls\\partygames\\race\\track_am": "High Road",
    "ls\\partygames\\race\\track_b": "Midnight Air",
    "ls\\partygames\\race\\track_bm": "Midnight Air",
    "ls\\partygames\\race\\track_c": "Downward Spiral",
    "ls\\partygames\\race\\track_cm": "Downward Spiral",
    "ls\\partygames\\race\\track_d": "Tippers N Dippers",
    "ls\\partygames\\race\\track_dm": "Tippers N Dippers",
}

RpRaceLevel = {
    US: rich_presence_ascii_string_lookup("RACE_LEVEL", PlayerState[US]["LevelName"], RaceLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("RACE_LEVEL", PlayerState[EU]["LevelName"], RaceLevelNameLookup),
}
RacePositions = {
    1: "1st", 2: "2nd", 3: "3rd", 4: "4th",
    5: "5th", 6: "6th", 7: "7th", 8: "8th"
}

RpRacePosition = {
    US: rich_presence_lookup("RACE_POSITION", GameState[US]["Player1"]["Race"]["CurrentPosition"], RacePositions, "Unknown position"),
    EU: rich_presence_lookup("RACE_POSITION", GameState[EU]["Player1"]["Race"]["CurrentPosition"], RacePositions, "Unknown position"),
}

RpRaceFinish = {
    US: rich_presence_lookup("RACE_POSITION", GameState[US]["Player1"]["Race"]["RaceEndPosition"], RacePositions, "Unknown position"),
    EU: rich_presence_lookup("RACE_POSITION", GameState[EU]["Player1"]["Race"]["RaceEndPosition"], RacePositions, "Unknown position"),
}

RaceModeLabels = {
    RACE_MODE_SINGLE: "Single Race",
    RACE_MODE_GRAND_PRIX: "Grand Prix"
}

for region in Regions {
    for raceMode in [RACE_MODE_SINGLE, RACE_MODE_GRAND_PRIX] {
        raceLabel = RaceModeLabels[raceMode]

        rich_presence_conditional_display(
            IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_RACE) &&
            MRaceMode[region] == raceMode && GameState[region]["Player1"]["PartyPtr"] != 0 && GameState[region]["Player1"]["Race"]["Ptr"] != 0 &&
            GameState[region]["Player1"]["Race"]["Phase"] == 2,
            RegionFlags[region] + " | 🏁 | {0} playing Monkey Race - " + raceLabel + " - {1} - {2} - Lap {3}/{4}",
            RpCharacter[region], RpRaceLevel[region], RpRacePosition[region],
            rich_presence_value("RACE_LAP", GameState[region]["Player1"]["Race"]["CurrentLap"]),
            rich_presence_value("RACE_LAPS", MRaceLapCount[region])
        )
        rich_presence_conditional_display(
            IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_RACE) &&
            MRaceMode[region] == raceMode && GameState[region]["Player1"]["PartyPtr"] != 0 && GameState[region]["Player1"]["Race"]["Ptr"] != 0 &&
            GameState[region]["Player1"]["Race"]["Phase"] == 6,
            RegionFlags[region] + " | 🏁 | {0} playing Monkey Race - " + raceLabel + " - {1} - Result: {2}",
            RpCharacter[region], RpRaceLevel[region], RpRaceFinish[region]
        )
    }

    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_RACE) &&
        MRaceMode[region] == RACE_MODE_TIME_TRIAL && GameState[region]["Player1"]["PartyPtr"] != 0 && GameState[region]["Player1"]["Race"]["Ptr"] != 0 &&
        GameState[region]["Player1"]["Race"]["Phase"] == 2,
        RegionFlags[region] + " | ⏱️ | {0} playing Monkey Race - Time Attack - {1} - Lap {2}/{3}",
        RpCharacter[region], RpRaceLevel[region],
        rich_presence_value("RACE_LAP", GameState[region]["Player1"]["Race"]["CurrentLap"]),
        rich_presence_value("RACE_LAPS", MRaceLapCount[region])
    )
}


// ==== CANNON ====

CannonCastles = {
    0: "Classic", 1: "Triple", 2: "Thin Square", 3: "Notch",
    4: "Skyscraper", 5: "Six Pack", 6: "Fort AiAi", 7: "Five Star",
    8: "Zig Zag", 9: "Rocket", 10: "Silly", 11: "Monkey Paw",
    12: "Keep", 13: "Club Sandwich", 14: "Fort GonGon"
}

RpCannonCastle = {
    US: rich_presence_lookup("CANNON_CASTLE", GameState[US]["Player1"]["Cannon"]["Castle"], CannonCastles, "Unknown castle"),
    EU: rich_presence_lookup("CANNON_CASTLE", GameState[EU]["Player1"]["Cannon"]["Castle"], CannonCastles, "Unknown castle"),
}

for region in Regions {
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_CANNON) &&
        GameState[region]["Player1"]["PartyPtr"] != 0 && GameState[region]["Player1"]["Cannon"]["Ptr"] != 0 &&
        GameState[region]["Player1"]["Cannon"]["Active"] == 1,
        RegionFlags[region] + " | 🏰 | {0} playing Monkey Cannon - {1} - {2} points",
        RpCharacter[region], RpCannonCastle[region],
        rich_presence_value("CANNON_POINTS", GameState[region]["Player1"]["Cannon"]["Score"])
    )
}

// ==== TAG ====

for region in Regions {
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_TAG) &&
        MTagMode[region] == 2 && MTagPhase[region] == 3 &&
        GameState[region]["Player1"]["PartyPtr"] != 0 && GameState[region]["Player1"]["Tag"]["Ptr"] != 0,
        RegionFlags[region] + " | 🎈 | {0} playing Monkey Tag - Balloon Bump - {1} points",
        RpCharacter[region],
        rich_presence_value("TAG_POINTS", GameState[region]["Player1"]["Tag"]["Score"])
    )
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) && InMode(region, GAMEMODE_TAG) &&
        MTagMode[region] == 1,
        RegionFlags[region] + " | 🎈 | {0} playing Monkey Tag - Balloon Burglar",
        RpCharacter[region]
    )
}


// ==== CHALLENGE ====

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


RpPuzzleLevel = {
    US: rich_presence_ascii_string_lookup("PUZZLE_LEVEL", PlayerState[US]["LevelName"], PuzzleLevelNameLookup),
    EU: rich_presence_ascii_string_lookup("PUZZLE_LEVEL", PlayerState[EU]["LevelName"], PuzzleLevelNameLookup),
}

ChallengeDifficultyNames = {
    0: "Beginner",
    1: "Advanced",
    2: "Expert"
}

RpChallengeDifficulty = {
    US: rich_presence_lookup("CHALLENGE_DIFFICULTY", GameState[US]["ChallengeMode"]["SelectedDifficulty"], ChallengeDifficultyNames, "Unknown difficulty"),
    EU: rich_presence_lookup("CHALLENGE_DIFFICULTY", GameState[EU]["ChallengeMode"]["SelectedDifficulty"], ChallengeDifficultyNames, "Unknown difficulty"),
}


function ChallengeStatsAvailable(region) =>
    ptr(MGameState[region], [0xC0, 0xC68], bit0) == 1 &&
    MProgressionState[region] != 0

for region in Regions {
    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) &&
        InMode(region, GAMEMODE_CHALLENGE) && InPuzzle(region) &&
        ChallengeStatsAvailable(region),
        RegionFlags[region] + " | 🏆 | {0} playing Challenge Mode - {1} - {2} | 🍌 {3} | Score: {4}",
        RpCharacter[region], RpChallengeDifficulty[region], RpPuzzleLevel[region],
        rich_presence_value("CHALLENGE_BANANAS", ProgressionFlags[region]["Active"]["BananaCount"]),
        rich_presence_value("CHALLENGE_SCORE", GameState[region]["ChallengeMode"]["Score"])
    )

    rich_presence_conditional_display(
        IsRegion(region) && InGame(region) &&
        InMode(region, GAMEMODE_CHALLENGE) && ChallengeStatsAvailable(region),
        RegionFlags[region] + " | 🏆 | {0} playing Challenge Mode - {1} | 🍌 {2} | Score: {3}",
        RpCharacter[region], RpChallengeDifficulty[region],
        rich_presence_value("CHALLENGE_BANANAS", ProgressionFlags[region]["Active"]["BananaCount"]),
        rich_presence_value("CHALLENGE_SCORE", GameState[region]["ChallengeMode"]["Score"])
    )
}


// ==== STORY ====


StoryWorlds = {
    US: {
        "Jungle": {
            "Name": "Jungle Island",
            "Maximum": 600,
            "Bananas": ProgressionFlags[US]["JungleIsland"]["Bananas"]
        },
        "Moonhaven": {
            "Name": "Moonhaven",
            "Maximum": 750,
            "Bananas": ProgressionFlags[US]["Moonhaven"]["Bananas"]
        },
        "Zootopia": {
            "Name": "Zootopia",
            "Maximum": 750,
            "Bananas": ProgressionFlags[US]["Zootopia"]["Bananas"]
        },
        "Monkitropolis": {
            "Name": "Monkitropolis/Kongri-La",
            "Maximum": 900,
            "Bananas": ProgressionFlags[US]["Monkitropolis"]["Bananas"]
        }
    },
    EU: {
        "Jungle": {
            "Name": "Jungle Island",
            "Maximum": 600,
            "Bananas": ProgressionFlags[EU]["JungleIsland"]["Bananas"]
        },
        "Moonhaven": {
            "Name": "Moonhaven",
            "Maximum": 750,
            "Bananas": ProgressionFlags[EU]["Moonhaven"]["Bananas"]
        },
        "Zootopia": {
            "Name": "Zootopia",
            "Maximum": 750,
            "Bananas": ProgressionFlags[EU]["Zootopia"]["Bananas"]
        },
        "Monkitropolis": {
            "Name": "Monkitropolis/Kongri-La",
            "Maximum": 900,
            "Bananas": ProgressionFlags[EU]["Monkitropolis"]["Bananas"]
        }
    },
}

// Thanks Souzooka for finding the level names!
StoryZones = {
    "Jungle": {
        "ls\\jungisle\\village": "Village",
        "ls\\jungisle\\jipath": "Path to Palace",
        "ls\\jungisle\\palext": "Palace Exterior",
        "ls\\jungisle\\pallock": "Palace Lock",
        "ls\\jungisle\\palint": "Palace Interior",
        "ls\\jungisle\\chamber": "Palace Exterior <-> Distant Islands",
        "ls\\jungisle\\beach": "Distant Islands",
        "ls\\jungisle\\gateway": "Village <-> Distant Islands",
        "ls\\jungisle\\jimount": "Mountain Junction",
    },
    "Moonhaven": {
        "ls\\newhave\\arvlpark": "Arrival Park",
        "ls\\newhave\\coglock": "Arrival Park <-> Air Automaton",
        "ls\\newhave\\airauto": "Air Automaton",
        "ls\\newhave\\tmbllock": "Air Automaton <-> Undercity",
        "ls\\newhave\\undrcity": "Undercity",
        "ls\\newhave\\liftlock": "Undercity <-> Water Automaton",
        "ls\\newhave\\watrpark": "Water Automaton",
        "ls\\newhave\\locklock": "Arrival Park <-> Water Automaton",
    },
    "Zootopia": {
        "ls\\zootopib\\mainst": "Main Street",
        "ls\\zootopib\\zt_link": "Main Street <-> Hedge Maze",
        "ls\\zootopib\\zt_maze": "Hedge Maze",
        "ls\\zootopib\\z_al1": "Main Street <-> Roller Coaster",
        "ls\\zootopib\\z_al2": "Roller Coaster <-> Fat Cat's Tower",
        "ls\\zootopib\\z_al3": "Hedge Maze <-> Fat Cat's Tower",
        "ls\\zootopib\\rc01": "Roller Coaster",
        "ls\\zootopib\\fatcat": "Fat Cat's Tower",
    },
    "Monkitropolis": {
        "ls\\monktrop\\mk_pol": "Police Station",
        "ls\\monktrop\\mk_race": "Raceway",
        "ls\\monktrop\\link": "Police Station <-> Raceway",
        "ls\\monktrop\\tlink": "",
        "ls\\monktrop\\throne": "Throne Room",
        "ls\\monktrop\\mk_kong": "Kongri-La ",
        "ls\\monktrop\\mk_lift": "Lift",
        "ls\\monktrop\\mk_dlink": "Underwater Junction",
        "ls\\monktrop\\d_link2": "Lower Tunnels <-> Throne Room",
    },
}

StoryWorldCodes = {
    "Jungle": "ungi",
    "Moonhaven": "ewha",
    "Zootopia": "ooto",
    "Monkitropolis": "onkt",
}

KongriLaVariants = {
    0x00676E6F: "Atoll",
    0x31676E6F: "Underwater City",
    0x32676E6F: "Lower Tunnels",
}

ThroneLinkVariants = {
    0x006B6E69: "Palace Elevator",
    0x316B6E69: "Throne Room <-> Kongri-La",
    0x326B6E69: "Raceway <-> Throne Room",
}


for region in Regions {
    for worldKey in ["Jungle", "Moonhaven", "Zootopia", "Monkitropolis"] {
        world = StoryWorlds[region][worldKey]
        zoneName = rich_presence_ascii_string_lookup(
            "STORY_ZONE_" + worldKey,
            PlayerState[region]["LevelName"],
            StoryZones[worldKey],
            "Unknown zone"
        )

        if worldKey == "Monkitropolis" {
            kongVariant = rich_presence_lookup(
                "KONG_VARIANT",
                dword(PlayerState[region]["LevelName6"]),
                KongriLaVariants,
                ""
            )

            throneVariant = rich_presence_lookup(
                "THRONE_VARIANT",
                dword(PlayerState[region]["LevelName5"] + 2),
                ThroneLinkVariants,
                ""
            )

            rich_presence_conditional_display(
                IsRegion(region) &&
                InGame(region) &&
                InMode(region, GAMEMODE_STORY) &&
                InWorld(region, StoryWorldCodes[worldKey]),
                RegionFlags[region] + " | 🗺️ | {0} is in " + world["Name"] +
                    " - {2}{3}{4} | 🍌 {1}/" + format("{0}", world["Maximum"]),
                RpCharacter[region],
                rich_presence_value("WORLD_BANANAS", world["Bananas"]),
                zoneName,
                kongVariant,
                throneVariant
            )
        } else {
            rich_presence_conditional_display(
                IsRegion(region) &&
                InGame(region) &&
                InMode(region, GAMEMODE_STORY) &&
                InWorld(region, StoryWorldCodes[worldKey]),
                RegionFlags[region] + " | 🗺️ | {0} is in " + world["Name"] +
                    " - {2} | 🍌 {1}/" + format("{0}", world["Maximum"]),
                RpCharacter[region],
                rich_presence_value("WORLD_BANANAS", world["Bananas"]),
                zoneName
            )
        }
    }

    rich_presence_conditional_display(
        IsRegion(region) &&
        InGame(region) &&
        InMode(region, GAMEMODE_STORY) &&
        InPuzzle(region),
        RegionFlags[region] + " | 🧩 | {0} is in Puzzle: {1}",
        RpCharacter[region],
        RpPuzzleLevel[region]
    )
}


rich_presence_display("Monkey is ready to roll")
