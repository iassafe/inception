

all: clean
	sudo mkdir -p /home/hed-dyb/data/mariadb /home/hed-dyb/data/wordpress
	cd srcs && docker-compose up -d --build

clean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null || true	

fclean: clean 
	sudo rm -rf /home/hed-dyb/data/mariadb /home/hed-dyb/data/wordpress

re: fclean all