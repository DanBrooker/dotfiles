
class Install

	def self.rvm(args = {})
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

	def self.ruby(version,args = {})

	end

end