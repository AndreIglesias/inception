# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_db.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user <ciglesia@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/06 22:59:31 by user              #+#    #+#              #
#    Updated: 2021/06/06 23:31:27 by user             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
mysql -u root --password= < init.sql
