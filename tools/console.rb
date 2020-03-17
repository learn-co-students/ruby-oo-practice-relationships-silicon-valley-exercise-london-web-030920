require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_1 = Startup.new("name_1", "founder_1", "domain_1")
startup_2 = Startup.new("name_2", "founder_2", "domain_1")
startup_3 = Startup.new("name_3", "founder_3", "domain_1")

venture_capitalist_1 = VentureCapitalist.new("name_1", 100)
venture_capitalist_2 = VentureCapitalist.new("name_2", 200)

funding_round_1 = FundingRound.new(startup_1, venture_capitalist_2, "type_1", 10)
funding_round_2 = FundingRound.new(startup_2, venture_capitalist_1, "type_2", 10)
funding_round_3 = FundingRound.new(startup_1, venture_capitalist_2, "type_3", 20)
funding_round_4 = FundingRound.new(startup_1, venture_capitalist_1, "type_3", 40)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line