#!/bin/bash
go get -u github.com/jvehent/pineapple
$GOPATH/bin/pineapple <<EOF
aws:
    region: sa-east-1
    accountnumber: 124091763127

components:
    - name: application
      type: ec2
      tag: 
          key: project
          value: honeypot

rules:
    - src: 181.46.9.66/32
      dst: application
      dport: 64295

    - src: 0.0.0.0/0
      dst: application
      dport: 9999

EOF
