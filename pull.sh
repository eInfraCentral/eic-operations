while read F  ; do
	cd ../$F
	git pull
done <eic-project-list.txt
