Config { 
	-- appearance
		font =         "xft:Ubuntu Nerd Font:pixelsize=15:antialias=true"
		, bgColor =      "#1C1D19"
		, alpha = 1
		, fgColor =      "#D0D0D0"
		, position =     Bottom

		-- layout
		, sepChar =  "%"   -- delineator between plugin names and straight text
		, alignSep = "}{"  -- separator between left-right alignment
		, template = "%StdinReader% } %date% {<fc=#b8473d>%locks%</fc>   %multicpu% <fc=#474747>|</fc> %memory% <fc=#474747>|</fc>%disku% <fc=#474747>|</fc><fc=#666666> %volume% vol.</fc> <fc=#666666>|</fc> %battery%"
		--, template = "%StdinReader% } %date% {<fc=#b8473d>%locks%</fc>    %multicpu% <fc=#666666>|</fc> %memory% <fc=#666666>|</fc><fc=#23aee1>%disku%</fc> <fc=#666666>|</fc> <fc=#ece87b> %volume% vol.</fc> <fc=#666666>|</fc> %battery%"

		--, template = "%StdinReader%  %dynnetwork%} %date% {<fc=#A8E123>%locks%</fc>  %multicpu% | %memory% | <fc=#7cac7a> %volume% </fc> volume | %battery%"
		-- general behavior
		, lowerOnStart =     True    -- send to bottom of window stack on start
		, hideOnStart =      False   -- start with window unmapped (hidden)
		, allDesktops =      True    -- show on all desktops
		, overrideRedirect = True    -- set the Override Redirect flag (Xlib)
		, pickBroadest =     False   -- choose widest display (multi-monitor)
		, persistent =       True    -- enable/disable hiding (True = disabled)
		, commands =
		[
			Run Com "sh" ["-c", "~/.xmonad/scripts/get_brightness.sh"] "brightness" 10

			,Run Com "sh" ["-c", "~/.xmonad/scripts/get-volume.sh"] "volume" 10	
			-- show ip
			,Run Com "sh" ["-c", "ip route get 8.8.8.8 | awk '{print $7}'"] "ip" 3600
			-- capslock on/off
			,Run Locks
			-- time and date indicator 
			--,Run Date           "<fc=#7cac7a>%H:%M \xf64f %d.%m.%y \xf133</fc> " "date" 10
			,Run Date           "<fc=#b8473d>\xf64f</fc> <fc=#b8473d>%H:%M</fc> <fc=#666666>:%S </fc>   <fc=#b8473d>\xf133 %d.%m</fc>" "date" 10
--			,Run Date           "<fc=#7cac7a>%H:%M:%S \xf64f </fc> " "date" 10
			-- disk space	
			,Run DiskU         [("/", "<fc=#666666> \xf7c9 hdd: <free> free </fc>")] [] 60

			-- network activity monitor (dynamic interface resolution)
			,Run DynNetwork     [ "--template" , "   <dev>  \xf0ab<rx>  \xf0aa<tx> "
			, "-S", "True"
			, "--Low"      , "4000000"       -- units: B/s
			, "--High"     , "15000000"       -- units: B/s
			, "--low"      , "#D0D0D0"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#A8E123"
			] 10

			-- cpu activity monitor
			--, Run MultiCpu       [ "--template" , "<fc=#7cac7a>\xf108  <total>%</fc>"
			, Run MultiCpu       [ "--template" , "<fc=#666666>\xf108  <total> %</fc>"
			--</fc>
			, "--Low"      , "25"         -- units: %
			, "--High"     , "85"         -- units: %
			, "--low"      , "#666666"
			, "--normal"   , "#666666"
			, "--high"     , "#b8473d"
			] 10

			-- memory usage monitor
			--, Run Memory  [ "-t" ," <fc=#c678dd>\xf233  <usedratio>%( <free> free, <cache> cache )</fc>"
			, Run Memory  [ "-t" ,"<fc=#666666> \xf233  <usedratio>%( <free> free, <cache> cache )</fc>"
			] 10
			-- battery monitor
			, Run Battery        [ "--template" , "<fc=#666666> <acstatus></fc>"
			, "--Low"      , "20"        -- units: %
			, "--High"     , "80"        -- units: %
			, "--low"      , "#b8473d"
			, "--normal"   , "#666666"
			, "--high"     , "#666666"

			, "--" -- battery specific options
			-- discharging status
			, "-o"	, "<left> % \xf578"
			-- AC "on" status
			, "-O"	, "<left> % \xf583"
			-- charged status
			, "-i"	, "<left> % \xf578"
			] 50
			,Run StdinReader
			]
}

