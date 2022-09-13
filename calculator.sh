#!/bin/bash
navbar(){
	clear
	echo "[exit]-close program  			input formate- 8 + 2"
	echo "__________________________________________________________________"
	printf "\n"
	echo -n "                           "
}
navbar
while [ 1 ]
do
	read num1 op num2
	if [ "$num1" == "exit" ]
	then
		clear
		exit
	fi
	if [ "$op" == "+" ]
	then
		c=`echo  $num1 + $num2 | bc -l`
		navbar
		echo "$num1 + $num2 = $c"
		continue
	fi
	if [ "$op" == "-" ]
	then
		c=`echo  $num1 - $num2 | bc -l`
		navbar
		echo "$num1 - $num2 = $c"
		continue
	fi
	if [ "$op" == "*" ]
	then
		c=`echo $num1 \* $num2 | bc -l`
		navbar
		echo "$num1 x $num2 = $c"
		continue
	fi
	if [ "$op" == "/" ]
	then
		c=`echo "scale=2;$num1 / $num2" | bc -l`
		navbar
		echo "$num1/$num2 = $c"
		continue
	fi
	if [ "$op" == "%" ]
	then
		c=`expr $num1 % $num2`
		navbar
		echo "$num1 % $num2 = $c"
		continue
	fi
	echo "invalide input"
done

