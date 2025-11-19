RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

player_ok() {
    "$@" >/dev/null 2>&1 &
    local pid=$!

    # espera 0.2s para saber se o processo morreu (erro) ou continua (ok)
    sleep 0.2

    if ! kill -0 "$pid" 2>/dev/null; then
        return 1  # morreu -> falhou
    fi

    kill "$pid" 2>/dev/null
    return 0  # funciona
}

playaudio() {
    local file="$1"

    [[ -f "$file" ]] || return 1

    # aplay
    if command -v aplay >/dev/null 2>&1; then
        if player_ok aplay "$file"; then
            nohup aplay "$file" >/dev/null 2>&1 &
            return 0
        fi
    fi

    # paplay
    if command -v paplay >/dev/null 2>&1; then
        if player_ok paplay "$file"; then
            nohup paplay "$file" >/dev/null 2>&1 &
            return 0
        fi
    fi

    # play (SoX)
    if command -v play >/dev/null 2>&1; then
        if player_ok play "$file"; then
            nohup play "$file" >/dev/null 2>&1 &
            return 0
        fi
    fi

    # ffplay
    if command -v ffplay >/dev/null 2>&1; then
        if player_ok ffplay -nodisp -autoexit -loglevel quiet "$file"; then
            ffplay -nodisp -autoexit -loglevel quiet "$file"
            return 0
        fi
    fi

    return 2  # nenhum player funcional
}


anime() {
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
s=0
menu() {
    title="$1"
    shift
    options=("$@")

    while true; do
        clear
        
        if [ $s -lt 0 ]; then
            s=0
        elif [ $s -gt $((${#options[@]} - 1)) ]; then
            s=$((${#options[@]} - 1)) 
        fi

        echo -e "$title\n"
        for i in "${!options[@]}"; do
            if [[ $s == $i ]]; then
                echo -e "\e[30;47m> ${options[i]}\e[0m"
            else
                echo -e "  ${options[i]}"
            fi
        done

        if [[ -n "$footer" ]]; then
            echo -e "\n$footer"
        fi

        read -rsn1 key
        if [[ -z $key ]]; then
            key=$'\n'
        elif [[ $key == $'\e' ]]; then
            read -rsn2 -t 0.01 rest
            key+="$rest"
        fi
        case $key in
            $'\e[A') s=$((s-1)) ;;
            $'\e[B') s=$((s+1)) ;;
            $'\e') exit 0;;
            $'\n'|$'\r') selected="$s"; break ;;
            *) ;;
        esac
    done
}


lecho() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lecho: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang')"
        exit 1
    fi

    local prompt
    [[ "$lang" == "1" ]] && prompt="$1"
    [[ "$lang" == "0" ]] && prompt="$2"

    echo "$prompt"
}

lechoe() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lechoe: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang')"
        exit 1
    fi

    local prompt
    [[ "$lang" == "1" ]] && prompt="$1"
    [[ "$lang" == "0" ]] && prompt="$2"

    echo -e "$prompt"
}

lprintf() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lprintf: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang')"
        exit 1
    fi

    local prompt
    [[ "$lang" == "1" ]] && prompt="$1"
    [[ "$lang" == "0" ]] && prompt="$2"

    printf "$prompt"
}

lreadp() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lreadp: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang')"
        exit 1
    fi

    local prompt
    [[ "$lang" == "1" ]] && prompt="$1"
    [[ "$lang" == "0" ]] && prompt="$2"

    if [[ -n $3 ]]; then
        declare -g "$3"
        read -r -p "$prompt" "$3"
    else
        read -r -p "$prompt"
    fi
}

lmenu() {
    if [[ -z "$lang" ]]; then
        echo "toybox.sh - lreadp: ${RED}TypeError:${NC} missing 'lang'."
        return 1
    fi

    local args=("$@")
    local titulo
    local final_opts=()
    footer=""

    # Título
    if [[ "$lang" == "1" ]]; then
        titulo="${args[0]}"
    else
        titulo="${args[1]}"
    fi

    # Opções + footer
    local i=2
    while (( i < ${#args[@]} )); do
        local en="${args[i]}"
        local pt="${args[i+1]}"

        if [[ "$en" == "@footer" ]]; then
            # Footer detectado
            if [[ "$lang" == "1" ]]; then
                footer="$pt"
            else
                footer="${args[i+2]}"
            fi
            break
        fi

        # Opção normal
        if [[ "$lang" == "1" ]]; then final_opts+=("$en")
        else final_opts+=("$pt")
        fi

        ((i+=2))
    done

    menu "$titulo" "${final_opts[@]}"
}
