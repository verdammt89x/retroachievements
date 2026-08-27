// Chessmaster
// #ID = 7376

// $00AF10: [8bit] Last started game type
//          0x01 = Standard game
//          0x02 = Handicap game
//          0x03 = Board Setup
function LastStartedGameType() => byte(0x00AF10)
GameType_Standard = 0x01
GameType_Handicap = 0x02
GameType_BoardSetup = 0x03

// $00C2E4: [8bit] Piece count (White) 0..15
function PieceCountWhite() => low4(0x00C2E4)

// $00C2F4: [8bit] Piece count (Black) 0..15
function PieceCountBlack() => low4(0x00C2F4)

// $00C314: [8bit] Pawn count (White)
function PawnCountWhite() => byte(0x00C314)

// $00C324: [8bit] Pawn count (Black)
function PawnCountBlack() => byte(0x00C324)

// $019938: [8bit] Winning colour (0x10 = white, 0x20 = black)
//          Doesn't reset when starting a new game
function WinningColourByte() => byte(0x019938)
function WinningColour() => high4(0x019938)
Colour_White = 0x01
Colour_Black = 0x02

// $019960: [32bit] Clock in seconds (Black)
function ClockInSecondsBlack() => dword(0x019960)

// $01996C: [32bit] Move count
function MoveCount() => dword(0x01996C)

// $019978: [8bit] Last move start coordinates
//          Upper 4 bits: 0-7 = 8-1 (rank)
//          Lower 4 bits: 0-7 = a-h
function LastMoveStartCoordinatesFile() => low4(0x019978)
function LastMoveStartCoordinatesRank() => high4(0x019978)

// $019979: [8bit] Last move end coordinates
//          Upper 4 bits: 0-7 = 8-1 (rank)
//          Lower 4 bits: 0-7 = a-h
function LastMoveEndCoordinates() => byte(0x019979)
function LastMoveEndCoordinatesFile() => low4(0x019979)
function LastMoveEndCoordinatesRank() => high4(0x019979)

// $01997C: [8bit] Check state (0x00 = no check, 0x80 = check)
function CheckState() => byte(0x01997C)
CheckState_NotChecked = 0x00
CheckState_Checked = 0x80

// $0199E0: [8bit] Actual piece on a8
//          Lower 4 bit (Piece):
//          0xX0 = none
//          0xX0 = King
//          0xX1 = Queen
//          0xX2 = Rook
//          0xX3 = Bishop
//          0xX4 = Knight
//          0xX5 = Pawn
//          Upper 4 bit (colour):
//          0x1X = white
//          0x2X = black
Piece_None = 0x00
Piece_King = 0x00 // actually 0x00 is none, but taking the lower bits only (ignoring colour) the king becomes 0x00
Piece_Queen = 0x01
Piece_Rook = 0x02
Piece_Bishop = 0x03
Piece_Knight = 0x04
Piece_Pawn = 0x05
Piece_KingW = 0x10
Piece_QueenW = 0x11
Piece_RookW = 0x12
Piece_BishopW = 0x13
Piece_KnightW = 0x14
Piece_PawnW = 0x15
Piece_KingB = 0x20
Piece_QueenB = 0x21
Piece_RookB = 0x22
Piece_BishopB = 0x23
Piece_KnightB = 0x24
Piece_PawnB = 0x25
function ActualPieceOnA8() => byte(0x0199E0)

// $0199E4: [8bit] Actual piece on b8
function ActualPieceOnB8() => byte(0x0199E4)

// $0199E8: [8bit] Actual piece on c8
function ActualPieceOnC8() => byte(0x0199E8)

// $0199EC: [8bit] Actual piece on d8
function ActualPieceOnD8() => byte(0x0199EC)

// $0199F0: [8bit] Actual piece on e8
function ActualPieceOnE8() => byte(0x0199F0)

// $0199F4: [8bit] Actual piece on f8
function ActualPieceOnF8() => byte(0x0199F4)

// $0199F8: [8bit] Actual piece on g8
function ActualPieceOnG8() => byte(0x0199F8)

// $0199FC: [8bit] Actual piece on h8
function ActualPieceOnH8() => byte(0x0199FC)

// $019A20: [8bit] Actual piece on a7
function ActualPieceOnA7() => byte(0x019A20)

// $019A24: [8bit] Actual piece on b7
function ActualPieceOnB7() => byte(0x019A24)

// $019A28: [8bit] Actual piece on c7
function ActualPieceOnC7() => byte(0x019A28)

// $019A2C: [8bit] Actual piece on d7
function ActualPieceOnD7() => byte(0x019A2C)

// $019A30: [8bit] Actual piece on e7
function ActualPieceOnE7() => byte(0x019A30)

// $019A34: [8bit] Actual piece on f7
function ActualPieceOnF7() => byte(0x019A34)

// $019A38: [8bit] Actual piece on g7
function ActualPieceOnG7() => byte(0x019A38)

