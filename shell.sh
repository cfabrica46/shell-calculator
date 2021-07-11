#!/bin/bash

function help() {
    cat <<limite
SYNOPSIS
    $0 [NUMBER_1] [OPERATOR] [NUMBER_2]

DESCRIPTION
    Returns the result of the arithmetic operation
    betwen NUMBER_1 and NUMBER_2

    OPERATOR can be any of these options:
        + addition
        - subtract
        x multiplication
        / division

RETURN'S CODES
    1 If the numbers of parameters is not 3 
    2 If NUMBER_N is not a number
limite
}

function checkIfParameterIsANumber() {
    if [ -n "$1" \
        -a "$1" != 0 \
        -a $(echo $1 | awk "{print $1 * 1}") != $1 ]; then
        echo "The parameter $1 is not a number"
        help
        exit 2
    fi
}

if [ $# -ne 3 ]; then
    echo "The number of parameters must be 3"
    help
    exit 1
fi

checkIfParameterIsANumber $1
checkIfParameterIsANumber $3

if [ $2 == x ]; then
    echo | awk "{print $1 * $3}"
    exit 0
fi

echo | awk "{print $1 $2 $3}"
