down:
	docker-compose down --remove-orphans

start:
	docker-compose up --build -d

attach:
	docker attach $$(docker-compose ps -q app)

bash:
	docker-compose exec app sh

up: down start
