#define GAME_ANY 0
#define GAME_CS 1
#define GAME_TF 2
#define GAME_HL 3
#define GAME_DOD 4

// CVars' handles
Handle cvar_save_scores = INVALID_HANDLE;
Handle cvar_save_scores_tracking_time = INVALID_HANDLE;
Handle cvar_save_scores_forever = INVALID_HANDLE;
Handle cvar_save_scores_allow_reset = INVALID_HANDLE;
Handle cvar_lan = INVALID_HANDLE;

// Commands' handles
Handle cvar_restartgame = INVALID_HANDLE;
Handle cvar_restartround = INVALID_HANDLE;

// Cvars' variables
bool save_scores = true;
int save_scores_tracking_time = 20;
bool save_scores_forever = false;
bool save_scores_allow_reset = true;
bool isLAN = false;

// DB handle
Handle g_hDB = INVALID_HANDLE;

// Other stuff
bool justConnected[MAXPLAYERS+1] = {true, ...};
int Game = GAME_ANY;
bool isNewGameTimer = false;
Handle g_hNewGameTimer = INVALID_HANDLE;
bool g_NextRoundNewGame = false;
bool g_isMenuItemCreated = false;

// Players info
int g_iPlayerScore[MAXPLAYERS+1];
int g_iPlayerDeaths[MAXPLAYERS+1];
int g_iPlayerCash[MAXPLAYERS+1];
