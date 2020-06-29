# All the good stuff is in ~/.profile.d
for FILE in `ls ~/.profile.d`; do
  source ~/.profile.d/${FILE}
done

if [ -f ~/.profile_work ]; then
  source ~/.profile_work
fi

#AWSume alias to source the AWSume script
alias awsume=". awsume"

#Auto-Complete function for AWSume

_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsumepy --rolesusers)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume

