cd ../eic-platform
docker kill eic-platform
docker rm eic-platform
npm run build:prod
docker build . -t eic-platform
docker run -d --name eic-platform -p 80:80 eic-platform
