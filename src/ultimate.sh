#!/bin/bash

source ./toybox.sh
source ./index.sh

lang=$(< ./lang)

lmenu \
    "@title" \
    "Chosen edition: Linows 7 Ultimate" "Edição escolhida: Linows 7 Ultimate" \
    "@title" \
"   _  _    __   _     __                         _              
  FJ  L]   LJ  FJ_    LJ   _ _____      ___ _   FJ_      ____   
 J |  | L  FJ J  _|       J '_  _ \`,   F __\` L J  _|    F __ J  
 | |  | | J  L| |-'   FJ  | |_||_| |  | |--| | | |-'   | _____J 
 F L__J J J  LF |__-.J  L F L || J J  F L__J J F |__-. F L___--.
J\______/FJ__L\_____/J__LJ__L LJ J__LJ\____,__L\_____/J\______/F
 J______F |__|J_____F|__||__L LJ J__| J____,__FJ_____F J______F " ":" \
    "@title" \
"\nAre you sure?" "\nTem certeza?" \
    "Yes" "Sim" \
    "No" "Não"

[[ "$selected" == 1 ]] && versions

loading spin 0.1 2

clear

lecho "Inicializando..." "Initializing..."
chmod -R +x ../theme
