class League


  class << self

    def all
      agent = Mechanize.new
      page = agent.get('http://www.soccerstats.com/latest.asp?league=england')
      document = Nokogiri::HTML(page.content)

      select = document.search("[name='countryLeague']")
      select.first.children.collect do |league|
        if league.values.first != "#"
          /.*league=(.+)/=~league.values.first
          $1
        end
      end.compact
    end

  end

end
