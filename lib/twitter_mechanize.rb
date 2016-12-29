require_relative "twitter_mechanize/version"
require_relative "twitter_mechanize/agent"


module TwitterMechanize
	module_function
	def init id,password
		agent = Agent.new(id,password)
		raise AuthError,"Authorization failed."unless agent.isLoggedin?
		agent
	end
end
