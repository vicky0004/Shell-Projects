navBar(){
clear
echo "[e]-exit     [h]-Home	[b]-Back	[fe]-file execute	[fr]-file read"
printf "\n"
echo "[n]-new file		[w]-write	[df]-delete file	[nd]-new Directory"
echo "______________________________________________________________________________________________________"
}
readFile(){
	printf "\n"
	echo -n "Enter file name with extention: "
}

navBar
cd /home/vicky
while [ 1 ]
do
	printf "\n\n"
	ls
	echo -n  "-->"
	read folder
	if [ "$folder" == "e" ]
	then
		clear
		exit
	fi
	if [ "$folder" = "h" ]
	then
		navBar
		cd /home/vicky
		continue
	fi
	if [ "$folder" = "b" ]
	then
		cd ..
		continue
	fi
	if [ "$folder" = "fr" ]
	then
		readFile
		read file
		navBar
		cat "$file"
		continue
	fi
	if [ "$folder" = "fe" ]
	then
		readFile
		read file
		navBar
		./"$file"
		continue
	fi
	if [ "$folder" = "df" ]
	then
		readFile
		read file
		rm "$file"
		continue
	fi
	if [ "$folder" = "dd" ]
	then
		printf "\n"
		echo -n "Enter folder name: "
		read file
		rmdir "$file"
		continue
	fi
	if [ "$folder" = "n" ]
	then
		readFile
		read file
		touch "$file"
		continue
	fi
	if [ "$folder" = "w" ]
	then
		readFile
		read file
		vim "$file"
		continue
	fi
	if [ "$folder" = "nd" ]
	then
		printf "\n"
		echo -n "Enter folder name: "
		read file
		mkdir "$file"
		continue
	fi

	cd "$folder"
done
