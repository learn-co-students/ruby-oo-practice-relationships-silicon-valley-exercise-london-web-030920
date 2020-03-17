class VentureCapitalist

    attr_reader :name, :total_worth, :tres_commas_club
    
    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth

        @@all << self
    end

    def self.all 
        @@all
    end

    def self.tres_commas_club
        self.all.select{|vent| 150 <= vent.total_worth}
    end
    
    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def all_funding_rounds
        FundingRound.all.select{|fund| fund.venture_capitalist == self }
    end

    def portfolio 
        self.all_funding_rounds.map{|fund| fund.startup}
    end

    def biggest_investment 
        self.all_funding_rounds.max_by{|fund| fund.investment}
    end

    def invested(domain)
      all = self.all_funding_rounds.select{|fund| fund.startup.domain == domain}
      all = all.map{|fund| fund.investment }
      all.sum
    end
    
end