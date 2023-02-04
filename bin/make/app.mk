RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

bundle:
	docker-compose exec app bundle

run-console:
	docker-compose exec app rails console

run-generate:
	docker-compose exec app rails generate $(RUN_ARGS)

style:
	docker-compose exec app rubocop

fix-style:
	docker-compose exec app rubocop

fix-style!:
	docker-compose exec app rubocop -A

routes:
	docker-compose exec app rails routes | grep $(RUN_ARGS)

development-log:
	docker-compose exec app tail -$(RUN_ARGS) ./log/development.log

c: run-console

g: run-generate
