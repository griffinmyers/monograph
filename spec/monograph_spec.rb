require 'spec_helper'

module Latex

  describe LatexParser do

    before do
      @parser = LatexParser.new
    end

    describe "#Parser" do

      # Holy god. So I have to document this somewhere. Apparently, there can
      # exist a 'failure_reason' on something that parsed correctly. WHY
      # THE FUCK WOULD THIS BE THE CASE?
      it 'should parse a section' do
        html = @parser.parse("\\section{April 3$^{rd}$, 2013} Dear Journal...").html
        html.should == "<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal...</p></div></article>"
      end

      it 'should ignore parts and chapters' do
        html = @parser.parse("\\part{2012} \\chapter{March} ").html
        html.should == ""
      end

      it 'should parse multiple sections' do
        html = @parser.parse("\\part{2012} \\chapter{March} \\section{April 3$^{rd}$, 2013} \\emph{what up what up} yall \\section{April 4$^{th}$, 2013} fuck \\textsc{tha haters}").html
        html.should == "<article><div class='date'>3 April 2013</div><div class='entry'><p><em>what up what up</em> yall </p></div></article><article><div class='date'>4 April 2013</div><div class='entry'><p>fuck <span class='textsc'>tha haters</span></p></div></article>"
      end

    end

    describe "#JournalContainer" do

      it 'should give me nothing when there are no users to build for' do
        container = @parser.parse("\\section{April 3$^{rd}$, 2013} Dear Journal...").container
        container.to_h.should == {}
      end

      it 'should allow me to whitelist someone to see the entire journal' do
        container = @parser.parse("% whitelist: griffinmyers password123 \\section{April 3$^{rd}$, 2013} Dear Journal...").container
        container.to_h.should == {
          :griffinmyers => "<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal...</p></div></article>"
        }
      end

      it 'should allow me to whitelist multiple people to see the entire journal' do
        container = @parser.parse("% whitelist: griffinmyers password123 \n % whitelist: roymuntz freshness \\section{April 3$^{rd}$, 2013} Dear Journal...").container
        container.to_h.should == {
          :griffinmyers => "<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal...</p></div></article>",
          :roymuntz => "<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal...</p></div></article>"
        }
      end

      it 'should allow me to register someone and give them nothing if I never show them anything' do
        container = @parser.parse("% register: roymuntz password123 \\section{April 3$^{rd}$, 2013} Dear Journal... \\section{April 4$^{th}$, 2013} Fuck Munson...").container
        container.to_h.should == {
          :roymuntz => ""
        }
      end

      it 'should allow me to register someone and show them only the posts I showed them' do
        container = @parser.parse("% register: roymuntz password123 \\section{April 3$^{rd}$, 2013} % show: roymuntz \n Dear Journal... \\section{April 4$^{th}$, 2013} Fuck Munson...").container
        container.to_h.should == {
          :roymuntz => "<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal... </p></div></article>"
        }
      end

      it 'should allow me to register multiple people and assign multiple, distinct posts to each' do
        container = @parser.parse("% register: roymuntz password123 %register: etj vibesquad \\section{April 3$^{rd}$, 2013} % show: roymuntz etj \n Dear Journal... \\section{April 4$^{th}$, 2013} Fuck The Dinner Dogs... \\section{April 5$^{th}$, 2013} %show: etj \n Fuck The Munson... \\section{April 6$^{th}$, 2013} %show: roymuntz \n Fuck Ernst...").container
        container.to_h.should == {
          :roymuntz => "<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal... </p></div></article><article><div class='date'>6 April 2013</div><div class='entry'><p>Fuck Ernst...</p></div></article>",
          :etj=>"<article><div class='date'>3 April 2013</div><div class='entry'><p>Dear Journal... </p></div></article><article><div class='date'>5 April 2013</div><div class='entry'><p>Fuck The Munson... </p></div></article>"
        }
      end

      it 'should throw an error if we try to show something to an unregistered user' do
        expect { @parser.parse("\\section{April 3$^{rd}$, 2013} % show: roymuntz \n Dear Journal... \\section{April 4$^{th}$, 2013} Fuck Munson...").container }.to raise_error(InvalidUserError)
      end

      it 'should allow me a public account' do
        container = @parser.parse("% public: resume \\section{April 3$^{rd}$, 2013} % show: resume \n All About Me \\section{April 4$^{th}$, 2013} Fuck The Dinner Dogs...").container
        container.to_h.should == { :resume=>"<article><div class='date'>3 April 2013</div><div class='entry'><p>All About Me </p></div></article>" }
      end

    end

  end

end