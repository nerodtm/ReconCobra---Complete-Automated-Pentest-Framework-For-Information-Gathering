#!/bin/bash

function convip()
{
    CONV=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})

    ip=""
    for byte in `echo ${1} | tr "." " "`; do
        ip="${ip}.${CONV[${byte}]}"
    done
    echo ${ip:1}
}

read ip1

a=`convip "${ip1}"`

echo "${a}"
