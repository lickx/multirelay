
integer CMD_SHOW_PENDING = 91;
integer CMD_STATUS = 21;

string texture="Bar";

vector textcol=<1.0,0,0>;


 
default
{
    state_entry()
    {
      llSetText("",textcol,1.0);
      llSetAlpha(0,ALL_SIDES);
      llSetPrimitiveParams([PRIM_GLOW,ALL_SIDES,0]);
      llSetTexture(texture,ALL_SIDES);
      llSetTextureAnim(ANIM_ON|PING_PONG  | LOOP, ALL_SIDES,8,1,0, 7,16);
    }

    link_message(integer lnum, integer num, string str, key id)
    {
        if (str=="pending" && num==CMD_STATUS)
        {
            state active;
        }
    }
}
 state active
 {
     state_entry()
     {
         llSetText("Request(s) pending.",textcol,1.0);
         llSetPrimitiveParams([PRIM_GLOW,ALL_SIDES,0.15]);
         llSetAlpha(1.0,ALL_SIDES);
         
    }
    link_message(integer lnum, integer num, string str, key id)
    {
        if (str=="idle" && num==CMD_STATUS)
        {
                state default;
        }
    }
    
    on_rez(integer start_param)
    {
        state default;
    }
    
    touch_start(integer num)
    {
        llMessageLinked(LINK_SET, CMD_SHOW_PENDING, "", llDetectedKey(0));
    }
}   