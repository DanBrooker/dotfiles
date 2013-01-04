rvmrc() { 
	echo "rvm --create gemset use $rvm_ruby_string" > .rvmrc
	cd ..
	cd - 
}