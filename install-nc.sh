#!/usr/bin/env bash

ssh admin@ak0.gcp.cp.com  "sudo yum -y install nc"
ssh admin@ak1.gcp.cp.com  "sudo yum -y install nc"
ssh admin@ak2.gcp.cp.com  "sudo yum -y install nc"
ssh admin@zk0.gcp.cp.com  "sudo yum -y install nc"
ssh admin@zk1.gcp.cp.com  "sudo yum -y install nc"
ssh admin@zk2.gcp.cp.com  "sudo yum -y install nc"
ssh admin@kc0.gcp.cp.com  "sudo yum -y install nc"
ssh admin@kc1.gcp.cp.com  "sudo yum -y install nc"
ssh admin@sr0.gcp.cp.com  "sudo yum -y install nc"
ssh admin@c3.gcp.cp.com   "sudo yum -y install nc"
