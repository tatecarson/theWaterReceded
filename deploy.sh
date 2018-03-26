#!/bin/bash

cd ~/documents/AWS; ssh -i rhizome-test.pem ubuntu@ec2-52-53-194-77.us-west-1.compute.amazonaws.com << EOF
	cd theWaterReceded
	git pull 
EOF