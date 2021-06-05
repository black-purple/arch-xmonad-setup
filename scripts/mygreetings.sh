#! /usr/bin/bash

__RAINBOWPALETTE="1"

function __colortext()
{
  echo -e " \e[$__RAINBOWPALETTE;$2m$1\e[0m"
}

 
function echogreen() 
{
  echo -n $(__colortext "$1" "32")
}

function echored() 
{
  echo -n $(__colortext "$1" "31")
}

function echoblue() 
{
  echo -n $(__colortext "$1" "34")
}

function echopurple() 
{
  echo -n $(__colortext "$1" "35")
}

function echoyellow() 
{
  echo -n $(__colortext "$1" "33")
}

function echocyan() 
{
  echo -n $(__colortext "$1" "36")
}


echoblue "Today is: "
echored `date +%a` && echo -n " "
echogreen `date +%d` && echo -n " "
echoyellow `date +%b`
echo " `date +%Y`"

echoblue "It's "
echopurple `date +%r`

#while sleep 1; do
#    echoblue "\rIt's "
#    echopurple `date +%r`\\c
#done

printf "\n"
