navbar(){
	clear
	echo " "
	echo "  [e]-exit     [h]-Home		[b]-Back		[del]-delete file		 [con]-convert file"
	echo "______________________________________________________________________________________________________"
	echo -n "Current Path: "
	pwd
}
cd /home

navbar
while [ 1 ]
do
	printf "\n"
	ls
	echo -n  " >> "
	read variable
	if [ "$variable" == "e" ]
	then
		clear
		exit
	fi
	if [ "$variable" == "h" ]
	then
		cd /home
		navbar
		continue
	fi
	if [ "$variable" == "b" ]
	then
		cd ..
		navbar
		continue
	fi
	if [ "$variable" == "del" ]
	then
		echo -n "Enter file name with extention: "
		read file
		rm $file
		navbar
		continue
	fi
	if [ "$variable" == "con" ]
	then
		printf "\n"
		echo -n "Enter file name with extention: "
		read file
		echo -n "Enter file name for saving pdf(without extention): "
		read file2
		enscript -p output.ps -B --no-header $file
		ps2pdf output.ps $file2.pdf
		rm output.ps
		evince $file2.pdf
		navbar
		continue
	fi
	cd $variable
	navbar
done
