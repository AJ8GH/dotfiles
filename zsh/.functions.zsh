#===========#
# Functions #
#===========#

printColors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# Git
gac() {
  git add .
  git commit -m "$1"
}

gacp() {
  git add .
  git commit -m "$1"
  git push
}

gafp() {
  echo 'Amend last commit and force push? (y/n)'
  read -r reply
  if [[ $reply == 'y' ]]
  then
    git add .
    msg="$1"
    if [[ -z "$msg" ]]
    then
      git commit --amend --no-edit
    else
      git commit --amend -m "$msg"
    fi
    git push --force
  else
    echo 'Amend commit aborted'
  fi
}

gre() {
  n="$1"
  if [[ -z "$n" ]]
  then
    n='1'
  fi
  git reset HEAD~"${n}"
}

# Fleet
nf() {
  mkdir "$1"
  cd "$1" || return
  cp ~/.config/.editorconfig .
  fleet .
}

trash() {
  file="$1"
  trash="mv -f $file ~/.Trash/"
}

# Render markdown file and pipe to less
rmd() {
  file="$1"
  glow $file -p -s dracula
}
