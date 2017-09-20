cd ../eic-platform
docker stop eic-platform
docker rm eic-platform
npm run build:docker
docker run -p 80:80 -d --name eic-platform eic-platform


