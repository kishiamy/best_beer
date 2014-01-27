APP_CONFIG = YAML.load_file("config/brewery_db.yml")

BestBeer::Application.config.api_key = APP_CONFIG[Rails.env]['api_key']
