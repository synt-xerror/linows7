source ./toybox.sh
source ./index.sh

lang=$(< ./lang)

lmenu \
    "@title" \
    "Chosen edition: Linows 7 Home" "Edição escolhida: Linows 7 Home" \
    "@title" \
" __                                    
/\ \                                   
\ \ \___     ___     ___ ___      __   
 \ \  _ \`\  / __\`\ /' __\` __\`\  /'__\`\ 
  \ \ \ \ \/\ \L\ \/\ \/\ \/\ \/\  __/ 
   \ \_\ \_\ \____/\ \_\ \_\ \_\ \____\\
    \/_/\/_/\/___/  \/_/\/_/\/_/\/____/" ":" \
    "@title" \
"\nAre you sure?" "\nTem certeza?" \
    "Yes" "Sim" \
    "No" "Não"

[[ "$selected" == 1 ]] && versions