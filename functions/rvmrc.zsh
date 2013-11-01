rvmrc() { 
	# use the current ruby and use the folder name as gemset
	#echo "rvm --create gemset use $RUBY_VERSION@$(basename `pwd`)" > .rvmrc # old style .rvmrc file
  echo $RUBY_VERSION > .ruby-version
  echo (basename `pwd`) > .ruby-gemset
	cd ..
	cd - 
}