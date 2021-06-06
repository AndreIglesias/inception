#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/27 21:50:16 by ciglesia          #+#    #+#              #
#    Updated: 2021/06/07 00:14:27 by user             ###   ########.fr        #
#                                                                              #
#******************************************************************************#

YAML		=	docker-compose.yml
SRCS		=	./srcs/

CONTS		=	nginx wordpress mariadb

COMPOSE		= 	docker-compose
ECHO		=	echo -e
GUNZIP		=	gunzip
DECRYPT		=	base64 -d
BLUE		=	 "\e[34m"
GREEN		=	 "\e[92m"
YELLOW		=	 "\e[33m"
E0M			=	 "\e[0m"

#************************ MAIN COMPOSITION *************************

all		:	up
			#@$(ECHO) "H4sIAIBGu2AAA+1X223DMAz81wr+6QgF2m0yQ/bob1ugA3aSQnYak+FROkpKqhQx7sOwRPHuqJeXw8vrMT2B5/vroxOpPuB7NwpJR6eK0Uk7jctu+Bvuu7fyBJLW7w/pE9EtXj+T9FY2s74pavmVVXx9nIhpWi2zgCevF0Yap7g2l1iCSU7ZXrW9gkC50ByKrCOu3Y4P3BlbuhpN1CS5CHckyruQ7BeXxuztlxycAwKFRPZbnAjMn1Lq2ErxeoNzVz+oSIEwbAAR2kx0XwMNJMkw625AFzgGnWfJl62Klcvh+VjK6rN5O+MvOPwm30b5XFHhIinLEIsWIvay6dJBOfl7LkPW78VlhdSRfxK8BBu7Qe80Oqvsh0uvRydEtVagB7hu4zhciLytuBKpcXKVxDkEMmJ5nkLgfPJKUkt7rI3OrWl+kWXBDP9zPe9HqC+XFHtvUiXyxPSPoLplpPx5TdJ1D29d0YBZbbBmtN3WQobMj92QVl3GlPUvwfv3zL8H3lj/KxC7SWdcbS32fmBDQl83E+37WDAjXy97l0Hz4GHQ9MgbU/oBiolrju8bAAA=" | $(DECRYPT) | $(GUNZIP)

up		:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) up -d --build)

down	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) down)

start	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) start)

stop	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) stop)

ps		:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) ps)

rm		:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) rm $(CONTS))

config	:
			@(cd $(SRCS) && $(COMPOSE) -f $(YAML) config)

re		:	stop rm all

.PHONY	:	all up down start stop ps rm config
