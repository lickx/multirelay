
integer CMD_SOURCES=200000;

string tex="Numbers";

display(integer num)
{
    num=num % 100;
    integer digit1=num/10;

    integer row1=digit1/8;
    integer col1=digit1 % 8;

    float xoffset1=-0.4375+(col1*0.125);
    float yoffset1=0.25-(row1*0.5);

    integer digit2=num % 10;

    integer row2=digit2/8;
    integer col2=digit2 % 8;

    float xoffset2=-0.4375+(col2*0.125);
    float yoffset2=0.25-(row2*0.5);

    float alpha10=1.0;
    float alpha1=1.0;
    float ypos=0.0;

    if(num<10)
    {
        if(num==0) alpha1=0.0;
        alpha10=0.0;
        vector scale=llGetScale();
        ypos=scale.y/4.0;
    }

    vector pos=llGetLocalPos();
    pos.y=ypos;

    llSetLinkPrimitiveParamsFast(LINK_THIS,
        [
            PRIM_POSITION,pos,
            PRIM_TEXTURE,3,tex,<0.125,0.48,0.0>,<xoffset1,yoffset1,0.0>,0.0,
            PRIM_TEXTURE,4,tex,<0.125,0.48,0.0>,<xoffset2,yoffset2,0.0>,0.0,
            PRIM_COLOR,3,<1.0,1.0,1.0>,alpha10,
            PRIM_COLOR,4,<1.0,1.0,1.0>,alpha1
        ]
    );
}

default
{
    state_entry()
    {
        display(0);
    }

    link_message(integer s,integer cmd,string str,key k)
    {
        if(cmd==CMD_SOURCES)
        {
            display((integer) str);
        }
    }
}
