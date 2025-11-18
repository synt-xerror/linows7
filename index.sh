#!/bin/bash

playwav() {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        return 1  # arquivo não existe
    fi

    if command -v aplay >/dev/null 2>&1; then
        nohup aplay "$file" >/dev/null 2>&1 &

    elif command -v paplay >/dev/null 2>&1; then
        nohup paplay "$file" >/dev/null 2>&1 &

    elif command -v play >/dev/null 2>&1; then
        nohup play "$file" >/dev/null 2>&1 &

    elif command -v ffplay >/dev/null 2>&1; then
        ffplay -nodisp -autoexit -loglevel quiet "$file"

    else
        return 2  # nenhum player disponível
    fi
}

animation() {
    frames=("$@")
    time=${frames[-1]}

    for frame in "${frames[@]:0:${#frames[@]}-1}"; do 
        if [[ $frame != $time  ]]; then
            printf "$frame"
            sleep $time
            clear
        fi
    done
}


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

if echo "$USER" >/dev/null 2>&1; then
    fUSER=", $USER"
else
    fUSER=""
fi

clear

sleep 0.5

animation "Starting" "Starting." "Starting.." "Starting..." 0.5 

sleep 0.5
echo -e "      ${RED}        ,.=:!!t3Z3z.,"
echo -e "      ${RED}       :tt:::tt333EE3"
echo -e "      ${RED}       Et:::ztt33EEEL${GREEN} @Ee.,      ..,"
echo -e "      ${RED}      ;tt:::tt333EE7${GREEN} ;EEEEEEttttt33#"
echo -e "      ${RED}     :Et:::zt333EEQ.${GREEN} SEEEEEttttt33QL"
echo -e "      ${RED}     it::::tt333EEF${GREEN} @EEEEEEttttt33F"
echo -e "      ${RED}    ;3=*^\`\`\`\"*4EEV${GREEN} :EEEEEEttttt33@."
echo -e "      ${BLUE}    ,.=::::!t=., ${RED}\` ${GREEN}@EEEEEEtttz33QF"
echo -e "      ${BLUE}   ;::::::::zt33)   ${GREEN}\"4EEEtttji3P*"
echo -e "      ${BLUE}  :t::::::::tt33.${YELLOW}:Z3z..  ${GREEN}\`\` ${YELLOW},..g."
echo -e "      ${BLUE}  i::::::::zt33F${YELLOW} AEEEtttt::::ztF"
echo -e "      ${BLUE} ;:::::::::t33V${YELLOW} ;EEEttttt::::t3"
echo -e "      ${BLUE} E::::::::zt33L ${YELLOW}@EEEtttt::::z3F"
echo -e "      ${BLUE}{3=*^\`\`\`\"*4E3)${YELLOW} ;EEEtttt:::::tZ\`"
echo -e "${NC}    _      _   ${BLUE}    \`${YELLOW} :EEEEtttt::::z7${NC}   ______ "
echo -e "   | |    (_) ${YELLOW}         \"VEzjt:;;z>*\`${NC}  |____  |"
echo -e "   | |     _ _ __   _____      _____      / / "
echo -e "   | |    | | '_ \ / _ \ \ /\ / / __|    / /  "
echo -e "   | |____| | | | | (_) \ V  V /\__ \   / /   "
echo -e "   |______|_|_| |_|\___/ \_/\_/ |___/  /_/    "

playwav startup.wav
sleep 1

echo -e "\n  Welcome to Linows 7 installation$fUSER!\n"
sleep 1

read -p "  Press ENTER: "

echo -e "\n\e[94m > Obrigado por testar! :D \e[0m \n"
