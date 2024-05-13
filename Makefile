.DEFAULT_GOAL := config

HA_ENV      := ./homeassistant/homeassistant.env 
MQTT_ENV    := ./mqtt/mqtt.env 
MYSQL_ENV   := ./mysql/mysql.env 
PIHOLE_ENV  := ./pihole/pihole.env
APACHE2_ENV := ./apache2/apache2.env

ENV_FILES := $(MYSQL_ENV) $(MQTT_ENV) $(HA_ENV) $(PIHOLE_ENV) $(APACHE2_ENV)

config:
	@echo "Running docker-compose up with environment files: $(ENV_FILES)"
	docker compose $(foreach env,$(ENV_FILES),--env-file $(env)) config
