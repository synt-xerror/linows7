#!/bin/bash

source ./toybox.sh

language

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

lechoe "\n  Bem-vindo à instalação do Linows 7$fUSER!\n" "\n  Welcome to Linows 7 installation$fUSER!\n"

lreadp "  Pressione [ENTER]: " "  Press [ENTER]: " choice

lechoe "\n${BLUE}>  Obrigado por testar! :D${NC}" "\n${BLUE}> Thank you for testing! :D${NC}"

exit