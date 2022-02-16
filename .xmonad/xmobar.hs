Config { 
	    -- appearance
		font       =      "xft:Ubuntu Nerd Font:pixelsize=14:antialias=true"
		, bgColor  =      "#1C1D19"
		, alpha    =      1
		, fgColor  =      "#D0D0D0"
		, position =      Bottom 

		-- layout
		, sepChar =  "%"   -- delineator between plugin names and straight text
		, alignSep = "}{"  -- separator between left-right alignment
		, template = "<fc=#474747> | </fc> %multicpu% <fc=#474747>|</fc> %memory% <fc=#474747>|</fc>%disku%<fc=#666666> %volume%</fc><fc=#474747> | </fc><fc=#FDB924>%ip%</fc><fc=#474747> | </fc>} %StdinReader% { <fc=#e1234f>%locks%</fc>  <fc=#474747> | </fc>%battery%<fc=#666666>| </fc> %date% <fc=#3db4b8>%dayname%</fc> <fc=#666666> | </fc>"

		-- general behavior
		, lowerOnStart =     True    -- send to bottom of window stack on start
		, overrideRedirect = True    -- set the Override Redirect flag (Xlib)
	    , commands =
		[
			-- show volume
			Run Com "sh" ["-c", "~/.xmonad/scripts/get-volume.sh"] "volume" 10	

			-- show ip
			,Run Com "sh" ["-c", "ip route get 8.8.8.8 | awk '{print $7}'"] "ip" 10 
			,Run DynNetwork     [ "--template" , "<dev>"
			, "-S", "True"
			, "--Low"      , "4000000"       -- units: B/s
			, "--High"     , "15000000"       -- units: B/s
			, "--low"      , "#D0D0D0"
			, "--normal"   , "#7cac7a"
			, "--high"     , "#A8E123"
			] 10


			-- capslock on/off
			,Run Locks

			-- time and date indicator 
			-- INCLUDE DATE VERSION
			,Run Date           "<fc=#3db87d>\xf64f</fc> <fc=#3db87d>%H:%M</fc> <fc=#666666>:%S </fc><fc=#666666> | </fc> <fc=#3db4b8>\xf133 %d.%m.%y</fc> " "date" 10
			-- show volume
			,Run Com "sh" ["-c", "~/.xmonad/scripts/get_day_name.sh"] "dayname" 10	

			-- disk space	
			,Run DiskU         [("/", "<fc=#3db4b8> \xf7c9</fc><fc=#666666> <free><fc=#474747> | </fc><fc=#3db4b8>\xfa7d</fc></fc>")] [] 60

			-- cpu activity monitor
			, Run MultiCpu       [ "--template" , "<fc=#3db4b8>\xf108</fc><fc=#666666>  <total> %</fc>"
			--</fc>
			, "--Low"      , "25"         -- units: %
			, "--High"     , "85"         -- units: %
			, "--low"      , "#666666"
			, "--normal"   , "#666666"
			, "--high"     , "#b8473d"
			] 10

			-- memory usage monitor
			-- Run Memory  [ "-t" ," <fc=#81A1C1>\xf233</fc> <fc=#666666> <usedratio>%( <free> free, <cache> cache )</fc>"
			, Run Memory  [ "-t" ," <fc=#3db4b8>\xf233</fc> <fc=#666666> <usedratio>% </fc>"

			] 10

			-- battery monitor
			, Run Battery        [ "--template" , "<fc=#666666><acstatus></fc>"
			, "--Low"      , "20"        -- units: %
			, "--High"     , "80"        -- units: %
			, "--low"      , "#b8473d"
			, "--normal"   , "#666666"
			, "--high"     , "#666666"

			, "--" -- battery specific options
			-- discharging status
			, "-o"	, "<fc=#3db4b8>\xf578</fc><left> % "
			-- AC "on" status
			, "-O"	, "<fc=#3db4b8>\xf583</fc><left> % "
			-- charged status
			, "-i"	, "<fc=#3db4b8>\xf578</fc><left> % "
			] 50

			-- workspaces
			,Run StdinReader
		]
}

