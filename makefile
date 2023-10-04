config:
	make schema && \
	make connector

schema:
	bash ./scripts/create_schema.sh

connector:
	bash ./scripts/create_connector.sh
