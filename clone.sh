cd ..
while read F  ; do
	echo -e "\e[96m$F\e[0m"
	git clone https://github.com/eInfraCentral/$F.git
done <./verbose-palm-tree/eic-project-list.txt
