require "twitter_mechanize/version"
require "twitter_mechanize/agent"

module TwitterMechanize
	def init id,password
		agent = Agent.new(id,password)
		return agent if agent.isLoggedn?
	end
end
