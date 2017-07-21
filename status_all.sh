while read F  ; do
	cd ../$F
	git status
done <eic-project-list.txt
