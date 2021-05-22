Config { 
	-- appearance
		font =         "xft:Ubuntu Nerd Font:pixelsize=15:antialias=true"
		, bgColor =      "#1C1D19"
		, fgColor =      "#D0D0D0"
		, position =     Bottom

		-- layout
		, sepChar =  "%"   -- delineator between plugin names and straight text
		, alignSep = "}{"  -- separator between left-right alignment
		, template = "%StdinReader% } {<fc=#e1234f>%locks%</fc>    %multicpu% <fc=#666666>|</fc> %memory% <fc=#666666>|</fc><fc=#23aee1>%disku%</fc><fc=#666666>|</fc> <fc=#ece87b> %volume% vol.</fc> <fc=#666666>|</fc> %battery%"

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
			Run Com "sh" ["-c", "~/.xmonad/get-volume.sh"] "volume" 10	
			-- show ip
			,Run Com "sh" ["-c", "ip route get 8.8.8.8 | awk '{print $7}'"] "ip" 3600
			-- capslock on/off
			,Run Locks
			-- time and date indicator 
			,Run Date           "<fc=#7cac7a>%H:%M \xf64f %d.%m.%y \xf133</fc> " "date" 10
			-- disk space	
			,Run DiskU         [("/", " \xf7c9 hdd: <free> free ")] [] 60

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
			, Run MultiCpu       [ "--template" , "<fc=#7cac7a>\xf108  <total>%</fc>"
			--</fc>
			, "--Low"      , "25"         -- units: %
			, "--High"     , "85"         -- units: %
			, "--low"      , "#7cac7a"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#b8473d"
			] 10

			-- memory usage monitor
			, Run Memory  [ "-t" ," <fc=#c678dd>\xf233  <usedratio>%( <free> free, <cache> cache )</fc>"
			] 10
			-- battery monitor
			, Run Battery        [ "--template" , " <acstatus>"
			, "--Low"      , "15"        -- units: %
			, "--High"     , "80"        -- units: %
			, "--low"      , "#b8473d"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#7cac7a"

			, "--" -- battery specific options
			-- discharging status
			, "-o"	, "<left>% \xf578"
			-- AC "on" status
			, "-O"	, "<left>% \xf583"
			-- charged status
			, "-i"	, "<left>% \xf578"
			] 50
			,Run StdinReader
			]
}

