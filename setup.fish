#!/usr/bin/env fish

set -g target_dir						# active config location
set -g source_dir						# inactive config location
set -g actives							# active configs
set -g sources							# configs wait to be active
set -g selected							# configs to be active
set -g unselected						# configs to be unactive

# health check
if not type -q gum
	echo "$(set_color --bold red)Error$(set_color normal) 'gum' is required but not installed"
	echo "Install it from: https://github.com/charmbracelet/gum"
	exit 1
end

# parse/handle argument
argparse h/help t/target= s/source= -- $argv; or exit

if set -ql _flag_help
	echo "A simple script with interactive interface to easily apply/unapply configs"
	echo 
	echo "$(set_color --bold --underline)Usage:$(set_color normal) setup.fish"
	echo
	echo "$(set_color --bold --underline)Options:$(set_color normal)"
	echo -en "$(set_color --bold)  -t --target$(set_color normal)\t\t"
	echo "Directory path where links stored. Default to XDG_CONFIG_HOME, or HOME/.config as fallback"
	echo -en "$(set_color --bold)  -s --source$(set_color normal)\t\t"
	echo "Directory path where actual configs stored. Default to where setup.fish locate."
	echo -en "$(set_color --bold)  -h --help$(set_color normal)\t\t"
	echo "Print this"

	exit 0
end

if set -ql _flag_target
	set -g target_dir $_flag_target[1]
end

if set -ql _flag_source
	set -g source_dir $_flag_source[1]
end

# init variables
if test -z $target_dir
	if set -qg XDG_CONFIG_HOME
		set -g target_dir $XDG_CONFIG_HOME
	else if test -O $HOME/.config
		set -g target_dir $HOME/.config
	else
		gum log --level="error" "Can't resolve target directory"
		exit 1
	end
end

test -d $target_dir; or begin
	gum log --level="error" "$target_dir is not a directory"
	exit 1
end

if test -z $source_dir
	set -g source_dir $(path resolve $(path dirname $(status filename)))
end

test -d $source_dir; or begin
	gum log --level="error" "$source_dir is not a directory"
	exit 1
end

for file in $target_dir/*
	if test -d $file; or test -L $file
		set -a actives $(path basename $file)
	end
end

for file in $source_dir/*
	if test -d $file
		set -a sources $(path basename $file)
	end
end

set -g selected \
	$(GUM_CHOOSE_SELECTED=$(string join ',' $actives) \
	gum choose --no-limit --header="Availiable Configs" \
	--selected-prefix="  " --unselected-prefix="  " \
	--cursor-prefix="  " \
	$sources; or exit 1)

for config in $sources
	not contains $config $selected
	and set -a unselected $config
end

# main logic
for config in $selected
	# if already active
	#  if is directory, delete and use symbolic link
	#  if is already symbolic link, do nothing
	# otherwise, create symbolic link
	if test -z $config
		break
	end

	if contains $config $actives
		if test -L $target_dir/$config
			gum log --level "info" "$config already installed, skipped"
		else if test -d $target_dir/$config
			gum log --level="info" "$target_dir/$config is a directory, replace it with symbolic link?"
			gum confirm
				and begin 
					rm -rf $target_dir/$config
					and ln -s $source_dir/$config $target_dir/$config
					and echo "  replacement complete"
					or gum log --level="error" "Failed to replace $target_dir/$config"
				end
				or echo "  skipped"
		else
			gum log --level="warn" "unknown type $target_dir/$config, skipped"
		end
	else
		ln -s $source_dir/$config $target_dir/$config
		and gum log --level="info" "Installed $config"
		or gum log --level="error" "Failed to install $source_dir/$config"
	end
end

for config in $unselected
	# if active but not selected
	#   if active is a symbolic link, remove it
	#   otherwise, ignore silently
	# otherwise ignore silently
	contains $config $actives
	and test -L $target_dir/$config
	and rm $target_dir/$config
	and gum log --level "info" "Uninstalled $config"
end

exit 0
