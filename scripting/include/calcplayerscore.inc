#if defined _calcplayerscore_included
 #endinput
#endif
#define _calcplayerscore_included

/**
 * @brief Called when a player's score is being calculated.
 *
 * @param client		Client index of the player.
 * @param score			The player's unmodified score.
 * @return				The player's desired score.
 */
forward int OnCalcPlayerScore(int client, int score);

/**
 * Do not edit below this line!
 */
public Extension __ext_calcplayerscore =
{
	name = "CalcPlayerScore",
	file = "calcplayerscore.ext",
#if defined AUTOLOAD_EXTENSIONS
	autoload = 1,
#else
	autoload = 0,
#endif
#if defined REQUIRE_EXTENSIONS
	required = 1,
#else
	required = 0,
#endif
};
