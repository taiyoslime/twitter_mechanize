require 'mechanize'

module TwitterMechanize
	class Agent
		class TweetError < StandardError; end

		def initialize id,password
			@agent = auth(id,password)
		end

		def tweet text
			page = @agent.get("https://twitter.com/intent/tweet?text=#{text}")
			form = page.form_with(action:"/intent/tweet")
			@agent.submit form
			raise TweetError,"Failed to send tweet. Please retry." unless @agent.page.uri.to_s.include?("https://twitter.com/intent/tweet/complete?")
			p "Tweet succeed:#{text}"
		end

		def isLoggedin?
			@agent.get("https://twitter.com/login/")
			@agent.page.uri.to_s == "https://twitter.com/" ? true : false
		end

		private
		def auth id,password
			agent = Mechanize.new
			agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
			agent.follow_meta_refresh = true
			agent.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36'
			page = agent.get("https://twitter.com/login/")
			form = page.form_with(action:"https://twitter.com/sessions")
			form.field_with(name:"session[username_or_email]").value = id
			form.field_with(name:"session[password]").value = password
			agent.submit form
			agent
		end
	end

end
