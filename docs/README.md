Remove beers without breweries: Beer.all.select{|b| b.brewery.nil?}.each &:delete
Remove ratings without beer: Rating.all.select{ |r| r.beer.nil? }.each(&:delete)

