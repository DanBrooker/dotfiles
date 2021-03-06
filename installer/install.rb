require 'erb'
require 'yaml'

class Log

	def self.skip(name)
		puts "\tskipped\t#{name.to_s.magenta}"
	end

	def self.install(name)
		puts "\tinstall\t#{name.to_s.yellow}"
	end

	def self.create(name)
		puts "\tcreate\t#{name.to_s.green}"
	end

	def self.found(name)
		puts "\tfound\t#{name.to_s.bold}"
	end

	def self.link(name)
		puts "\tlink\t#{name.to_s.cyan}"
	end

end

class Ask

	@@info = YAML.load(File.read('private.yml'))

	def self.install(name,args={},&blk)

		name = name.to_s

		if not args["ask"].nil?
			if args["ask"] == false
				yield blk
				return
			end
		end

		print "Install #{name}? #{"[ynq]".yellow} "
		case $stdin.gets.chomp
	    when 'y'
	    	Log.install(name)
	      	yield blk
	    when 'q'
	     	exit
	    else # 'n' or nothing, etc
	     	Log.skip(name)
	    end
	end

	def self.info(key)
		loaded = @@info[key.to_s]
		puts loaded
		if loaded.nil?
			print "Enter #{key.to_s.gsub("_"," ").capitalize}: "
			input = $stdin.gets.chomp
		else
			input = loaded
		end
	end

end

class Using

	def method_missing(method)
		#puts "missing: #{method}"
		command = Using.command? method.chomp
	end

	def self.command?(command)
       system("which #{ command} > /dev/null 2>&1")
 	end

end

# class Object # http://whytheluckystiff.net/articles/seeingMetaclassesClearly.html
#   def meta_def name, &blk
#     (class << self; self; end).instance_eval { define_method name, &blk }
#   end
# end

class Install

	def self.file(name,destination)
		dotname = destination.nil? ? name : destination
		if File.exist?(File.join(ENV['HOME'], dotname))
			#print "\tfound\t.zshrc\nre-"
			Log.found dotname
			Ask.install dotname do
				create_file name,destination  #Dir["templates/#{name}.*"]
			end
		else
			create_file name,destination # Dir["templates/#{name}.*"]
		end
	end

	def self.brew(name)

	end

	# def self.provides(filename)
	# 	# name = filename.to_s
	# 	# meta_def "write_#{filename}" do
	# 	# 	filepath = "#{ENV['HOME']}/.#{filename}"
	# 	# 	#template = Dir["templates/#{filename}.*"] #{}"#{ENV['HOME']}/.dotfiles/#{filename}.erb"
	# 	# 	self.write(filepath,filename)
	# 	# end
	# end

	# def self.method_missing(name)
	# 	name = name.to_s
	# 	if name.start_with? "write_"
	# 		filename = name.gsub "write_", ""
	# 		filepath = "#{ENV['HOME']}/.#{filename}"
	# 		template = "#{filename}.erb"
	# 		self.write(filepath,template)
	# 	else
	# 		puts "missing install method #{name}"
	# 	end
	# end

	private

	def self.create_file(name,destination)
		dotname = destination.nil? ? name : destination
		filename = Dir["files/#{name}*"].first
		filepath = "#{ENV['HOME']}/#{dotname}"

    # puts "writing #{filename} to #{filepath}"
		
		if filename =~ /.erb$/
			Log.create(dotname)
		    File.open(filepath, 'w') do |f|
		    	f.write ERB.new(File.read(filename)).result(binding)
		    end
		else
		  	Log.link(dotname)
		    system %Q{ln -s "#{filename}" "#{filepath}"}
		end
	end

end