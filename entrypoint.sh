#!/bin/bash

# Set user to mysqlrouter
sed -i '/\[DEFAULT\]/a user = mysqlrouter' /etc/mysqlrouter/mysqlrouter.conf

# Set some configuration
echo "[routing:failover]" >> /etc/mysqlrouter/mysqlrouter.conf
echo "bind_address = ${BIND_ADDRESS}" >> /etc/mysqlrouter/mysqlrouter.conf
echo "bind_port = ${BIND_PORT}" >> /etc/mysqlrouter/mysqlrouter.conf
echo "routing_strategy = ${ROUTING_STRATEGY}" >> /etc/mysqlrouter/mysqlrouter.conf
echo "destinations = ${DESTINATIONS}" >> /etc/mysqlrouter/mysqlrouter.conf

# Start mysqlrouter
/usr/bin/mysqlrouter -c /etc/mysqlrouter/mysqlrouter.conf
