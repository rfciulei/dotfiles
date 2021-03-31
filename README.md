# paths

nvim: ~/.config/nvim/init.vim

bashrc: ~/.bashrc

firefox: /home/$USER/.mozilla/firefox/ahk481vp.default-release/chrome/userChrome.css
	go to about:config and set toolkit.legacyUserProfileCustomizations.stylesheets to True

xmonad:
	/home/$USER/.xmonad/
gsettings for xmonad:
	xinput list
	xinput list-props $id (to enable natural scrolling/or tapping for touchpad)
	xintput set-prop $id

tmux: /home/$USER/.tmux.conf
