
class Install

	def self.homebrew
		if Using.command?("brew")
			Log.found "brew"
			Log.skip "homebrew"
			#puts "\tskipped\t#{"oh_my_zsh".cyan}"
		else
			Ask.install :homebrew do
				Log.install :homebrew
	      		system %Q{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
			end
		end
	end

	def self.brew(name)
		#puts "BREW #{name}"
		if Using.command?(name)
			Log.found name
			Log.skip name
		else
			Log.install name
			puts system(%Q{brew install #{name}})
		end
	end

end