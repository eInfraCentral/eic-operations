# eic-operations

How to setup an einfracentral instance:
clone this
cd into eic-operations
./clone.sh (clones all the necessary projects)

Backend:
./mcip.sh (builds the backend)
Fill in eic-docker/secret.env with your instance's secrets
./tom.sh up (raises backend jms, postgress, elastic, tomcat)
./dat.sh add types (adds data types)
Add data in some way (either POST your own, or use ./dat.sh add resources for an older snapshot of eic's catalogue)
./tom.sh restart (restarts backend)

Frontend:
cd into eic-nginx/sites
./sites.sh add proxy (adds site as proxy to nginx)
./sites.sh enable proxy (enables site)
./prod.sh install (sets frontend up)
./prod.sh up (raises frontend)

Analytics:
docker network create lb_web
./anal.sh up

Maintenance:
cd into eic-nginx/sites
./sites.sh add maintenance (adds maintenance page)
./sites.sh enable maintenance (enables maintenance page)