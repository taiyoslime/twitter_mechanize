require_relative "twitter_mechanize/version"
require_relative "twitter_mechanize/agent"


module TwitterMechanize
	module_function
	def init id,password
		Agent.new id,password
	end
end
