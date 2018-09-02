start:
	docker system prune
	docker-compose up --build

createsuperuser:
	docker-compose run --rm backend python manage.py createsuperuser

backup_db:
	docker exec -t queentour_db_1 pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

restore_db:
	cat "$(sql)" | docker exec -i queentour_db_1 psql -U postgres

backend_manage:
	docker-compose run --rm backend bash -c "python manage.py $(cmd)"

backend_run:
	docker-compose run --rm backend bash -c "$(cmd)"

clean_all_dockers:
	docker system prune
	docker system prune -a