// $019A3C: [8bit] Actual piece on h7
function ActualPieceOnH7() => byte(0x019A3C)

// $019A68: [8bit] Actual piece on c6
function ActualPieceOnC6() => byte(0x019A68)

// $019A70: [8bit] Actual piece on e6
function ActualPieceOnE6() => byte(0x019A70)

// $019AAC: [8bit] Actual piece on d5
function ActualPieceOnD5() => byte(0x019AAC)

// $019AB0: [8bit] Actual piece on e5
function ActualPieceOnE5() => byte(0x019AB0)

// $019AE8: [8bit] Actual piece on c4
function ActualPieceOnC4() => byte(0x019AE8)

// $019AEC: [8bit] Actual piece on d4
function ActualPieceOnD4() => byte(0x019AEC)

// $019AF0: [8bit] Actual piece on e4
function ActualPieceOnE4() => byte(0x019AF0)

// $019B2C: [8bit] Actual piece on d3
function ActualPieceOnD3() => byte(0x019B2C)

// $019B30: [8bit] Actual piece on e3
function ActualPieceOnE3() => byte(0x019B30)

// $019B34: [8bit] Actual piece on f3
function ActualPieceOnF3() => byte(0x019B34)

// $019B60: [8bit] Actual piece on a2
function ActualPieceOnA2() => byte(0x019B60)

// $019B64: [8bit] Actual piece on b2
function ActualPieceOnB2() => byte(0x019B64)

// $019B68: [8bit] Actual piece on c2
function ActualPieceOnC2() => byte(0x019B68)

// $019B6C: [8bit] Actual piece on d2
function ActualPieceOnD2() => byte(0x019B6C)

// $019B70: [8bit] Actual piece on e2
function ActualPieceOnE2() => byte(0x019B70)

// $019B74: [8bit] Actual piece on f2
function ActualPieceOnF2() => byte(0x019B74)

// $019B78: [8bit] Actual piece on g2
function ActualPieceOnG2() => byte(0x019B78)

// $019B7C: [8bit] Actual piece on h2
function ActualPieceOnH2() => byte(0x019B7C)

// $019BA0: [8bit] Actual piece on a1
function ActualPieceOnA1() => byte(0x019BA0)

// $019BA4: [8bit] Actual piece on b1
function ActualPieceOnB1() => byte(0x019BA4)

// $019BA8: [8bit] Actual piece on c1
function ActualPieceOnC1() => byte(0x019BA8)

// $019BAC: [8bit] Actual piece on d1
function ActualPieceOnD1() => byte(0x019BAC)

// $019BB0: [8bit] Actual piece on e1
function ActualPieceOnE1() => byte(0x019BB0)

// $019BB4: [8bit] Actual piece on f1
function ActualPieceOnF1() => byte(0x019BB4)

// $019BB8: [8bit] Actual piece on g1
function ActualPieceOnG1() => byte(0x019BB8)

// $019BBC: [8bit] Actual piece on h1
function ActualPieceOnH1() => byte(0x019BBC)


// $019C09: [8bit] Game over state
//          0x00 = None
//          0x10 = Checkmate
//          0x20 = Draw by Stalemate
//          0x30 = Draw by Repetition
function GameOverState() => byte(0x019C09)
GameOver_None = 0x00
GameOver_Checkmate = 0x10
GameOver_DrawStalemate = 0x20
GameOver_DrawRepetition = 0x30

// $01A270: [8bit] Players turn
//          0x10 = White
//          0x20 = Black
function PlayersTurnByte() => byte(0x01A270)
function PlayersTurn() => high4(0x01A270)

// $01A278: [32bit] Clock in seconds (White)
function ClockInSecondsWhite() => dword(0x01A278)

// $02D07C: [8bit] Promotion menu open
function PromotionMenu() => byte(0x02D07C)

// $02D0FC: [8bit] En passant
function EnPassant() => byte(0x02D0FC)

// $02DAEC: [8bit] Game ended state (0x00 = not ended, 0x01 = ended)
function GameEndedState() => byte(0x02DAEC)
GameEnded_No = 0x00
GameEnded_Yes = 0x01

// $03071C: [8bit] Opponent
//          0x01 = Ryan
//          0x02 = Ben
//          0x03 = Kamika
//          0x04 = Ross
//          0x05 = Jesse
//          0x06 = Billy
//          0x07 = Lucy
//          0x08 = Hayden
//          0x09 = Alicia
//          0x0a = Jon
//          0x0b = Rick
//          0x00 = Board Champion
//          0x0c = Nikolai
//          0x0d = Muldoon
//          0x0e = Will
//          0x0f = Waldo
//          0x10 = Griffin
//          0x11 = Hans
//          0x12 = Chessmaster
function Opponent() => byte(0x03071C)
Opponent_BoardChampion = 0x00
Opponent_Ryan = 0x01
Opponent_Ben = 0x02
Opponent_Kamika = 0x03
Opponent_Ross = 0x04
Opponent_Jesse = 0x05
Opponent_Billy = 0x06
Opponent_Lucy = 0x07
Opponent_Hayden = 0x08
Opponent_Alicia = 0x09
Opponent_Jon = 0x0a
Opponent_Rick = 0x0b
Opponent_Nikolai = 0x0c
Opponent_Muldoon = 0x0d
Opponent_Will = 0x0e
Opponent_Waldo = 0x0f
Opponent_Griffin = 0x10
Opponent_Hans = 0x11
Opponent_Chessmaster = 0x12

