#!/bin/bash

#############################################################################################################################################################################
#███████ ██    ██ ███    ██  ██████ ████████ ██  ██████  ███    ██ ███████
#██      ██    ██ ████   ██ ██         ██    ██ ██    ██ ████   ██ ██
#█████   ██    ██ ██ ██  ██ ██         ██    ██ ██    ██ ██ ██  ██ ███████
#██      ██    ██ ██  ██ ██ ██         ██    ██ ██    ██ ██  ██ ██      ██
#██       ██████  ██   ████  ██████    ██    ██  ██████  ██   ████ ███████
#############################################################################################################################################################################
HELP() #MOSTRA IL MESSAGGIO DI AIUTO
{
    echo "Questo script abilita il palm rejection"
    echo
    echo "Opzioni:"
    echo "-h --help            Mostra questo messaggio di aiuto"
    echo ""
    echo "-m --monitor         Attiva la modalità monitor"
    echo ""
}

MONITOR()
{
    DISABLED=0
    while true
    do
        if [ "$(xinput --query-state 'MICROSOFT SAM Stylus Pen (0)' | grep Proximity= | sed 's/.*Proximity=//')" == "In" ];
        then
            echo "RILEVATO!"
            if [ "$DISABLED" == "0" ];
            then
                xinput disable 'Atmel Atmel maXTouch Digitizer'
                DISABLED=1
            fi
        else
            echo "non rilevato"
            if [ "$DISABLED" == "1" ];
            then
                xinput enable 'Atmel Atmel maXTouch Digitizer'
                DISABLED=0
            fi
        fi
        echo "-------------------------"
        sleep 0.1
    done
}
#############################################################################################################################################################################
#███    ███  █████  ██ ███    ██
#████  ████ ██   ██ ██ ████   ██
#██ ████ ██ ███████ ██ ██ ██  ██
#██  ██  ██ ██   ██ ██ ██  ██ ██
#██      ██ ██   ██ ██ ██   ████
#############################################################################################################################################################################
if [ ! -z "$1" ] && [ -z "$2" ];
then
    case $1 in

    -h|--help)
        HELP
        ;;

    -m|--monitor)
        MONITOR
        ;;

    *)
        echo "Usa -h o --help per avere la lista delle opzioni valide e sapere cosa fa il programma"
        ;;
    esac

elif [ -z "$1" ]
then
    echo "Usa -h o --help per avere la lista delle opzioni valide e sapere cosa fa il programma"
fi
#############################################################################################################################################################################
