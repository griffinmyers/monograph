require 'webrick/httpauth'
require 'fileutils'
require 'erb'

module Latex

  class InvalidUserError < StandardError; end;

  class MonographCountainer

    def initialize
      @whitelist = {}
      @users = {}
    end

    # this method adds a user to the whitelist
    def register!(username, password: nil, whitelist: false)
      if whitelist
        @whitelist[username] = Monograph.new(username, password)
      else
        @users[username] = Monograph.new(username, password)
      end
    end

    # this method will ingest a section
    # it automatically adds it to all whitelisted monographs
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
        everyone.each do |k, j|
          h[k] = j.posts_ascending
        end
      end
    end

    def build_site
      FileUtils.rm_rf("site")
      Dir.mkdir("site")
      Dir.chdir("site")

      write_monograph
      write_htpasswd
      write_htaccess
    end

    private

    def everyone
      @whitelist.merge(@users)
    end

    def template(path)
      file = File.open(full_path(path), "rb")
      contents = file.read
      file.close
      contents
    end

    def full_path(rel_path)
      File.expand_path(rel_path, File.dirname(__FILE__))
    end

    def write_monograph

      File.open("index.html", 'w') do |f|
        rhtml = ERB.new(template("../../assets/index.html"))
        f.write(rhtml.result)
      end

      Dir.mkdir("assets")
      Dir.chdir("assets")
      Dir.mkdir("css")
      Dir.chdir("css")

      File.open("application.css", 'w') do |f|
        rcss = ERB.new(template("../../assets/css/application.css"))
        f.write(rcss.result)
      end

      File.open("index.css", 'w') do |f|
        rcss = ERB.new(template("../../assets/css/index.css"))
        f.write(rcss.result)
      end

      Dir.chdir("..")

      Dir.mkdir("js")
      Dir.chdir("js")

      File.open("application.js", 'w') do |f|
        f.write(template("../../assets/js/application.js"))
      end

      File.open("jquery-1.9.1.js", 'w') do |f|
        f.write(template("../../assets/js/jquery-1.9.1.js"))
      end

      Dir.chdir("..")

      FileUtils.cp_r(full_path('../../assets/img'), FileUtils::pwd)

      Dir.chdir("..")

      everyone.each do |k, j|
        Dir.mkdir(k.to_s)
        Dir.chdir(k.to_s)

        File.open("index.html", 'w') do |f|
          rhtml = ERB.new(template("../../assets/template.html"))
          f.write(rhtml.result(j.get_binding))
        end

        if j.is_private?
          File.open(".htaccess", 'w') do |f|
            rhtml = ERB.new(template("../../assets/.htaccess"))
            f.write(rhtml.result(j.get_binding))
          end
        end

        Dir.chdir("..")
      end
    end

    def write_htpasswd
      htpasswd = WEBrick::HTTPAuth::Htpasswd.new('.htpasswd')
      everyone.each do |k, j|
        htpasswd.set_passwd('Mega Journal', j.username, j.password)
      end
      htpasswd.flush
    end

    def write_htaccess
      File.open(".htaccess", 'w') do |f|
        f.write(template("../../assets/root/.htaccess"))
      end
    end

  end

  # Each user has a journal instance.
  # This class will create a single site directory
  class Monograph

    def initialize(username, password=nil)
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

    def username
      @username
    end

    def password
      @password
    end

    def get_binding
      binding
    end

    def is_public?
      @password ? false : true
    end

    def is_private?
      !is_public?
    end

  end

end