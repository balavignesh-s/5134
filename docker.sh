#!/bin/bash -e

a=("u12golpls" "u14golpls" "u12clopls" "u14clopls" "u12rubpls" "u14rubpls" "u12scapls" "u14scapls")
b=("u14pytall" "u12golall" "u14golall" "u12cloall" "u14cloall" "u12phpall" "u14phpall" "u12ruball" "u14scaall"); 
c=("u14ruball" "u12scaall");
d=("u12phppls" "u14phppls" "u12phpall" "u14phpall");
for i in "${d[@]}"; do
	echo "pulling drydock/$i:tip"
	docker pull drydock/$i:tip
	
	echo "retagging drydock/$i:tip to drydock/$i:prod"
	docker tag -f drydock/$i:tip drydock/$i:prod
  
	echo "docker pushing drydock/$i:prod"
	docker push drydock/$i:prod
 
	echo "-----------------------------------------------"
done
