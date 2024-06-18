integer EMAIL1=72;
integer length;
string protocol="ORG encapsulated RLVR protocol,005,";
string hostname;

string GetMailHostname()
{
    string sHostname = llGetEnv("objectmail_hostname");
    if (sHostname == "") {
        string sChannel = llGetEnv("sim_channel");
        if (llSubStringIndex(sChannel, "Second Life")==0) return "@lsl.secondlife.com";
        else if (llSubStringIndex(sChannel, "OpenSim")==0) return "@lsl.opensim.local";
    }
    return "@"+sHostname;
}

default
{
    state_entry()
    {
        hostname = GetMailHostname();
        length = llStringLength((string)NULL_KEY+hostname);
    }
    
    link_message(integer l, integer n, string m, key i)
    {
        if (n==EMAIL1)
        {
            string address=llGetSubString(m,0,length-1);
            string msg=llGetSubString(m,length,-1);
            llEmail(address,protocol+(string)i,msg);
        }
    }

    changed(integer i)
    {
        if (i & CHANGED_REGION) hostname = GetMailHostname();
    }
}

