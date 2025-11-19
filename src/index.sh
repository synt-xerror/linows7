#!/bin/bash

source ./toybox.sh


if [[ $(cat ./lang) == "" || $1 == "-reset" ]]; then
    rm ./lang
fi

if [[ ! -f ./lang ]]; then
    menu \
        "Before continuing, select a language\nAntes de continuar, selecione um idioma" \
        " English (US)" \
        " Português (BR)"

    echo "$selected" > ./lang
fi

lang=$(cat ./lang)

if [[ -n "$USER" ]]; then
    fUSER=", $USER"
else
    fUSER=""
fi

clear

sleep 0.5
echo -e "${RED}              ,.=:!!t3Z3z.,"
echo -e "${RED}             :tt:::tt333EE3"
echo -e "${RED}             Et:::ztt33EEEL${GREEN} @Ee.,      ..,"
echo -e "${RED}            ;tt:::tt333EE7${GREEN} ;EEEEEEttttt33#"
echo -e "${RED}           :Et:::zt333EEQ.${GREEN} SEEEEEttttt33QL"
echo -e "${RED}           it::::tt333EEF${GREEN} @EEEEEEttttt33F"
echo -e "${RED}          ;3=*^\`\`\`\"*4EEV${GREEN} :EEEEEEttttt33@."
echo -e "${BLUE}          ,.=::::!t=., ${RED}\` ${GREEN}@EEEEEEtttz33QF"
echo -e "${BLUE}         ;::::::::zt33)   ${GREEN}\"4EEEtttji3P*"
echo -e "${BLUE}        :t::::::::tt33.${YELLOW}:Z3z..  ${GREEN}\`\` ${YELLOW},..g."
echo -e "${BLUE}        i::::::::zt33F${YELLOW} AEEEtttt::::ztF"
echo -e "${BLUE}       ;:::::::::t33V${YELLOW} ;EEEttttt::::t3"
echo -e "${BLUE}       E::::::::zt33L ${YELLOW}@EEEtttt::::z3F"
echo -e "${BLUE}      {3=*^\`\`\`\"*4E3)${YELLOW} ;EEEtttt:::::tZ\`"
echo -e "${NC}    _      _   ${BLUE}    \`${YELLOW} :EEEEtttt::::z7${NC}   ______ "
echo -e "   | |    (_) ${YELLOW}         \"VEzjt:;;z>*\`${NC}  |____  |"
echo -e "   | |     _ _ __   _____      _____      / / "
echo -e "   | |    | | '_ \ / _ \ \ /\ / / __|    / /  "
echo -e "   | |____| | | | | (_) \ V  V /\__ \   / /   "
echo -e "   |______|_|_| |_|\___/ \_/\_/ |___/  /_/ "
echo -e "\n${YELLOW}  v0.0.2-alpha ${NC}"

playaudio startup.wav

sleep 1

lechoe \
    "\n  Bem-vindo à instalação do Linows 7$fUSER!\n" \
    "\n  Welcome to Linows 7 installation$fUSER!\n"

lreadp \
    "  Pressione [ENTER]: " \
    "  Press [ENTER]: "

clear

lmenu \
  "Escolha a versão" "Choose the version" \
  "Linows 7 Starter" "Linows 7 Starter" \
  "Linows 7 Home" "Linows 7 Home" \
  "Linows 7 Premium" "Linows 7 Premium" \
  "Linows 7 Ultimate" "Linows 7 Ultimate" \
  "@footer" \
  "Dúvidas? Saiba qual escolher em wiki.linows7.org/versions" \
  "Not sure? Find out which one to choose at wiki.linows7.org/versions"

selected=$(($selected+1))

lechoe \
    "\n > Você escolheu: $selected\n" \
    "\n > You choose: $selected\n"
    