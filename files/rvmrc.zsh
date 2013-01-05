rvmrc() { 
	# use the current ruby and use the folder name as gemset
	echo "rvm --create gemset use $RUBY_VERSION@$(basename `pwd`)" > .rvmrc
	cd ..
	cd - 
}