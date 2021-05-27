#xmonad
cp ~/.xmonad/xmonad.hs ./.xmonad/
cp ~/.xmonad/xmobar.hs ./.xmonad/
cp ~/.xmonad/scripts ./.xmonad/ -r

#tmux
cp ~/.tmux.conf .
#oh-my-bash
cp ~/.oh-my-bash/themes/font/font.theme.sh ./.oh-my-bash/themes/font/font.theme.sh
cp ~/.bashrc ./.oh-my-bash/
#nvim
cp ~/.config/nvim/init.vim ./nvim/
cp ~/.config/nvim/mappings.vim ./nvim/
cp -r ~/.config/nvim/colors/gruvbox.vim ./nvim/colors/gruvbox.vim
#dunst
cp ~/.config/dunst/notify ./dunst/
cp ~/.config/dunst/dunstrc ./dunst/

