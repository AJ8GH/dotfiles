#===========#
# Functions #
#===========#

printColors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# Git
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
    git commit --amend -m "$1"
    git push --force
  else
    echo 'Amend commit aborted'
  fi
}

# Fleet
nf() {
  mkdir "$1"
  cd "$1" || return
  cp ~/.config/.editorconfig .
  fleet .
}
