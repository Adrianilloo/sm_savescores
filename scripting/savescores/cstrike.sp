// CVars' handles
Handle cvar_save_scores_css_cash = INVALID_HANDLE;
Handle cvar_save_scores_css_spec_cash = INVALID_HANDLE;
Handle cvar_startmoney = INVALID_HANDLE;

// Cvars' variables
bool save_scores_css_cash = true;
bool save_scores_css_spec_cash = true;
int g_CSDefaultCash = 800;

// Offsets
int g_iAccount = -1;

// Loading CS stuff on plugin start
public void CS_Stuff()
{
	// Creating cvars
	cvar_save_scores_css_cash = CreateConVar("sm_save_scores_css_cash", "1", "If set to 1 the save scores will also restore players' cash, 0 = off/1 = on", 0, true, 0.0, true, 1.0);
	cvar_save_scores_css_spec_cash = CreateConVar("sm_save_scores_css_spec_cash", "1", "If set to 1 the save scores will save spectators' cash and restore it after team join, 0 = off/1 = on", 0, true, 0.0, true, 1.0);
	cvar_startmoney = FindConVar("mp_startmoney");
	
	// Hooking cvar change
	HookConVarChange(cvar_save_scores_css_cash, OnCVarChange);
	HookConVarChange(cvar_save_scores_css_spec_cash, OnCVarChange);
	HookConVarChange(cvar_startmoney, OnCVarChange);
	
	// Finding offset for CS cash
	g_iAccount = FindSendPropInfo("CCSPlayer", "m_iAccount");
	if (g_iAccount == -1)
		SetFailState("m_iAccount offset not found");
	
	// Hooking command for detecting of new game start
	cvar_restartgame = FindConVar("mp_restartgame");
	if (cvar_restartgame != INVALID_HANDLE)
		HookConVarChange(cvar_restartgame, NewGameCommand);
	
	// Hooking events for detecting of new game start
	HookEvent("round_start", Event_NewGameStart);
	HookEvent("round_end", Event_RoundEnd);
}

// Set player's cash if game is CS
public void SetCash(int client, int cash)
{
	if (Game == GAME_CS)
	{
		SetEntData(client, g_iAccount, cash, 4, true);
	}
}

// Simply get player's CS cash or return 0 if game is not CS
public int GetCash(int client)
{
	if (Game == GAME_CS)
	{
		return GetEntData(client, g_iAccount);
	}
	
	return 0;
}