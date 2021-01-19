# ====================================================================
# PROMPT MAGIC
# ====================================================================

# wow what a cool prompt. Unfortunately it causes issues because terminal doesn't know how to deal with the extra
# length unicode characters. I'll deal with it tho...
export PS1="\W🔥 ⚔️ 🔥  "

# this does a bunch of stuff to add git prompt stuff - see https://github.com/synacor/gitprompt
#export PS0='\[\e[0;31m\][\t]\[\e[1m\]\[\e[0;1m\][\W]\[\e[30;1m\e[0m\]%{[\e[0;31m%b\[\e[0m\]%c%u%f%t\[\e[0m\]]%}%{[\[\e[0m\]%B%A%F\[\e[30;1m\]]%}\[\e[0m\]dave\$ '
#export PS0='\[\e[0;31m\][\t]\[\e[1m\]\[\e[0;1m\][\W]\[\e[30;1m\]%{[\[%f%c%u%t\]\e[0;31m%b\[\e[0m\]]%}\[\e[0m\]dave\$ '

#export PROMPT_COMMAND=$PROMPT_COMMAND';export PS1=$(gitprompt.pl c=\+ u=\~ f=\* A=/ B=\\\\ F=\ \>\> statuscount=1)'

# ====================================================================
# CUSTOM ALIASES
# ====================================================================

# I like this command better than ls
alias ll='ls -la'

# same as 'tree' but removes all the emacs files
alias treee='tree -I "*~"'

# uses a newer version of emacs than the default terminal one
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# ====================================================================
# JAVA STUFF
# ====================================================================

# specifies a very specific version of the jdk to be the default
function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'

    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi

    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# set the default version of java. This helps with clojure projects that don't like other versions
setjdk 1.8

# ====================================================================
# Node stuffz
# ====================================================================

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# ====================================================================
# Dockerz thingz
# ====================================================================

alias enhance='function ne() { docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`"; }; ne'

# ====================================================================
# FINAL THINGS THAT SHOULD BE AT THE END
# ====================================================================

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
