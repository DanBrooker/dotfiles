bootstrap() { 
	if [ -f script/bootstrap ]
	then 
		echo -n "Running script/bootstrap"
		./script/bootstrap; 
	else 
		#mkdir script
		#echo -n "Creating file script/bootstrap"
		#echo "#!/bin/bash\n\necho 'bootstrap'" > script/bootstrap
		#chmod +x script/bootstrap 
	fi 
}