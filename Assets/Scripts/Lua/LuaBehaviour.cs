﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using ScriptableData;
using XLua;

[Serializable]
public class Injection
{
    public string Name;
    public object Object;
}

[LuaCallCSharp]
public class LuaBehaviour : MonoBehaviour
{
    public TextAsset LuaScript;
    public Injection[] Injections;

    /// common function call
    private Action<UnityEngine.Object> LuafAwake;
    private Action LuafStart;
    private Action LuafUpdate;
    private Action LuafDestroy;

    /// self table
    private LuaTable ScriptEnv;
    
    void Awake()
    {
        LuaEnv env = ScriptManager.Instance.ScriptObject as LuaEnv;

        // set index meta table
        ScriptEnv = env.NewTable();
        LuaTable metaTable = env.NewTable();
        metaTable.Set("__index", env.Global);
        ScriptEnv.SetMetaTable(metaTable);
        metaTable.Dispose();

        // set self ptr
        ScriptEnv.Set("self", this);

        // register injections
        foreach( var injection in Injections )
        {
            ScriptEnv.Set(injection, injection.Object);
        }

        // execute lua impl
        ExecuteLua();

        // get common actions
        ScriptEnv.Get("awake", out LuafAwake);
        ScriptEnv.Get("start", out LuafStart);
        ScriptEnv.Get("update", out LuafUpdate);
        ScriptEnv.Get("ondestroy", out LuafDestroy);

        // fire awake in lua
        if (LuafAwake != null)
        {
            LuafAwake((UnityEngine.Object)this);
        }
    }

    void Start ()
    {
		if (LuafStart != null)
        {
            LuafStart();
        }
	}
	
	void Update ()
    {
		if (LuafUpdate != null)
        {
            LuafUpdate();
        }
	}

    void OnDestroy()
    {
        if (LuafDestroy != null)
        {
            LuafDestroy();
        }

        LuafAwake = null;
        LuafStart = null;
        LuafUpdate = null;
        LuafDestroy = null;
        Injections = null;
        ScriptEnv.Dispose();
    }

    void ExecuteLua()
    {
        string luaExecutable = System.IO.Path.GetFileNameWithoutExtension(LuaScript.name);
        ScriptManager.Instance.ExecuteFile(luaExecutable, ScriptEnv);
    }
}
