while read F  ; do
	echo -e "\e[96m$F\e[0m"
	cd ../$F
	git status
done <eic-project-list.txt

