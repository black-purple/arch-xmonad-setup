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
