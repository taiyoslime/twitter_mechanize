require "mechanize"
require_relative "errors"

module TwitterMechanize
	class Agent
		def initialize id,password
			@agent = auth id,password
		end

		def tweet text
			raise TweetError,"Text is empty." if text == ""
			page = @agent.get "https://twitter.com/intent/tweet?text=#{text}"
			form = page.form_with(action:"/intent/tweet")
			@agent.submit form
			returi = @agent.page.uri
			raise TweetError,"Failed to send tweet. Please retry." if returi.path != "/intent/tweet/complete"
			p "Tweet successful : #{text} => https://twitter.com/emilsoyiat/status/#{Hash[URI::decode_www_form(returi.query)]["latest_status_id"]}"
		end


		private
		def auth id,password
			agent = Mechanize.new
			agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
			agent.follow_meta_refresh = true
			agent.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36'
			page = agent.get "https://twitter.com/login/"
			form = page.form_with(action:"https://twitter.com/sessions")
			form.field_with(name:"session[username_or_email]").value = id
			form.field_with(name:"session[password]").value = password
			agent.submit form
			raise AuthError,"Authorization failed." unless isLoggedin? agent
			agent
		end

		def isLoggedin? _agent
			_agent.get "https://twitter.com/login/"
			_agent.page.uri.to_s == "https://twitter.com/" ? true : false
		end
	end

end
