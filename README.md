# eic-operations

How to setup an einfracentral instance:

0. clone this
1. cd eic-operations
2. ./clone.sh (clones all the necessary projects)
3. ./mcip.sh (builds the backend)
4. ./tom.sh up (raises backend jms, postgress, elastic, tomcat)
5. ./dat.sh add types (adds data types)
6. Add data in some way***
7. ./tom.sh restart (restarts backend)
8. ./prod.sh up (raises frontend)
