.DEFAULT_GOAL := config

SERVER_ENV  := ./server.env

HA_ENV      := ./homeassistant/homeassistant.env 
MQTT_ENV    := ./mqtt/mqtt.env 
DDNS_ENV    := ./ddns/ddns.env
MYSQL_ENV   := ./mysql/mysql.env 
PIHOLE_ENV  := ./pihole/pihole.env
APACHE2_ENV := ./apache2/apache2.env

ENV_FILES := $(SERVER_ENV) $(MYSQL_ENV) $(DDNS_ENV) $(MQTT_ENV) $(HA_ENV) $(PIHOLE_ENV) $(APACHE2_ENV)

config:
	clear
	@echo "Running docker compose config!\n\n"
	docker compose $(foreach env,$(ENV_FILES),--env-file $(env)) config


build:
	clear
	@echo "Running docker compose build with environment files: $(ENV_FILES)\n\n"
	sudo docker compose $(foreach env,$(ENV_FILES),--env-file $(env)) build

up: 	build
	clear
	@echo "Running docker compose up!\n\n"
	sudo docker compose $(foreach env,$(ENV_FILES),--env-file $(env)) up -d


restart:
	clear
	@echo "Restarting all containers!\n\n"
	sudo docker compose $(foreach env,$(ENV_FILES),--env-file $(env)) restart


stop:
	clear
	@echo "Stopping all the containers!\n\n"
	sudo docker compose stop 

start:
	clear
	@echo "Starting all the containers!\n\n"
	sudo docker compose start

