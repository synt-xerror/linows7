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

language() {
    if [[ -f ./lang ]]; then
        lang=$(cat ./lang)
    else
        s=0
        options() {
            local args=("$@")

            for i in "${!args[@]}"; do
                if [[ $s == $i ]]; then
                    echo -e "\e[30;47m> ${args[i]}\e[0m"
                else
                    echo -e "  ${args[i]}"
                fi
            done
        }

        while true; do
            clear
            # evita ficar preso
            if [ $s -lt 0 ]; then
                s=0
            elif [ $s -gt 1 ]; then
                s=1
            fi

            echo -e "Before continue, select a language."
            echo -e "Antes de continuar, selecione um idioma.\n"
            options "English (US)" "Português (Brasil)"

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
                $'\n'|$'\r') selected="$s"; break ;;
                $'\e') echo "Saindo..."; break ;;
                *) ;;
            esac
        done

        if [[ $selected == "0" ]]; then
            lang="en-us"
        elif [[ $selected == "1" ]]; then
            lang="pt-br"
        fi
        echo "$lang" > ./lang
    fi
}

lecho() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lecho: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang'). Have you run function 'language' before?"
        exit 1
    fi

    local prompt
    [[ "$lang" == "pt-br" ]] && prompt="$1"
    [[ "$lang" == "en-us" ]] && prompt="$2"

    echo "$prompt"
}

lechoe() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lechoe: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang'). Have you run function 'language' before?"
        exit 1
    fi

    local prompt
    [[ "$lang" == "pt-br" ]] && prompt="$1"
    [[ "$lang" == "en-us" ]] && prompt="$2"

    echo -e "$prompt"
}

lprintf() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lprintf: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang'). Have you run function 'language' before?"
        exit 1
    fi

    local prompt
    [[ "$lang" == "pt-br" ]] && prompt="$1"
    [[ "$lang" == "en-us" ]] && prompt="$2"

    printf "$prompt"
}

lreadp() {
    if [[ -z "$lang" ]]; then
        echo -e "toybox.sh - lreadp: ${RED}TypeError:${NC} Cannot read properties of null (reading 'lang'). Have you run function 'language' before?"
        exit 1
    fi

    local prompt
    [[ "$lang" == "pt-br" ]] && prompt="$1"
    [[ "$lang" == "en-us" ]] && prompt="$2"

    if [[ -n $3 ]]; then
        declare -g "$3"
        read -r -p "$prompt" "$3"
    else
        read -r -p "$prompt"
    fi
}
