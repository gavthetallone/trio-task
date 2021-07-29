docker network create trio-network

docker build -t gavthetallone/trio flask-app
docker run -d --network trio-network --name trio gavthetallone/trio

docker build -t trio-db db
docker run -d --network trio-network --name trio-db trio-db

docker run -d --network trio-network --name trio-proxy -p 80:80 --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf nginx:alpine