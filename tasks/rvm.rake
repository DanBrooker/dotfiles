
class Install

	def self.rvm
		if File.exist?(File.join(ENV['HOME'], ".rvm"))
			Log.found "rvm"
			Log.skip "rvm"
			#puts "\tskipped\t#{"oh_my_zsh".cyan}"
		else
			Ask.install :rvm do
				Log.install :rvm
	      		system %Q{\curl -L https://get.rvm.io | bash -s stable}
			end
		end
	end

	# def self.brew(name)
	# 	#puts "BREW #{name}"
	# 	if Using.command?(name)
	# 		Log.found name
	# 		Log.skip name
	# 	else
	# 		Log.install name
	# 		puts system(%Q{brew install #{name}})
	# 	end
	# end

end