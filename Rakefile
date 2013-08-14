require 'rake'

Dir.glob('installer/*.rb').each { |r| import r }
Dir.glob('tasks/*.rake').each { |r| import r }

task :install do

	puts "dotfiles install".yellow

	Install.homebrew

	# git
	Install.brew "git"

	# zshell
	Install.oh_my_zsh

	# more git, # do dependency management for this atm
	Install.brew "hub"
	Install.brew "legit"
	Install.file "gitconfig"
	Install.file "gitignore"
	Install.brew "ssh-copy-id"

	#ruby
	Install.rvm
	Install.ruby "2.0.0", :default => true

	# obj-c
	Install.brew "mogenerator"
	Install.brew "appledoc"
	Install.cocoapods
end

# thinking about having a list of things installed by ths script, the uninstall here could be a little too agressive
# task :uninstall do

# 	puts "dotfiles uninstall".yellow

# 	Uninstall.file "test"
# 	Uninstall.homebrew
# 	Uninstall.brew "git"
# 	Uninstall.brew "hub"
# 	Uninstall.file "gemrc"
# 	Uninstall.rvm
# 	UnInstall.ruby "1.9.3"
# 	Uninstall.oh_my_zsh
# 	Uninstall.brew "legit"
# 	Uninstall.file "gitconfig"
# 	Uninstall.file "gitignore"
# 	Uninstall.brew "mogenerator"
# 	Uninstall.brew "ssh-copy-id"
# 	Uninstall.cocoapods

# end

task :default => 'install'