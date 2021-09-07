// CVars' handles
Handle cvar_teamplay = INVALID_HANDLE;

// Cvars' variables
bool g_bHLTeamPlay = false;

// Loading HL stuff on plugin start
public void HL_Stuff()
{
	// Finding CVar mp_teamplay
	cvar_teamplay = FindConVar("mp_teamplay");
	
	// Hooking this CVar
	HookConVarChange(cvar_teamplay, OnCVarChange);
	
	// And we need this event when mp_teamplay = 0
	HookEvent("player_spawn", Event_HLPlayerSpawn);
	
	// Hooking command for detecting of new game start
	cvar_restartgame = FindConVar("mp_restartgame");
	if (cvar_restartgame != INVALID_HANDLE)
		HookConVarChange(cvar_restartgame, NewGameCommand);
	
	// Hooking events for detecting of new game start
	HookEvent("round_start", Event_NewGameStart);
	HookEvent("round_end", Event_RoundEnd);
}

// This is only for HL with disabled teamplay because when teamplay is disabled player joins team before he is in game.
public Action Event_HLPlayerSpawn(Handle event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (!client || isLAN || !save_scores)
	{
		return Plugin_Continue;
	}
	
	if (IsFakeClient(client) || !IsClientInGame(client))
	{
		return Plugin_Continue;
	}
	
	if (Game == GAME_HL && !g_bHLTeamPlay && justConnected[client])
	{
		justConnected[client] = false;
		GetScoreFromDB(client);
	}
	
	return Plugin_Continue;
}