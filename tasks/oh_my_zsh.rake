

class Install

	#provides :zshrc

	def self.oh_my_zsh(args = {})
		if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
			Log.found ".oh-my-zsh"
			Log.skip "oh_my_zsh"
			#puts "\tskipped\t#{"oh_my_zsh".cyan}"
		else
			Ask.install :oh_my_zsh do
				install_oh_my_zsh
				
				switch_to_zsh
				reload_terminal
			end
		end

		Install.file "zshrc"
		# if File.exist?(File.join(ENV['HOME'], ".zshrc"))
		# 	#print "\tfound\t.zshrc\nre-"
		# 	Log.found ".zshrc"
		# 	Ask.install '.zshrc' do
		# 		write_zshrc
		# 	end
		# else
		# 	write_zshrc
		# end
	end

	private

	def reload_terminal
		%Q{source $HOME/.zshrc}
	end

	def switch_to_zsh
	  if not ENV["SHELL"] =~ /zsh/
	  else
	      puts "switching to zsh"
	      system %Q{chsh -s `which zsh`}
	  end
	end

	def install_oh_my_zsh
	    puts "installing oh-my-zsh"
	    system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
	end

end

class Uninstall

	def self.oh_my_zsh

		# if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
		#     puts "found ~/.oh-my-zsh"
		#     puts %Q{uninstall_oh_my_zsh}
		# else
		# 	puts "oh_my_zsh not installed - skipping"
		# end

	end

end

