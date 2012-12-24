require 'rake'

Dir.glob('installer/*.rb').each { |r| import r }
Dir.glob('tasks/*.rake').each { |r| import r }

task :install do

	puts "dotfiles install".yellow

	Install.homebrew
	Install.git
	Install.brew "hub"
	Install.rvm
	Install.oh_my_zsh
	Install.brew "legit"
	Install.file "gitconfig"
	Install.file "gitignore"
	Install.brew "mogenerator"
	Install.brew "ssh-copy-id"
end

task :uninstall do

	puts "dotfiles uninstall".yellow

	Uninstall.homebrew
	Uninstall.git
	Uninstall.oh_my_zsh
	Uninstall.legit
	Uninstall.file :gitconfig
	Uninstall.file :gitignore

end

task :default => 'install'