
class Install

	def self.cocoapods(args = {})
		if not Using.command?("pod")
			Ask.install "cocoapods" do
				Install.ruby_gem "cocoapods", :ask => false
				system %Q{pod setup}
			end
		end
	end

end