// $030720: [8bit] Who plays
//          0x00 = Player vs AI
//          0x01 = Player vs Player
//          0x02 = AI vs AI
function WhoPlays() => byte(0x030720)
WhoPlays_PlayerVsAI = 0x00
WhoPlays_PlayerVsPlayer = 0x01
WhoPlays_AIVsAI = 0x02

// $0307A0: [8bit] Player color
//          0x01 = White
//          0x02 = Black
function PlayerColourByte() => byte(0x0307A0)
function PlayerColour() => low4(0x0307A0)

// $0309FC: [8bit] Current Menu
//          0x01 = Loading Screen
//          0x02 = Home
//          0x03 = Game Settings
//          0x0c = Pause
//          0x0d = Chess Tutor
//          0x0e = Basic Rules
//          0x0f = Pieces Rules
//          0x10 = Special Moves
//          0x11 = Notation
//          0x12 = Strategies
//          0x13 = Chess Rater
//          0x14 = Famous Games
//          0x16 = Generic textbox to explain things
//          0x20 = Link Multiplayer
//          0x42 = In Game
function CurrentMenu() => byte(0x0309FC)
CurrentMenu_LoadingScreen = 0x01
CurrentMenu_Home = 0x02
CurrentMenu_GameSettings = 0x03
CurrentMenu_Pause = 0x0c
CurrentMenu_ChessTutor = 0x0d
CurrentMenu_BasicRules = 0x0e
CurrentMenu_PiecesRules = 0x0f
CurrentMenu_SpecialMoves = 0x10
CurrentMenu_Notation = 0x11
CurrentMenu_Strategies = 0x12
CurrentMenu_ChessRater = 0x13
CurrentMenu_FamousGames = 0x14
CurrentMenu_GenericTextbox = 0x16
CurrentMenu_LinkMultiplayer = 0x20
CurrentMenu_InGame = 0x42

// $0329DC: [8bit] First character challenge set 1
function FirstCharacterChallengeSet1() => byte(0x0329DC)

// $033C1C: [8bit] First character challenge set 2
function FirstCharacterChallengeSet2() => byte(0x033C1C)

// $034E5C: [8bit] First character challenge set 3
function FirstCharacterChallengeSet3() => byte(0x034E5C)


function PlayerColour_IsWhite() => PlayerColour() == Colour_White
function PlayerColour_IsBlack() => PlayerColour() == Colour_Black
function IsTurn_Player() => PlayersTurn() == PlayerColour()
function IsTurn_Opponent() => PlayersTurn() != PlayerColour()
function TurnChangedToPlayer() => prev(IsTurn_Opponent()) && IsTurn_Player()
function TurnChangedToOpponent() => prev(IsTurn_Player()) && IsTurn_Opponent()

// Is true when the player checked the opponent (works for both colours)
function PlayerCheckedOpponent() {
    return prev(IsTurn_Player()) && (prev(CheckState()) == CheckState_NotChecked && CheckState() == CheckState_Checked)
}

// Is true when the opponent checked the player (works for both colours)
function OpponentCheckedPlayer() {
    return prev(IsTurn_Opponent()) && (prev(CheckState()) == CheckState_NotChecked && CheckState() == CheckState_Checked)
}

// Is true as long as the players clock is below 5 Minutes (300 seconds) (works for both colours)
function PlayerClockBelow5Minutes() {
    return ((ClockInSecondsWhite() <= 300 && PlayerColour() == Colour_White) || (ClockInSecondsBlack() <= 300 && PlayerColour() == Colour_Black))
}

function LastMovePiece() {
    return byte(LastMoveEndCoordinates() * 4 + 0x199E0)
}

function LastMoveColour() {
    return high4(LastMoveEndCoordinates() * 4 + 0x199E0)
}

function LastMovePiece_Reduced() {
    return low4(LastMoveEndCoordinates() * 4 + 0x199E0)
}

// Cheat protection with PauseLocks for 
// 1. Last started game type is not Standard
// 2. WhoPlays is not PlayerVsAI
// 3. Opponent changes midgame
// 4. Player colour (sides) changes midgame
function CheatProtection() {
    return unless(once(LastStartedGameType() != GameType_Standard)) && 
            unless(once(WhoPlays() != WhoPlays_PlayerVsAI)) && 
            unless(once(prev(Opponent()) != Opponent())) && 
            unless(once(prev(PlayerColour()) != PlayerColour()))
}

