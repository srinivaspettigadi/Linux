Addition of two numbers only if you enter numerics
Usage of unset here in below addition script , check below ./unset.sh

./unset.sh
var="srinivas"
echo $var
unset var
echo $var
var="nani"
echo $var
unset var
echo $var

unset is used to unset the value of any variable locally

unset a
unset b
until [[ $a == +([0-9]) ]] ; do
	read -r -p "please enter first number:" a
done
until [[ $b == +([0-9]) ]] ; do
	read -r -p "please enter second number:" b
done
echo "$a + $b = $((a+b))"

