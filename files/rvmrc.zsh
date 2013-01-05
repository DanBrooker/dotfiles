rvmrc() { 
	echo "rvm --create gemset use $RUBY_VERSION" > .rvmrc
	cd ..
	cd - 
}