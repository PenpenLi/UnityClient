﻿story(1)
{ 
	local
	{
    @npc(0);
	};
	onmessage("start")
	{
	  wait(100);
		loop(9)
	  {
	    createnpc(1001+$$);
	  };
	  wait(1000);
	  //setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	};
	onmessage("allnpckilled")
	{
    inc(@npc);
		wait(600);
		publishlogicevent("ge_area_clear", "game",0);
		wait(1500);
		showwall("AtoB",false);
		wait(100);
		restartareamonitor(2);
	};
	onmessage("anyuserenterarea",2)
	{
		showwall("BDoor",true);
		startstory(2);
		terminate();	  
	};
  onmessage("missionfailed")
  {
    changescene(0);
    terminate();
  };
};
story(2)
{
  local
  {
    @reconnectCount(0);
    @npc(0);
  };
	onmessage("start")
	{	
		wait(100);
	  loop(7)
	  {
  	  createnpc(2001+$$);
  	};
	  wait(5000);
	if(@npc<1)
		{
		loop(3)
		{
  		createnpc(2008+$$);
  		};
		};
  	wait(1000);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	};
	onmessage("allnpckilled")
	{
    inc(@npc);
    //camerayaw(-80,3100);
    //wait(500);
    //cameraheight(2.3,10);
	  //cameradistance(7.6,10);
	  lockframe(0.01);
    wait(500);
    lockframe(0.05);
    wait(1800);
    lockframe(0.08);
    wait(300);
    lockframe(0.2);
    wait(500);
    lockframe(1.0);
		wait(300);
		//camerayaw(0,100);
	  //cameraheight(-1,100);
	  //cameradistance(-1,100);
	  wait(1000);
	  publishlogicevent("ge_area_clear", "game",1);
      missioncompleted(0); 
      changescene(0);
      terminate();
	};
  onmessage("missionfailed")
  {
    changescene(0);
    terminate();
  };
};
