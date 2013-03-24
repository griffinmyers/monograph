module Journal

	class InvalidUserError < StandardError; end;

	class JournalCountainer

		def initialize
			@whitelist = {}
			@users = {}
		end

		# this method adds a user to the whitelist
		def register!(username, password, whitelist: false)
			if whitelist
				@whitelist[username] = Journal.new(username, password)
			else
				@users[username] = Journal.new(username, password)
			end
		end

		# this method will ingest a section
		# it automatically adds it to all whitelisted journals
		# it adds it to any usernames passed
		def chomp!(html, users=[])
			@whitelist.each { |k, j| j.chomp!(html) }
			users.each do |j|
				raise InvalidUserError unless @users.include?(j)
				@users[j].chomp!(html)
			end
		end

		def to_h
			Hash.new.tap do |h|
				@whitelist.merge(@users).each do |k, j|
					h[k] = j.html
				end
			end
		end

	end

	# Each user has a journal instance.
	# This class will create a single site directory
	class Journal

		def initialize(username, password)
			@username = username
			@password = password
			@html = []
		end

		# Naw on some content and swallow that shit deep
		def chomp!(html)
			@html.push(html)
		end

		def html
			@html.join
		end

	end

end