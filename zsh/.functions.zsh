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