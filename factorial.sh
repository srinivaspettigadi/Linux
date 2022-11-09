cd /home/srinivas/linux
chmod 777 *
echo -n "enter the number: "
read -r a
fact=1
while [ $a -ne 0 ] ; do
	fact=$((fact*a))
	echo "checking the fact value step by step" $fact
	a=$((a-1))
done
echo $fact

# testing
