PROJECT=trampoline

c:
	@bundle exec rails console

migrate:
	@bundle exec rails db:migrate

up:
	@bundle exec rails server -p 3000 

docker.build:
	@docker-compose -p "$(PROJECT)" build .

docker.start:
	@docker-compose -p "$(PROJECT)" up 

docker.stop: 
	@docker-compose -p "$(PROJECT)" down

docker.clean:
	@docker-compose -p "$(PROJECT)" down -v --rmi local --remove-orphans
