Config { 
	-- appearance
		font =         "xft:Ubuntu Nerd Font:pixelsize=14:antialias=true"
		, bgColor =      "#1C1D19"
		, alpha = 1
		, fgColor =      "#D0D0D0"
		, position =    Top 

		-- layout
		, sepChar =  "%"   -- delineator between plugin names and straight text
		, alignSep = "}{"  -- separator between left-right alignment
		, template = "%date% } %StdinReader% {<fc=#b8473d>%locks%</fc> <fc=#666666> | </fc><fc=#3db87d>%ip%</fc><fc=#474747> | </fc> %multicpu% <fc=#474747>|</fc> %memory% <fc=#474747>|</fc>%disku% <fc=#666666> %volume%<fc=#81A1C1></fc></fc><fc=#666666> | </fc>%battery%"
		--, template = "%StdinReader% } %date% {<fc=#b8473d>%locks%</fc>   %multicpu% <fc=#474747>|</fc> %memory% <fc=#474747>|</fc>%disku% <fc=#474747>|</fc><fc=#666666> %volume% <fc=#3db4b8>vol.</fc></fc> <fc=#666666>|</fc> %battery% "

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
			,Run Com "sh" ["-c", "ip route get 8.8.8.8 | awk '{print $7}'"] "ip" 10 
			-- capslock on/off
			,Run Locks
			-- time and date indicator 
			--,Run Date           "<fc=#7cac7a>%H:%M \xf64f %d.%m.%y \xf133</fc> " "date" 10
			,Run Date           "<fc=#3db87d>\xf64f</fc> <fc=#3db87d>%H:%M</fc> <fc=#666666>:%S </fc>   <fc=#3db4b8>\xf133 %d.%m.%y</fc>" "date" 10
--			,Run Date           "<fc=#81A1C1>\xf64f</fc> <fc=#81A1C1>%H:%M</fc> <fc=#666666>:%S </fc>" "date" 10
--			,Run Date           "<fc=#7cac7a>%H:%M:%S \xf64f </fc> " "date" 10
			-- disk space	
			,Run DiskU         [("/", "<fc=#3db4b8> \xf7c9</fc><fc=#666666> <free><fc=#474747> | </fc><fc=#3db4b8>\xfa7d</fc></fc>")] [] 60

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
			, Run MultiCpu       [ "--template" , "<fc=#3db4b8>\xf108</fc><fc=#666666>  <total> %</fc>"
			--</fc>
			, "--Low"      , "25"         -- units: %
			, "--High"     , "85"         -- units: %
			, "--low"      , "#666666"
			, "--normal"   , "#666666"
			, "--high"     , "#b8473d"
			] 10

			-- memory usage monitor
			--, Run Memory  [ "-t" ," <fc=#c678dd>\xf233  <usedratio>%( <free> free, <cache> cache )</fc>"
			--, Run Memory  [ "-t" ," <fc=#81A1C1>\xf233</fc> <fc=#666666> <usedratio>%( <free> free, <cache> cache )</fc>"
			, Run Memory  [ "-t" ," <fc=#3db4b8>\xf233</fc> <fc=#666666> <usedratio>% </fc>"

			] 10
			-- battery monitor
			, Run Battery        [ "--template" , "<fc=#666666> <acstatus></fc>"
			, "--Low"      , "20"        -- units: %
			, "--High"     , "80"        -- units: %
			, "--low"      , "#3db4b8"
			, "--normal"   , "#666666"
			, "--high"     , "#666666"

			, "--" -- battery specific options
			-- discharging status
			, "-o"	, "<fc=#81A1C1>\xf578</fc><left> % "
			-- AC "on" status
			, "-O"	, "<fc=#81A1C1>\xf583</fc><left> % "
			-- charged status
			, "-i"	, "<fc=#81A1C1>\xf578</fc><left> % "
			] 50
			,Run StdinReader
			]
}

