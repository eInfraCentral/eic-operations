cd ..
while read F  ; do
	git clone https://github.com/eInfraCentral/$F.git
done <./verbose-palm-tree/eic-project-list.txt
