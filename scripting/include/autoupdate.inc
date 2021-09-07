#define _autoupdate_included

/**
 * Adds a plugin to be autoupdated.
 *
 * @param url  		URL of file to check.
 * @param file  		Path of file to check.
 * @param version  	Current plugin version.
 * @return				Client index.
 */
native int AutoUpdate_AddPlugin(const char[] url, const char[] file, const char[] version);

/**
 * Stops a plugin from being autoupdated.
 *
 * @param url  		URL of file to check.
 * @param file  		Path of file to check.
 * @param version  	Current plugin version.
 * @return				Client index.
 */
native int AutoUpdate_RemovePlugin(Handle plugin=INVALID_HANDLE);

public SharedPlugin __pl_autoupdate = 
{
	name = "autoupdate",
	file = "autoupdate.smx",
#if defined REQUIRE_PLUGIN
	required = 1,
#else
	required = 0,
#endif
};

#if !defined REQUIRE_PLUGIN
public void __pl_autoupdate_SetNTVOptional() {
	MarkNativeAsOptional("AutoUpdate_AddPlugin");
	MarkNativeAsOptional("AutoUpdate_RemovePlugin");
}
#endif