// Resets the PauseLocks of the Cheat protection when
// 1. Move count is 0 (before first move, settings are allowed to be changed)
// 2. CurrentMenu is home, which happens when the player starts a new game
function ResetCheatProtection() {
    return never(MoveCount() == 0) && never(CurrentMenu() == CurrentMenu_Home)
}

// Resets the PauseLocks of the Cheat protection when
// 1. Move count is 0 (before first move, settings are allowed to be changed)
// 2. CurrentMenu is home, which happens when the player starts a new game
// This variation is for use with other Alts, where this Alt needs to be false to ensure no unwanted unlocks
function ResetCheatProtectionFalse() {
    return never(MoveCount() == 0) && never(CurrentMenu() == CurrentMenu_Home) && LastStartedGameType() == 0xff
}


// A promotion to a knight happened when the last moved piece is a knight and promotion menu is closed
function PromotedToKnight() {
    return once(LastMovePiece_Reduced() == Piece_Knight && prev(PromotionMenu()) == 1 && PromotionMenu() == 0)
}

// Detect if a white pawn left a specific square. This needs to with a repeated to make sure the new value is stable
function WhitePawnLeftSquare(square) {

    return repeated(10, square == Piece_PawnW && never(TurnChangedToPlayer()) &&
    repeated(10, square == Piece_None && never(TurnChangedToPlayer())))
}

// Detect if a black pawn left a specific square. This needs to with a repeated to make sure the new value is stable
function BlackPawnLeftSquare(square) {

    return (repeated(10, square == Piece_PawnB && never(TurnChangedToPlayer()) &&
    repeated(10, square == Piece_None && never(TurnChangedToPlayer()))))
}

// checks for a specific piece is on a specific square at a specific move count
function PieceOnSquareAtMove(moveCount, square, piece) {
    return once(MoveCount() == moveCount && square == piece) 
}

// Default game finished condition
function GameFinished() {
    return prev(GameEndedState()) == GameEnded_No && GameEndedState() == GameEnded_Yes
}

// Game finished but the player won
function GameFinishedWin() {
    return GameOverState() == GameOver_Checkmate && PlayerColour() == WinningColour() && GameFinished()
}

// Game finished (Player won, specific opponent)
function GameFinishedWinOpponent(opponent) {
    return Opponent() == opponent && GameOverState() == GameOver_Checkmate && PlayerColour() == WinningColour() && GameFinished()
}

// Game finished (Player won, specific opponent, specific piece colour)
function GameFinishedWinOpponentWithColour(opponent, colour) {
    return Opponent() == opponent && GameOverState() == GameOver_Checkmate && PlayerColour() == colour && WinningColour() == colour && GameFinished()
}

// Game finished (Player won, except specific opponent)
function GameFinishedWinExceptOpponent(opponent) {
    return Opponent() != opponent && GameOverState() == GameOver_Checkmate && PlayerColour() == WinningColour() && GameFinished()
}

// Game finished (Player won, except specific opponent, specific piece colour)
function GameFinishedWinExceptOpponentWithColour(opponent, colour) {
    return Opponent() != opponent && GameOverState() == GameOver_Checkmate && PlayerColour() == colour && WinningColour() == colour && GameFinished()
}

// Game finished and white won
function GameFinishedWinWhite() {
    return GameOverState() == GameOver_Checkmate && WinningColour() == Colour_White && GameFinished()
}

// Game finished and black won
function GameFinishedWinBlack() {
    return GameOverState() == GameOver_Checkmate && WinningColour() == Colour_Black && GameFinished()
}

// Game finished with draw by repetition
function GameFinishedDrawRepetition() {
    return GameOverState() == GameOver_DrawRepetition && GameFinished()
}

// Game finished with draw by stalemate
function GameFinishedDrawStalemate() {
    return GameOverState() == GameOver_DrawStalemate && GameFinished()
}


// Detects a Queenside castle for white
function CastleQueensideWhite() {
    return (PlayerColour() == Colour_White && once(prev(ActualPieceOnA1()) == Piece_RookW && ActualPieceOnA1() == Piece_None) &&
             once(prev(ActualPieceOnC1()) == Piece_None && ActualPieceOnC1() == Piece_KingW) &&
             once(prev(ActualPieceOnD1()) == Piece_None && ActualPieceOnD1() == Piece_RookW))
}

// Detects a Queenside castle for black
function CastleQueensideBlack() {
    return (PlayerColour() == Colour_Black && once(prev(ActualPieceOnA8()) == Piece_RookB && ActualPieceOnA8() == Piece_None) &&
             once(prev(ActualPieceOnC8()) == Piece_None && ActualPieceOnC8() == Piece_KingB) &&
             once(prev(ActualPieceOnD8()) == Piece_None && ActualPieceOnD8() == Piece_RookB))
}

// General Queenside castle
function CastleQueenside() {
    return CastleQueensideWhite() || CastleQueensideBlack()
}


