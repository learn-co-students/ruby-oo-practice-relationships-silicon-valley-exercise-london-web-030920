class Startup
 
    attr_reader :founder 
    attr_accessor :domain, :name
    
    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain

        @@all << self
    end

    def self.all 
        @@all
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def all_funding_rounds
        Funding.round.select{|round| round.startup == self}
    end

    def self.find_by_founder(name)
        self.all.find{|startup| startup.founder == name}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def all_funding_rounds
        FundingRound.all.select{|fund| fund.startup == self }
    end

    def num_funding_rounds 
        self.all_funding_rounds.length
    end 

    def total_funds 
        self.all_funding_rounds.map{|fund| fund.investment}.sum
    end

    def investors
        self.all_funding_rounds.map{|fund| fund.venture_capitalist}.uniq
    end

    def big_investors 
        self.investors.select{|investor| 150 < investor.total_worth}.uniq
    end

end
