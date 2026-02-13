# ===============================
# Environment Variables
# ===============================
# Basics
set -gx TERM "xterm-256color"
set -gx COLORTERM "truecolor"
set -gx EDITOR "nvim"
set -gx VISUAL "$EDITOR"
set -gx PAGER "less"
set -gx MANPAGER "less -R"

# XDG supports
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# Starship support
set -gx STARSHIP_CONFIG /home/dousbao/.config/starship/starship.toml

# Disable QS reload popup
set -gx QS_NO_RELOAD_POPUP 1

# Rust/Cargo support
fish_add_path $HOME/.cargo/bin/

# ===============================
# Fish Variables
# ===============================
# Enable Vi mode
set -g fish_key_bindings fish_vi_key_bindings

# Disable
set -g fish_greeting ""

# ===============================
# Prompt
# ===============================
# By starship
starship init fish | source

# ===============================
# CLIs
# ===============================
# Fzf
fzf --fish | source
set -gx FZF_DEFAULT_OPTS "--height 40% --layout reverse --style minimal"
source "$HOME/.config/fish/fzfcolor.fish"

# Zoxide
zoxide init --cmd cd fish | source
set -gx _ZO_FZF_OPTS $FZF_DEFAULT_OPTS

# ===============================
# Alias
# ===============================
# Detailed tree-like list
alias ll="eza --long --tree --level=1 \
	--git --icons --color=always \
	--all --smart-group --time-style='iso' \
	--group-directories-first --created \
	--changed --sort=name"

# Simple list
alias l="eza --icons --color=always \
	--group-directories-first \
	--sort=name --all"

# ===============================
# Functions
# ===============================
# Proxy controller
# usage:
#   on -> turn on proxy
#   off -> turn off proxy
#   toggle -> toggle on/off
function proxyctl
	test $(count $argv) -ne 1; and return 1

	switch $argv[1]
		case "on"
			set -gx http_proxy "http://127.0.0.1:7890"
			set -gx https_proxy "http://127.0.0.1:7890"
			set -gx all_proxy "socks5://127.0.0.1:7891"
		case "off"
			set -e http_proxy
			set -e https_proxy
			set -e all_proxy
		case "toggle"
			if set -qg http_proxy
				proxyctl off
			else
				proxyctl on
			end
		case "*"
			echo -n "$(set_color --bold red)Error:$(set_color normal)"
			echo -n " unknown paramater "
			echo "$(set_color --underline)$argv[1]$(set_color normal)"
	end

	return 0
end

# Signal handler
# Reload fzf scheme on USR1
function reload_fzf_scheme --on-signal USR1
	source $HOME/.config/fish/fzfcolor.fish
end
