#!/usr/bin/env bash


kafka-acls --bootstrap-server ak0.gcp.cp.com:9092 --command-config client.conf \
           --add --allow-principal User:alice --allow-principal User:fred \
           --allow-host host-1  --allow-host host-2 \
           --operation read --operation write --topic finance-topic
