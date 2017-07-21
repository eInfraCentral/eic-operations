while read F  ; do
	cd ../$F
	git push -u origin master 
done <eic-project-list.txt
