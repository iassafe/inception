

all: clean
	mkdir -p /Users/iassafe/Desktop/inception/mariadb /Users/iassafe/Desktop/inception/wordpress
	cd srcs && docker-compose up -d --build

clean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null || true	

fclean: clean 
	 rm -rf /Users/iassafe/Desktop/inception/mariadb /Users/iassafe/Desktop/inception/wordpress

re: fclean all