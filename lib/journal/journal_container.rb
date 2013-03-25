require 'fileutils'
require 'erb'

module Content

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
					h[k] = j.posts_ascending
				end
			end
		end

		def build_site
			FileUtils.rm_rf("site")
			Dir.mkdir("site")
			Dir.chdir("site")

			@whitelist.merge(@users).each do |k, j|
				Dir.mkdir(k)
				Dir.chdir(k)

				File.open("index.html", 'w+') do |f|
					rhtml = ERB.new(template)
					f.write(rhtml.run(j.get_binding))
				end

				Dir.chdir("..")
			end
		end

		private

		def template
			file = File.open("#{File.dirname(__FILE__)}/../assets/template.html", "rb")
			contents = file.read
			file.close
			contents
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

		def posts_ascending
			@html.join
		end

		def posts_descending
			@html.reverse.join
		end

		def get_binding
			binding
		end

	end

end