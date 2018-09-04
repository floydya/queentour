start:
	docker system prune
	docker-compose up --build

createsuperuser:
	docker-compose run --rm backend python manage.py createsuperuser

backup_db:
	docker exec -t docker_db_1 pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

backend_manage:
	docker-compose run --rm backend bash -c "python manage.py $(cmd)"

backend_run:
	docker-compose run --rm backend bash -c "$(cmd)"

clean_all_dockers:
	docker system prune
	docker system prune -a


# cat your_dump.sql | docker exec -i {docker-postgres-container} psql -U {user} -d {database_name}