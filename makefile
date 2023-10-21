up:
	docker compose up

down:
	docker compose down

produce:
	benthos -c ./benthos.json.kafka.yaml