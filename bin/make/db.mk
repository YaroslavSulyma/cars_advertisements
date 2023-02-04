add-migration:
	docker-compose exec app rails g migration $(RUN_ARGS)

destroy-migration:
	docker-compose exec app rails d migration $(RUN_ARGS)

add-model:
	docker-compose exec app rails g model $(RUN_ARGS) --no-test-framework

destroy-model:
	docker-compose exec app rails d model $(RUN_ARGS)

db-create:
	docker-compose exec app rails db:create

db-migrate:
	docker-compose exec app rails db:migrate

db-scheme-load:
	docker-compose exec app rails db:schema:load

db-rollback:
	docker-compose exec app rails db:rollback

db-seed:
	docker-compose exec app rails db:seed

db-re-seed:
	docker-compose exec app rails db:truncate_all \
	&& docker-compose exec app rails db:seed

db-reset:
	docker-compose exec app rails db:drop \
	&& docker-compose exec app rails db:create \
	&& docker-compose exec app rails db:migrate \
	&& docker-compose exec app rails db:seed
