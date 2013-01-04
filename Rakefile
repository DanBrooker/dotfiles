require 'rake'

Dir.glob('installer/*.rb').each { |r| import r }
Dir.glob('tasks/*.rake').each { |r| import r }

task :install do

	puts "dotfiles install".yellow

	Install.file "test"
	Install.homebrew
	Install.brew "git"
	Install.brew "hub"
	Install.file "gemrc"
	Install.rvm
	Install.ruby "1.9.3"
	Install.oh_my_zsh
	Install.brew "legit"
	Install.file "gitconfig"
	Install.file "gitignore"
	Install.brew "mogenerator"
	Install.brew "ssh-copy-id"
	Install.cocoapods
end

task :uninstall do

	puts "dotfiles uninstall".yellow

	Uninstall.file "test"
	Uninstall.homebrew
	Uninstall.brew "git"
	Uninstall.brew "hub"
	Uninstall.file "gemrc"
	Uninstall.rvm
	UnInstall.ruby "1.9.3"
	Uninstall.oh_my_zsh
	Uninstall.brew "legit"
	Uninstall.file "gitconfig"
	Uninstall.file "gitignore"
	Uninstall.brew "mogenerator"
	Uninstall.brew "ssh-copy-id"
	Uninstall.cocoapods

end

task :default => 'install'