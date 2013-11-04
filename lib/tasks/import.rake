desc 'import from open beer database'
task :import => :environment do
  require 'bartender' 

  def import_page(page)
    page['beers'].each { |beer_json|
      name = beer_json['name']
      brand = beer_json['brewery']['name']
      obdb_id =  beer_json['id']
      beer = Beer.find_or_initialize_by(obdb_id: obdb_id)
      beer.name = name
      beer.brand = brand
      beer.save!
    }
  end
  
  current_page = 1
  total_pages = 2

  while current_page <= total_pages 
    beers_result = Bartender::Beer.all(page: current_page)
    total_pages = beers_result['pages']

    import_page(beers_result) 

    current_page += 1
  end

end
