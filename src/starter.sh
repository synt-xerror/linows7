source ./toybox.sh
source ./index.sh

lang=$(< ./lang)

lmenu \
    "@title" \
    "Chosen edition: Linows 7 Starter" "Edição escolhida: Linows 7 Starter" \
    "@title" \
"       _                 _                
      ( )_              ( )_              
  ___ | ,_)   _ _  _ __ | ,_)   __   _ __ 
/',__)| |   /'_\` )( '__)| |   /'__\`\( '__)
\__, \| |_ ( (_| || |   | |_ (  ___/| |   
(____/\`\__)\`\__,_)(_)   \`\__)\`\____)(_)   " ":" \
    "@title" \
"\nAre you sure?" "\nTem certeza?" \
    "Yes" "Sim" \
    "No" "Não"

[[ "$selected" == 1 ]] && versions