// Defeat a specific opponent
function DefeatOpponent(opponent) {
    return (
        (
            GameFinishedWinOpponent(opponent) && CheatProtection()
        ) || 
        (
            ResetCheatProtection()
        )
    )
}

// Defeat a specific opponent in a given piece colour
function DefeatOpponentWithColour(opponent, colour) {
    return GameFinishedWinOpponentWithColour(opponent, colour) && CheatProtection() || ResetCheatProtection()
}

// Defeat any opponent except the given one
function DefeatExceptOpponent(opponent) {
    return GameFinishedWinExceptOpponent(opponent) && CheatProtection() || ResetCheatProtection()
}

// Defeat any opponent except the given one in a given piece colour
function DefeatExceptOpponentWithColour(opponent, colour) {
    return GameFinishedWinExceptOpponentWithColour(opponent, colour) && CheatProtection() || ResetCheatProtection()
}

// Defeat specific opponent with trigger
function DefeatOpponentWithTrigger(opponent) {
    return trigger_when(GameFinishedWinOpponent(opponent)) && CheatProtection() || ResetCheatProtection()
}


achievement(
    title = "WARNING", points = 0,
    description = "Achievements have to be done in \"Standard Game\" and \"Player vs. AI\". Changing opponents, sides or \"Who Plays\" midgame resets all achievements and can only be restarted by starting a new game.",
    id = 630188, badge = "719731", published = "12.08.2026 13:06:56", modified = "12.08.2026 13:06:56",
    trigger = prev(CurrentMenu()) != CurrentMenu_Home && CurrentMenu() == CurrentMenu_Home
)

achievement(
    title = "It's Just a Kid", points = 2, type="progression",
    description = "Defeat Ryan",
    id = 628679, badge = "715088", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = DefeatOpponent(Opponent_Ryan)
)

achievement(
    title = "With Great Power...", points = 2, type="progression",
    description = "Defeat Ben",
    id = 628680, badge = "715089", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = DefeatOpponent(Opponent_Ben)
)

achievement(
    title = "Divine Wind", points = 2, type="progression",
    description = "Defeat Kamika",
    id = 628681, badge = "715090", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = DefeatOpponent(Opponent_Kamika)
)

achievement(
    title = "Ross-tered", points = 2, type="progression",
    description = "Defeat Ross",
    id = 628682, badge = "715091", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = DefeatOpponent(Opponent_Ross)
)

achievement(
    title = "Dojo Dropout", points = 2, type="progression",
    description = "Defeat Jesse",
    id = 628683, badge = "715092", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = DefeatOpponent(Opponent_Jesse)
)

achievement(
    title = "Billy the Kid", points = 2, type="progression",
    description = "Defeat Billy",
    id = 628684, badge = "715093", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = DefeatOpponent(Opponent_Billy)
)

achievement(
    title = "Lucy, You Got Some Splainin to Do", points = 2, type="progression",
    description = "Defeat Lucy",
    id = 628685, badge = "715094", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Lucy)
)

achievement(
    title = "Go Hayden", points = 3, type="progression",
    description = "Defeat Hayden",
    id = 628686, badge = "715095", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Hayden)
)

achievement(
    title = "Girl on Fire", points = 3, type="progression",
    description = "Defeat Alicia",
    id = 628687, badge = "715096", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Alicia)
)

achievement(
    title = "Hammer Time", points = 3, type="progression",
    description = "Defeat Jon",
    id = 628688, badge = "715097", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Jon)
)

achievement(
    title = "Never Gonna Give You Up...", points = 3, type="progression",
    description = "Defeat Rick",
    id = 628689, badge = "715098", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Rick)
)

achievement(
    title = "Rey Enigma", points = 5, type="progression",
    description = "Defeat the Board Champion",
    id = 628690, badge = "715099", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_BoardChampion)
)

achievement(
    title = "The Iron Curtain Defense", points = 5, type="progression",
    description = "Defeat Nikolai",
    id = 628691, badge = "715100", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Nikolai)
)

achievement(
    title = "The X-Files Opening", points = 5, type="progression",
    description = "Defeat Muldoon",
    id = 628692, badge = "715101", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Muldoon)
)

achievement(
    title = "Fresh Prince of Chess", points = 5, type="progression",
    description = "Defeat Will",
    id = 628693, badge = "715102", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Will)
)

achievement(
    title = "Finding Waldo", points = 5, type="progression",
    description = "Defeat Waldo",
    id = 628694, badge = "715103", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Waldo)
)

achievement(
    title = "Giggity Checkmate", points = 5, type="progression",
    description = "Defeat Griffin",
    id = 628695, badge = "715104", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Griffin)
)

achievement(
    title = "Hans Down", points = 5, type="progression",
    description = "Defeat Hans",
    id = 628696, badge = "715105", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Hans)
)

achievement(
    title = "The Magnus Opus", points = 10, type="progression",
    description = "Defeat the Chessmaster",
    id = 628697, badge = "715106", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponent(Opponent_Chessmaster)
)

