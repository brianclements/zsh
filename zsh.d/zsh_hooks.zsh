function precmd {
    # vcs_info
    # Put the string "hostname::/full/directory/path" in the title bar:
    echo -ne "\e]2;$PWD\a"

    # Put the parentdir/currentdir in the tab
    echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
}

# Ignore this in tty, it copies the input to output, enabled it just in X
# if [[ -n "$GDMSESSION" ]]; then
    # function set_running_app {
        # printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
    # }
    # function preexec {
        # set_running_app
    # }
    # function postexec {
        # set_running_app
    # }
# fi

# Change directory hook
function chpwd() {
    meta_project_check # update specific env-vars for virtualenvwrapper
}
