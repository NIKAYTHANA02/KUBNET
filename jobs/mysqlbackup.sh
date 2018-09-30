#!/bin/bash
/usr/bin/mysqldump -u user1 -h mysqlsvc -phello123 k8s > k8s.sql
s3cmd put k8s.sql bsmysql/