achievement(
    title = "What Am I Doing?", points = 25,
    description = "Defeat the Chessmaster while starting with the \"Barnes Opening\" - 1. f3",
    id = 628698, badge = "715107", published = "05.08.2026 13:08:40", modified = "05.08.2026 13:08:40",
    trigger = DefeatOpponentWithTrigger(Opponent_Chessmaster) && PieceOnSquareAtMove(1, ActualPieceOnF3(), Piece_PawnW)
)

achievement(
    title = "Long Way Home", points = 2,
    description = "Castle on the Queenside",
    id = 628701, badge = "719732", published = "05.08.2026 14:07:50", modified = "05.08.2026 14:07:50",
    trigger = CastleQueenside() && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "High Five!", points = 3,
    description = "Give check five times in one game",
    id = 629083, badge = "719733", published = "07.08.2026 07:44:36", modified = "07.08.2026 07:44:36",
    trigger = measured(repeated(5, PlayerCheckedOpponent())) && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "It's Me, Neo", points = 5,
    description = "Win without ever being checked",
    id = 629082, badge = "719734", published = "07.08.2026 07:44:33", modified = "07.08.2026 07:44:33",
    trigger = unless(once(OpponentCheckedPlayer())) && trigger_when(GameFinishedWin()) && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "Blitz Out", points = 10,
    description = "Win with less than 5 Minutes on your clock",
    id = 628672, badge = "719735", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = GameFinishedWin() && PlayerClockBelow5Minutes()  && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "Knightmare", points = 5,
    description = "Deliver a checkmate with a knight",
    id = 628699, badge = "719736", published = "05.08.2026 13:08:51", modified = "05.08.2026 13:08:51",
    trigger = GameFinishedWin() && CheatProtection() &&
              ((unless(PlayerColour() != Colour_White) && LastMovePiece() == Piece_KnightW) ||
               (unless(PlayerColour() != Colour_Black) && LastMovePiece() == Piece_KnightB) ||
               ResetCheatProtectionFalse())
)

achievement(
    title = "What Is This Sorcery?", points = 3,
    description = "Perform an \"En passant\" move",
    id = 628678, badge = "719737", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = once(PlayersTurn() != PlayerColour() && prev(EnPassant()) == 0 && EnPassant() == 1) && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "Coronation", points = 2,
    description = "Promote a Pawn to any piece",
    id = 628676, badge = "719738", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = CheatProtection() && prev(PromotionMenu()) == 1 && PromotionMenu() == 0 || ResetCheatProtection()
)

achievement(
    title = "The Underdog", points = 5,
    description = "Promote a Pawn to a Knight and win the game",
    id = 628677, badge = "719739", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = trigger_when(GameFinishedWin()) && PromotedToKnight() && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "The Pawnback", points = 10,
    description = "Be down 3 pieces for at least 3 turns and then win the game",
    id = 628903, badge = "719740", published = "06.08.2026 07:07:27", modified = "06.08.2026 07:07:27",
    trigger = CheatProtection() && trigger_when(GameFinishedWin()) &&
              (
                 // Alt1 (player colour white)
                 (PlayerColour() == Colour_White && measured(repeated(3, TurnChangedToPlayer() && (3 + PieceCountWhite()) <= PieceCountBlack()))) ||
                 // Alt2 (player colour black)
                 (PlayerColour() == Colour_Black && measured(repeated(3, TurnChangedToPlayer() && (3 + PieceCountBlack()) <= PieceCountWhite()))) ||
                 // Alt3 (Reset cheat protection)
                 ResetCheatProtectionFalse()
              )
)

achievement(
    title = "Full Clear", points = 5,
    description = "Capture every enemy piece, except the king, and then win the game",
    id = 628904, badge = "719741", published = "06.08.2026 07:07:30", modified = "06.08.2026 07:07:30",
    trigger = GameFinishedWin() && CheatProtection() &&
              (
                // Alt1 (Player is white)
                (PlayerColour_IsWhite() && PieceCountBlack() == 0) ||
                // Alt2 (Player is black)
                (PlayerColour_IsBlack() && PieceCountWhite() == 0) || 
                // Alt3 (Reset cheat protection)
                ResetCheatProtectionFalse()
              )
)

achievement(
    title = "Infantry First", points = 10,
    description = "Capture 4 pawns before any other piece and then win the game",
    id = 628702, badge = "719742", published = "05.08.2026 14:07:54", modified = "05.08.2026 14:07:54",
    trigger = trigger_when(GameFinishedWin()) && CheatProtection() &&
              (
                // Alt1 (Player is white)
                (once(PlayerColour_IsWhite() && PieceCountBlack() == 11 && PawnCountBlack() == 4 && TurnChangedToPlayer())) ||
                // Alt2 (Player is black)
                (once(PlayerColour_IsBlack() && PieceCountWhite() == 11 && PawnCountWhite() == 4 && TurnChangedToPlayer())) || 
                // Alt3 (Reset cheat protection)
                ResetCheatProtectionFalse()
              )
)

