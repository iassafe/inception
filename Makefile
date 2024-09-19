

all: clean
	mkdir -p /home/iassafe/data/mariadb /home/iassafe/data/wordpress
	cd srcs && docker-compose up -d --build

clean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null || true	

fclean: clean 
	 rm -rf /home/iassafe/data/mariadb /home/iassafe/data/wordpress

re: fclean all