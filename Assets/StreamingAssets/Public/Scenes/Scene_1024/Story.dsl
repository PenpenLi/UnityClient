﻿story(1)
{ 
	local
  {
    @Stage(0);
    @Tencount(0);
    @Alive(0);
  };
	onmessage("start")
	{
		wait(1900);
		sendgfxmessage("GfxGameRoot","EnableBloom");
		showui(false);
		publishlogicevent("ge_set_story_state","game",1);
		sendgfxmessage("Main Camera","DimScreen",10);
		cameraheight(11.5,10);
		cameradistance(17,10);
		publishgfxevent("ge_set_indicator_invisible","indicator");
		wait(10);
		sendgfxmessage("Main Camera","LightScreen",2000);
		wait(1000);
		showdlg(102401);
	};
	onmessage("dialogover",102401)
	{
		wait(10);
		sendgfxmessage("Main Camera","DimScreen",300);
		wait(1000);
		destroynpc(10001);
		destroynpc(10002);
		destroynpc(10003);
		wait(10);
		cameraheight(-1,10);
		cameradistance(-1,10);
		wait(10);
		sendgfxmessage("Main Camera","LightScreen",2000);
		wait(800);
		publishgfxevent("pve_checkpoint_begin","ui_effect","急行军Ⅲ",2,4);
		wait(1500);
		showui(true);
		wait(10);
		publishgfxevent("pve_checkpoint_type","ui_effect",3);
		publishgfxevent("ge_show_skip","ui",0);
		sendgfxmessage("GfxGameRoot","DisableBloom");
		wait(1500);
		publishgfxevent("ge_pve_fightinfo","ui",3,300,0,0);
		wait(10);
		restarttimeout(4);
		wait(10);
		loop(5)
	  {
	    createnpc(1001+$$);
	  };
	  publishlogicevent("ge_set_story_state","game",0);
	  publishgfxevent("ge_set_indicator_visible","indicator");
	  wait(1500);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	  wait(2500);
	  loop(4)
	  {
	    createnpc(1101+$$);
	  };
	  wait(500);
	  @Tencount = 1;
	  wait(500);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	};
	onmessage("objkilled")
	{
		@Alive = $1;
		if(@Tencount == 1 && @Alive < 6)
		{
		  loop(4)
		  {
		    createnpc(1201+$$);
		  };
		  @Tencount = 0;
			wait(500);
			inc(@Stage);
			wait(500);
			setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
		};
	};
	onmessage("allnpckilled")
	{
		if(@Stage > 0)
		{
		wait(600);
		publishlogicevent("ge_area_clear", "game",0);
		wait(1500);
		showwall("AtoB",false);
		wait(100);
		restartareamonitor(2);
		}；
	};
	onmessage("anyuserenterarea",2)
	{
		showwall("BDoor",true);
		startstory(2);
		terminate();	  
	};
	onmessage("timeout",4)
  {
    publishgfxevent("ge_tuxi_timeout","ui");
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
    @Stage(0);
    @Tencount(0);
    @Alive(0);
  };
	onmessage("start")
	{
		wait(10);
	  loop(6)
	  {
	    createnpc(2001+$$);
	  };
	  wait(1000);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	  wait(4500);
	  loop(4)
	  {
	    createnpc(2101+$$);
	  };
	  wait(500);
	  @Tencount = 1;
	  wait(500);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	};
	onmessage("objkilled")
	{
		@Alive = $1;
		if(@Tencount == 1 && @Alive < 4)
		{
		  loop(4)
		  {
		    createnpc(2201+$$);
		  };
		  @Tencount = 0;
			wait(500);
			inc(@Stage);
			wait(500);
			setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
		};
	};
	onmessage("allnpckilled")
	{
		if(@Stage > 0)
		{
			wait(600);
			publishlogicevent("ge_area_clear", "game",0);
			wait(1500);
			showwall("BtoC",false);
			wait(100);
			restartareamonitor(3);
		};
	};
	onmessage("anyuserenterarea",3)
	{
		showwall("CDoor",true);
		startstory(3);
		terminate();
	};
	onmessage("timeout",4)
  {
    publishgfxevent("ge_tuxi_timeout","ui");
  };
  onmessage("missionfailed")
  {
    changescene(0);
    terminate();
  };
};
story(3)
{
  local
  {
    @reconnectCount(0);
    @Stage(0);
    @Tencount(0);
    @Alive(0);
  };
	onmessage("start")
	{	
		wait(10);
	  loop(8)
	  {
  	  createnpc(3001+$$);
  	};  	
  	wait(1000);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	  wait(6000);
	  loop(3)
	  {
  	  createnpc(3101+$$);
  	};  	
  	wait(500);
	  @Tencount = 1;
	  wait(500);
	  setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	};
	onmessage("objkilled")
	{
		@Alive = $1;
		if(@Tencount == 1 && @Alive < 4)
		{
		  loop(4)
		  {
	  	  createnpc(3201+$$);
	  	}; 	
	  	@Tencount = 0;
			wait(500);
			inc(@Stage);
			wait(500);
			setblockedshader(0x0000ff90,0.5,0,0xff000090,0.5,0);
	  };
	};
	onmessage("allnpckilled")
	{
		if(@Stage > 0)
		{
    restarttimeout(4,100000);
	  publishgfxevent("ge_pve_fightinfo","ui",4,0,0,0);
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
	  wait(2000);
		loop(10) 
		{ 
		  //检测网络状态 
		  while(!islobbyconnected() && @reconnectCount<10) 
		  { 
		    reconnectlobby();
		    wait(3000);
		    inc(@reconnectCount);
		    loop(10)
		    {
		      if(islobbylogining())
		      {
		        wait(1000);
		      };
		    };
		    if(islobbylogining())
		    {
		      disconnectlobby();
		    };
		  };
		  if(islobbyconnected() && !islobbylogining()) 
		  { 
		    missioncompleted(0); 
		    wait(21000);
		    disconnectlobby(); 
		  } else {
		    wait(10000); 
		    //terminate(); 
		  };
		}; 
		changescene(0);
		terminate(); 
		};
	};
	onmessage("timeout",4)
  {
    publishgfxevent("ge_tuxi_timeout","ui");
  };
  onmessage("missionfailed")
  {
    changescene(0);
    terminate();
  };
};
