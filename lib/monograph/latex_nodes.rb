require 'hemingway'
require 'monograph/monograph_container'

module Latex

  module DocumentNode
    def container
      container = MonographCountainer.new
      elements.each do |e|
        e.contribute!(container)
      end
      container
    end

    def html
      elements.map { |e| e.html }.join
    end
  end

  module WhitelistNode
    def contribute!(container)
      container.register!(username.text_value.to_sym, password: password.text_value, whitelist: true)
    end

    def html
    end
  end

  module RegisterNode
    def contribute!(container)
      container.register!(username.text_value.to_sym, password: password.text_value)
    end

    def html
    end
  end

  module PublicNode
    def contribute!(container)
      container.register!(username.text_value.to_sym)
    end
  end

  module CommentNode
    def contribute!(container)
    end
  end

  module FigureNode
    def contribute!(container)
      container.chomp!(html, show.respond_to?(:users) ? show.users : [])
    end

    def html
      image_html = Hemingway::Build.tag("img", nil, :close_tag => false, :src => "/#{path.text_value}")
      caption_html = Hemingway::Build.tag("figcaption", caption.text_value)
      Hemingway::Build.tag("figure", image_html + caption_html)
    end

  end

  module PartNode
    def contribute!(container)
    end

    def html
    end
  end

  module ChapterNode
    def contribute!(container)
    end

    def html
    end
  end

  module SectionNode
    def contribute!(container)
      container.chomp!(html, show.respond_to?(:users) ? show.users : [])
    end

    def html
      heading_tag = Hemingway::Build.tag("h1", heading.html)
      Hemingway::Build.tag("article", heading_tag + entry.html)
    end
  end

  module ShowNode
    def users
      sequence.elements.map { |u| u.username.text_value.to_sym }
    end
  end

  module WhitespaceNode
    def contribute!(container)
    end

    def html
    end
  end

  module EntryNode
    def html
      begin
        @parser = Hemingway::Parser.new
        @parser.parse(text_value).html
      rescue => e
        start = @parser.failure_reason.index("byte") + 5
        length = @parser.failure_reason.index(")", start) - start
        index = @parser.failure_reason[start, length].to_i
        padding = 60

        puts "Bummer: #{e}."
        puts @parser.failure_reason
        puts "Near: #{text_value[index - padding, padding * 2]}"
        puts "----------"
      end
    end
  end

  module HeadingNode
    def html
      respond_to?(:date) ? date.html : text_value
    end
  end

  module DateNode
    def html
      "#{day.html} #{month.html} #{year.html}"
    end
  end

  module TagTextNode
    def html
      text_value
    end
  end

  module MonthNode
    def html
      text_value
    end
  end

  module DayNode
    def html
      text_value
    end
  end

  module YearNode
    def html
      text_value
    end
  end

end