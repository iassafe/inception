

all:
	mkdir -p /home/iassafe/data/mariadb /home/iassafe/data/wordpress
	docker-compose -f ./srcs/Docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/Docker-compose.yml down

clean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null || true	

fclean: clean 
	 rm -rf /home/iassafe/data/mariadb /home/iassafe/data/wordpress

re: fclean all