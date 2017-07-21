while read F  ; do
	cd ../$F
	echo -e "\e[96m$F\e[0m"
	git status
done <eic-project-list.txt