achievement(
    title = "Going Circles", points = 5,
    description = "Draw by repetition: Board position occurs three times during the game",
    id = 628670, badge = "719743", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = GameFinishedDrawRepetition() && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "Deadlock", points = 5,
    description = "Draw by stalemate: Enemy has no legal move left",
    id = 628671, badge = "719744", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = GameFinishedDrawStalemate() && CheatProtection() || ResetCheatProtection()
)

achievement(
    title = "There Is A Cow Level?", points = 5,
    description = "Play the Cow Opening as White and win the game - 1.e3 d5 2.d3",
    id = 628905, badge = "719745", published = "06.08.2026 07:07:34", modified = "06.08.2026 07:07:34",
    trigger = trigger_when(GameFinishedWin()) && 
              PlayerColour() == Colour_White && 
              PieceOnSquareAtMove(1, ActualPieceOnE3(), Piece_PawnW) &&
              PieceOnSquareAtMove(2, ActualPieceOnD5(), Piece_PawnB) &&
              PieceOnSquareAtMove(3, ActualPieceOnD3(), Piece_PawnW) &&
              CheatProtection() || 
              ResetCheatProtection()
)

achievement(
    title = "Italian Job", points = 5,
    description = "Play the Italian Opening as White and win the game - 1.e4 e5 2.Nf3 Nc6 3.Bc4",
    id = 628906, badge = "719746", published = "06.08.2026 07:07:34", modified = "06.08.2026 07:07:34",
    trigger = trigger_when(GameFinishedWin()) && 
              PlayerColour() == Colour_White && 
              PieceOnSquareAtMove(1, ActualPieceOnE4(), Piece_PawnW) &&
              PieceOnSquareAtMove(2, ActualPieceOnE5(), Piece_PawnB) &&
              PieceOnSquareAtMove(3, ActualPieceOnF3(), Piece_KnightW) &&
              PieceOnSquareAtMove(4, ActualPieceOnC6(), Piece_KnightB) &&
              PieceOnSquareAtMove(5, ActualPieceOnC4(), Piece_BishopW) &&
              CheatProtection() || 
              ResetCheatProtection()
)

achievement(
    title = "Anya, Is That You?", points = 5,
    description = "Play the Queens Gambit Opening as White and win the game- 1.d4 d5 2.c4",
    id = 628907, badge = "719747", published = "06.08.2026 07:07:34", modified = "06.08.2026 07:07:34",
    trigger = trigger_when(GameFinishedWin()) && 
              PlayerColour() == Colour_White && 
              PieceOnSquareAtMove(1, ActualPieceOnD4(), Piece_PawnW) &&
              PieceOnSquareAtMove(2, ActualPieceOnD5(), Piece_PawnB) &&
              PieceOnSquareAtMove(3, ActualPieceOnC4(), Piece_PawnW) &&
              CheatProtection() || 
              ResetCheatProtection()
)

achievement(
    title = "Slav Fortress", points = 5,
    description = "Play the Slav Defense as Black and win the game - 1.d4 d5 2.c4 c6",
    id = 628908, badge = "719748", published = "06.08.2026 07:07:34", modified = "06.08.2026 07:07:34",
    trigger = trigger_when(GameFinishedWin()) && 
              PlayerColour() == Colour_Black &&
              PieceOnSquareAtMove(1, ActualPieceOnD4(), Piece_PawnW) &&
              PieceOnSquareAtMove(2, ActualPieceOnD5(), Piece_PawnB) &&
              PieceOnSquareAtMove(3, ActualPieceOnC4(), Piece_PawnW) &&
              PieceOnSquareAtMove(4, ActualPieceOnC6(), Piece_PawnB) &&
              CheatProtection() || 
              ResetCheatProtection()
)

achievement(
    title = "French Resistance", points = 5,
    description = "Play the French Defense as Black and win the game - 1.e4 e6",
    id = 628909, badge = "719749", published = "06.08.2026 07:07:34", modified = "06.08.2026 07:07:34",
    trigger = trigger_when(GameFinishedWin()) && 
              PlayerColour() == Colour_Black &&
              PieceOnSquareAtMove(1, ActualPieceOnE4(), Piece_PawnW) &&
              PieceOnSquareAtMove(2, ActualPieceOnE6(), Piece_PawnB) &&
              CheatProtection() || 
              ResetCheatProtection()
)

achievement(
    title = "Caro-Kann't Touch This", points = 5,
    description = "Play the Caro-Kann as Black and win the game - 1.e4 c6",
    id = 628910, badge = "719750", published = "06.08.2026 07:07:34", modified = "06.08.2026 07:07:34",
    trigger = trigger_when(GameFinishedWin()) && 
              PlayerColour() == Colour_Black &&
              PieceOnSquareAtMove(1, ActualPieceOnE4(), Piece_PawnW) &&
              PieceOnSquareAtMove(2, ActualPieceOnC6(), Piece_PawnB) &&
              CheatProtection() || 
              ResetCheatProtection()
)

