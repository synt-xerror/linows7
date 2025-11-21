source ./toybox.sh
source ./index.sh

lang=$(< ./lang)

lmenu \
    "@title" \
    "Chosen edition: Linows 7 Premium" "Edição escolhida: Linows 7 Premium" \
    "@title" \
"   ___                    _                   
  / _ \_ __ ___ _ __ ___ (_)_   _ _ __ ___    
 / /_)/ '__/ _ \ '_ \` _ \| | | | | '_ \` _ \\
/ ___/| | |  __/ | | | | | | |_| | | | | | |_ 
\/    |_|  \___|_| |_| |_|_|\__,_|_| |_| |_(_)" ":" \
    "@title" \
"\nAre you sure?" "\nTem certeza?" \
    "Yes" "Sim" \
    "No" "Não"

[[ "$selected" == 1 ]] && versions