

class Install

	def self.fish(args = {})
		if File.exist?(File.join(ENV['HOME'], ".config/fish/config.fish"))
			Log.found ".fishrc"
			Log.skip "fish"
		else
			# Ask.install :fish do
#         install_fish
#         
#         # switch_to_fish
#         reload_terminal
#       end
		end

		Install.file "config.fish", ".config/fish/config.fish"

	end

	protected

	def reload_terminal
		%Q{source $HOME/.zshrc}
	end

	def switch_to_fish
	  if not ENV["SHELL"] =~ /fish/
	  else
	      puts "switching to fish"
	      system %Q{chsh -s `which fish`}
	  end
	end

	def install_fish
	    puts "installing fish"
	    system %Q{brew install fish}
	end

end

class Uninstall

	def self.fish

	end

end