achievement(
    title = "What's My ELO?", points = 10,
    description = "Reach at least 2000 Rating in Challenge Set 1",
    id = 628673, badge = "719751", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = CurrentMenu() == CurrentMenu_ChessRater &&
              once(prev(FirstCharacterChallengeSet1()) == 49 && FirstCharacterChallengeSet1() == 66) &&
              once(prev(FirstCharacterChallengeSet1()) == 66 && FirstCharacterChallengeSet1() == 50) &&
              never(FirstCharacterChallengeSet1() == 49)
)

achievement(
    title = "Climbing the Ranks", points = 10,
    description = "Reach at least 2000 Rating in Challenge Set 2",
    id = 628674, badge = "719752", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = CurrentMenu() == CurrentMenu_ChessRater &&
              once(prev(FirstCharacterChallengeSet2()) == 49 && FirstCharacterChallengeSet2() == 66) &&
              once(prev(FirstCharacterChallengeSet2()) == 66 && FirstCharacterChallengeSet2() == 50) &&
              never(FirstCharacterChallengeSet2() == 49)
)

achievement(
    title = "Road to Grandmaster", points = 10,
    description = "Reach at least 2000 Rating in Challenge Set 3",
    id = 628675, badge = "719753", published = "05.08.2026 13:08:39", modified = "05.08.2026 13:08:39",
    trigger = CurrentMenu() == CurrentMenu_ChessRater &&
              once(prev(FirstCharacterChallengeSet3()) == 49 && FirstCharacterChallengeSet3() == 66) &&
              once(prev(FirstCharacterChallengeSet3()) == 66 && FirstCharacterChallengeSet3() == 50) &&
              never(FirstCharacterChallengeSet3() == 49)
)

leaderboard(
    id = 169116, title = "Fastest Checkmate as White",
    description = "Fastest clock time to beat any opponent, except Chessmaster, in a Standard Game while playing with the White pieces.",
    start  = DefeatExceptOpponentWithColour(Opponent_Chessmaster, Colour_White),
    cancel = always_false(),
    submit = always_true(),
    value  = measured(ClockInSecondsWhite()),
    format = "SECS", lower_is_better = true
)

leaderboard(
    id = 169114, title = "Fastest Checkmate as Black",
    description = "Fastest clock time to beat any opponent, except Chessmaster, in a Standard Game while playing with the Black pieces.",
    start  = DefeatExceptOpponentWithColour(Opponent_Chessmaster, Colour_Black),
    cancel = always_false(),
    submit = always_true(),
    value  = measured(ClockInSecondsBlack()),
    format = "SECS", lower_is_better = true
)

leaderboard(
    id = 169117, title = "Fastest Checkmate Against the Chessmaster as White",
    description = "Fastest clock time to beat the Chessmaster, in a Standard Game while playing with the White pieces.",
    start  = DefeatOpponentWithColour(Opponent_Chessmaster, Colour_White),
    cancel = always_false(),
    submit = always_true(),
    value  = measured(ClockInSecondsWhite()),
    format = "SECS", lower_is_better = true
)

leaderboard(
    id = 169115, title = "Fastest Checkmate Against the Chessmaster as Black",
    description = "Fastest clock time to beat the Chessmaster, in a Standard Game while playing with the Black pieces.",
    start  = DefeatOpponentWithColour(Opponent_Chessmaster, Colour_Black),
    cancel = always_false(),
    submit = always_true(),
    value  = measured(ClockInSecondsBlack()),
    format = "SECS", lower_is_better = true
)

leaderboard(
    id = 169118, title = "Fewest Moves to Checkmate as White",
    description = "Fewest move count to beat any opponent, except Chessmaster, in a Standard Game while playing with the White pieces.",
    start  = DefeatExceptOpponentWithColour(Opponent_Chessmaster, Colour_White),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((MoveCount() / 2 + MoveCount() % 2)),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 169120, title = "Fewest Moves to Checkmate as Black",
    description = "Fewest move count to beat any opponent, except Chessmaster, in a Standard Game while playing with the Black pieces.",
    start  = DefeatExceptOpponentWithColour(Opponent_Chessmaster, Colour_Black),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((MoveCount() / 2 + MoveCount() % 2)),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 169119, title = "Fewest Moves to Checkmate the Chessmaster as White",
    description = "Fewest move count to beat the Chessmaster, in a Standard Game while playing with the White pieces.",
    start  = DefeatOpponentWithColour(Opponent_Chessmaster, Colour_White),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((MoveCount() / 2 + MoveCount() % 2)),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 169121, title = "Fewest Moves to Checkmate the Chessmaster as Black",
    description = "Fewest move count to beat the Chessmaster, in a Standard Game while playing with the Black pieces.",
    start  = DefeatOpponentWithColour(Opponent_Chessmaster, Colour_Black),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((MoveCount() / 2 + MoveCount() % 2)),
    format = "VALUE", lower_is_better = true
)
