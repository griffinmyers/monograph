# Autogenerated from a Treetop grammar. Edits may be lost.


require 'treetop'
require 'journal_nodes'

module Journal
  include Treetop::Runtime

  def root
    @root ||= :document
  end

  def _nt_document
    start_index = index
    if node_cache[:document].has_key?(index)
      cached = node_cache[:document][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1 = index
      r2 = _nt_whitelist
      if r2
        r1 = r2
      else
        r3 = _nt_register
        if r3
          r1 = r3
        else
          r4 = _nt_part
          if r4
            r1 = r4
          else
            r5 = _nt_chapter
            if r5
              r1 = r5
            else
              r6 = _nt_section
              if r6
                r1 = r6
              else
                r7 = _nt_whitespace
                if r7
                  r1 = r7
                else
                  @index = i1
                  r1 = nil
                end
              end
            end
          end
        end
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(DocumentNode,input, i0...index, s0)
    end

    node_cache[:document][start_index] = r0

    r0
  end

  module Whitelist0
    def spaces1
      elements[1]
    end

    def spaces2
      elements[3]
    end

    def username
      elements[4]
    end

    def spaces3
      elements[5]
    end

    def password
      elements[6]
    end
  end

  def _nt_whitelist
    start_index = index
    if node_cache[:whitelist].has_key?(index)
      cached = node_cache[:whitelist][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("%", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("%")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_spaces
      s0 << r2
      if r2
        if has_terminal?("whitelist:", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 10))
          @index += 10
        else
          terminal_parse_failure("whitelist:")
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_spaces
          s0 << r4
          if r4
            r5 = _nt_username
            s0 << r5
            if r5
              r6 = _nt_spaces
              s0 << r6
              if r6
                r7 = _nt_password
                s0 << r7
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(WhitelistNode,input, i0...index, s0)
      r0.extend(Whitelist0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:whitelist][start_index] = r0

    r0
  end

  module Register0
    def spaces1
      elements[1]
    end

    def spaces2
      elements[3]
    end

    def username
      elements[4]
    end

    def spaces3
      elements[5]
    end

    def password
      elements[6]
    end
  end

  def _nt_register
    start_index = index
    if node_cache[:register].has_key?(index)
      cached = node_cache[:register][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("%", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("%")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_spaces
      s0 << r2
      if r2
        if has_terminal?("register:", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 9))
          @index += 9
        else
          terminal_parse_failure("register:")
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_spaces
          s0 << r4
          if r4
            r5 = _nt_username
            s0 << r5
            if r5
              r6 = _nt_spaces
              s0 << r6
              if r6
                r7 = _nt_password
                s0 << r7
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(RegisterNode,input, i0...index, s0)
      r0.extend(Register0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:register][start_index] = r0

    r0
  end

  module Username0
  end

  def _nt_username
    start_index = index
    if node_cache[:username].has_key?(index)
      cached = node_cache[:username][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      i2 = index
      i3 = index
      if has_terminal?(" ", false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r4 = nil
      end
      if r4
        r3 = r4
      else
        if has_terminal?("\n", false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\n")
          r5 = nil
        end
        if r5
          r3 = r5
        else
          @index = i3
          r3 = nil
        end
      end
      if r3
        r2 = nil
      else
        @index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        if index < input_length
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("any character")
          r6 = nil
        end
        s1 << r6
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Username0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:username][start_index] = r0

    r0
  end

  module Password0
  end

  def _nt_password
    start_index = index
    if node_cache[:password].has_key?(index)
      cached = node_cache[:password][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      i2 = index
      i3 = index
      if has_terminal?(" ", false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r4 = nil
      end
      if r4
        r3 = r4
      else
        if has_terminal?("\n", false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\n")
          r5 = nil
        end
        if r5
          r3 = r5
        else
          @index = i3
          r3 = nil
        end
      end
      if r3
        r2 = nil
      else
        @index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        if index < input_length
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("any character")
          r6 = nil
        end
        s1 << r6
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Password0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:password][start_index] = r0

    r0
  end

  module Part0
  end

  module Part1
  end

  def _nt_part
    start_index = index
    if node_cache[:part].has_key?(index)
      cached = node_cache[:part][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("\\part{", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure("\\part{")
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        i4 = index
        if has_terminal?("}", false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("}")
          r5 = nil
        end
        if r5
          r4 = nil
        else
          @index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s3 << r4
        if r4
          if index < input_length
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r6 = nil
          end
          s3 << r6
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Part0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        if has_terminal?("}", false, index)
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("}")
          r7 = nil
        end
        s0 << r7
      end
    end
    if s0.last
      r0 = instantiate_node(PartNode,input, i0...index, s0)
      r0.extend(Part1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:part][start_index] = r0

    r0
  end

  module Chapter0
  end

  module Chapter1
  end

  def _nt_chapter
    start_index = index
    if node_cache[:chapter].has_key?(index)
      cached = node_cache[:chapter][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("\\chapter{", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 9))
      @index += 9
    else
      terminal_parse_failure("\\chapter{")
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        i4 = index
        if has_terminal?("}", false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("}")
          r5 = nil
        end
        if r5
          r4 = nil
        else
          @index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s3 << r4
        if r4
          if index < input_length
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r6 = nil
          end
          s3 << r6
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Chapter0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        if has_terminal?("}", false, index)
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("}")
          r7 = nil
        end
        s0 << r7
      end
    end
    if s0.last
      r0 = instantiate_node(ChapterNode,input, i0...index, s0)
      r0.extend(Chapter1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:chapter][start_index] = r0

    r0
  end

  module Section0
    def section_start
      elements[0]
    end

    def date
      elements[1]
    end

    def whitespace
      elements[3]
    end

    def show
      elements[4]
    end

    def entry
      elements[6]
    end
  end

  def _nt_section
    start_index = index
    if node_cache[:section].has_key?(index)
      cached = node_cache[:section][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_section_start
    s0 << r1
    if r1
      r2 = _nt_date
      s0 << r2
      if r2
        if has_terminal?("}", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("}")
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_whitespace
          s0 << r4
          if r4
            r6 = _nt_show
            if r6
              r5 = r6
            else
              r5 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r5
            if r5
              r8 = _nt_whitespace
              if r8
                r7 = r8
              else
                r7 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r7
              if r7
                r9 = _nt_entry
                s0 << r9
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SectionNode,input, i0...index, s0)
      r0.extend(Section0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:section][start_index] = r0

    r0
  end

  module Show0
    def username
      elements[0]
    end

    def spaces
      elements[1]
    end
  end

  module Show1
    def spaces1
      elements[1]
    end

    def spaces2
      elements[3]
    end

    def sequence
      elements[4]
    end

    def newline
      elements[5]
    end
  end

  def _nt_show
    start_index = index
    if node_cache[:show].has_key?(index)
      cached = node_cache[:show][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?("%", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("%")
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_spaces
      s0 << r2
      if r2
        if has_terminal?("show:", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 5))
          @index += 5
        else
          terminal_parse_failure("show:")
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_spaces
          s0 << r4
          if r4
            s5, i5 = [], index
            loop do
              i6, s6 = index, []
              r7 = _nt_username
              s6 << r7
              if r7
                r8 = _nt_spaces
                s6 << r8
              end
              if s6.last
                r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
                r6.extend(Show0)
              else
                @index = i6
                r6 = nil
              end
              if r6
                s5 << r6
              else
                break
              end
            end
            if s5.empty?
              @index = i5
              r5 = nil
            else
              r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            end
            s0 << r5
            if r5
              r9 = _nt_newline
              s0 << r9
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(ShowNode,input, i0...index, s0)
      r0.extend(Show1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:show][start_index] = r0

    r0
  end

  module Entry0
  end

  def _nt_entry
    start_index = index
    if node_cache[:entry].has_key?(index)
      cached = node_cache[:entry][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      i2 = index
      r3 = _nt_section_start
      if r3
        r2 = nil
      else
        @index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r2
      if r2
        if index < input_length
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("any character")
          r4 = nil
        end
        s1 << r4
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Entry0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(EntryNode,input, i0...index, s0)
    end

    node_cache[:entry][start_index] = r0

    r0
  end

  def _nt_section_start
    start_index = index
    if node_cache[:section_start].has_key?(index)
      cached = node_cache[:section_start][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("\\section{", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 9))
      @index += 9
    else
      terminal_parse_failure("\\section{")
      r0 = nil
    end

    node_cache[:section_start][start_index] = r0

    r0
  end

  module Date0
  end

  module Date1
    def month
      elements[0]
    end

    def spaces1
      elements[1]
    end

    def day
      elements[2]
    end

    def spaces2
      elements[3]
    end

    def spaces3
      elements[7]
    end

    def year
      elements[8]
    end
  end

  def _nt_date
    start_index = index
    if node_cache[:date].has_key?(index)
      cached = node_cache[:date][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_month
    s0 << r1
    if r1
      r2 = _nt_spaces
      s0 << r2
      if r2
        r3 = _nt_day
        s0 << r3
        if r3
          r4 = _nt_spaces
          s0 << r4
          if r4
            if has_terminal?("$^{", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure("$^{")
              r5 = nil
            end
            s0 << r5
            if r5
              s6, i6 = [], index
              loop do
                i7, s7 = index, []
                i8 = index
                if has_terminal?("}", false, index)
                  r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure("}")
                  r9 = nil
                end
                if r9
                  r8 = nil
                else
                  @index = i8
                  r8 = instantiate_node(SyntaxNode,input, index...index)
                end
                s7 << r8
                if r8
                  if index < input_length
                    r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure("any character")
                    r10 = nil
                  end
                  s7 << r10
                end
                if s7.last
                  r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
                  r7.extend(Date0)
                else
                  @index = i7
                  r7 = nil
                end
                if r7
                  s6 << r7
                else
                  break
                end
              end
              if s6.empty?
                @index = i6
                r6 = nil
              else
                r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
              end
              s0 << r6
              if r6
                if has_terminal?("}$,", false, index)
                  r11 = instantiate_node(SyntaxNode,input, index...(index + 3))
                  @index += 3
                else
                  terminal_parse_failure("}$,")
                  r11 = nil
                end
                s0 << r11
                if r11
                  r12 = _nt_spaces
                  s0 << r12
                  if r12
                    r13 = _nt_year
                    s0 << r13
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(DateNode,input, i0...index, s0)
      r0.extend(Date1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:date][start_index] = r0

    r0
  end

  def _nt_month
    start_index = index
    if node_cache[:month].has_key?(index)
      cached = node_cache[:month][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?("January", false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 7))
      @index += 7
    else
      terminal_parse_failure("January")
      r1 = nil
    end
    if r1
      r0 = r1
      r0.extend(MonthNode)
    else
      if has_terminal?("February", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 8))
        @index += 8
      else
        terminal_parse_failure("February")
        r2 = nil
      end
      if r2
        r0 = r2
        r0.extend(MonthNode)
      else
        if has_terminal?("March", false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 5))
          @index += 5
        else
          terminal_parse_failure("March")
          r3 = nil
        end
        if r3
          r0 = r3
          r0.extend(MonthNode)
        else
          if has_terminal?("April", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 5))
            @index += 5
          else
            terminal_parse_failure("April")
            r4 = nil
          end
          if r4
            r0 = r4
            r0.extend(MonthNode)
          else
            if has_terminal?("May", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure("May")
              r5 = nil
            end
            if r5
              r0 = r5
              r0.extend(MonthNode)
            else
              if has_terminal?("June", false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 4))
                @index += 4
              else
                terminal_parse_failure("June")
                r6 = nil
              end
              if r6
                r0 = r6
                r0.extend(MonthNode)
              else
                if has_terminal?("July", false, index)
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 4))
                  @index += 4
                else
                  terminal_parse_failure("July")
                  r7 = nil
                end
                if r7
                  r0 = r7
                  r0.extend(MonthNode)
                else
                  if has_terminal?("August", false, index)
                    r8 = instantiate_node(SyntaxNode,input, index...(index + 6))
                    @index += 6
                  else
                    terminal_parse_failure("August")
                    r8 = nil
                  end
                  if r8
                    r0 = r8
                    r0.extend(MonthNode)
                  else
                    if has_terminal?("September", false, index)
                      r9 = instantiate_node(SyntaxNode,input, index...(index + 9))
                      @index += 9
                    else
                      terminal_parse_failure("September")
                      r9 = nil
                    end
                    if r9
                      r0 = r9
                      r0.extend(MonthNode)
                    else
                      if has_terminal?("October", false, index)
                        r10 = instantiate_node(SyntaxNode,input, index...(index + 7))
                        @index += 7
                      else
                        terminal_parse_failure("October")
                        r10 = nil
                      end
                      if r10
                        r0 = r10
                        r0.extend(MonthNode)
                      else
                        if has_terminal?("November", false, index)
                          r11 = instantiate_node(SyntaxNode,input, index...(index + 8))
                          @index += 8
                        else
                          terminal_parse_failure("November")
                          r11 = nil
                        end
                        if r11
                          r0 = r11
                          r0.extend(MonthNode)
                        else
                          if has_terminal?("December", false, index)
                            r12 = instantiate_node(SyntaxNode,input, index...(index + 8))
                            @index += 8
                          else
                            terminal_parse_failure("December")
                            r12 = nil
                          end
                          if r12
                            r0 = r12
                            r0.extend(MonthNode)
                          else
                            @index = i0
                            r0 = nil
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:month][start_index] = r0

    r0
  end

  def _nt_day
    start_index = index
    if node_cache[:day].has_key?(index)
      cached = node_cache[:day][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
      if s0.size == 2
        break
      end
    end
    if s0.size < 1
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(DayNode,input, i0...index, s0)
    end

    node_cache[:day][start_index] = r0

    r0
  end

  def _nt_year
    start_index = index
    if node_cache[:year].has_key?(index)
      cached = node_cache[:year][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
      if s0.size == 4
        break
      end
    end
    if s0.size < 4
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(YearNode,input, i0...index, s0)
    end

    node_cache[:year][start_index] = r0

    r0
  end

  def _nt_whitespace
    start_index = index
    if node_cache[:whitespace].has_key?(index)
      cached = node_cache[:whitespace][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1 = index
      if has_terminal?(" ", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r2 = nil
      end
      if r2
        r1 = r2
      else
        r3 = _nt_newline
        if r3
          r1 = r3
        else
          @index = i1
          r1 = nil
        end
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(WhitespaceNode,input, i0...index, s0)
    end

    node_cache[:whitespace][start_index] = r0

    r0
  end

  def _nt_spaces
    start_index = index
    if node_cache[:spaces].has_key?(index)
      cached = node_cache[:spaces][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?(" ", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(" ")
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:spaces][start_index] = r0

    r0
  end

  def _nt_eop
    start_index = index
    if node_cache[:eop].has_key?(index)
      cached = node_cache[:eop][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_newline
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.size < 2
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:eop][start_index] = r0

    r0
  end

  def _nt_newline
    start_index = index
    if node_cache[:newline].has_key?(index)
      cached = node_cache[:newline][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("\n", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("\n")
      r0 = nil
    end

    node_cache[:newline][start_index] = r0

    r0
  end

end

class JournalParser < Treetop::Runtime::CompiledParser
  include Journal
end
