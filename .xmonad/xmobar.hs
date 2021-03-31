Config { 
	-- appearance
		font =         "xft:Ubuntu Nerd Font:pixelsize=14:antialias=true"
		, bgColor =      "#1C1D19"
		, fgColor =      "#D0D0D0"
		, position =     Bottom

		-- layout
		, sepChar =  "%"   -- delineator between plugin names and straight text
		, alignSep = "}{"  -- separator between left-right alignment
		, template = "%StdinReader%   <fc=#A8E123>%locks%</fc> }%date% { %dynnetwork% | %multicpu% | %memory% | %battery%"

		-- general behavior
		, lowerOnStart =     True    -- send to bottom of window stack on start
		, hideOnStart =      False   -- start with window unmapped (hidden)
		, allDesktops =      True    -- show on all desktops
		, overrideRedirect = True    -- set the Override Redirect flag (Xlib)
		, pickBroadest =     False   -- choose widest display (multi-monitor)
		, persistent =       True    -- enable/disable hiding (True = disabled)
		, commands =
		[
		-- capslock on/off	
			Run Locks
			-- time and date indicator 
			,Run Date           "<fc=#D0D0D0>%H:%M:%S (%d %b)</fc>" "date" 10

			-- network activity monitor (dynamic interface resolution)
			,Run DynNetwork     [ "--template" , "<dev>: \xf0ab<rx> kB/s  \xf0aa<tx> kB/s"
			, "--Low"      , "1000"       -- units: B/s
			, "--High"     , "5000"       -- units: B/s
			, "--low"      , "#D0D0D0"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#A8E123"
			] 10

			-- cpu activity monitor
			, Run MultiCpu       [ "--template" , "Cpu: <total>%"
			, "--Low"      , "50"         -- units: %
			, "--High"     , "85"         -- units: %
			, "--low"      , "#7cac7a"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#b8473d"
			] 10

			-- memory usage monitor
			, Run Memory         [ "--template" ,"Mem: <usedratio>% (<free> MB free, <cache> MB cache, <buffer> MB buffers)"
			, "--Low"      , "20"        -- units: %
			, "--High"     , "90"        -- units: %
			, "--low"      , "#7cac7a"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#b8473d"
			] 10
			,Run Brightness ["-t", ""] 60
			-- battery monitor
			, Run Battery        [ "--template" , " <acstatus>"
			, "--Low"      , "10"        -- units: %
			, "--High"     , "80"        -- units: %
			, "--low"      , "darkred"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#A8E123"

			, "--" -- battery specific options
			-- discharging status
			, "-o"	, "<left>% \xf578  "
			-- AC "on" status
			, "-O"	, "<left>% \xf583"
			-- charged status
			, "-i"	, "<left>% \xf578"
			] 50
			,Run StdinReader
			]
}

