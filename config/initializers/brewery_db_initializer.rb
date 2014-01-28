APP_CONFIG = YAML.load_file("config/brewery_db.yml")
APP_CONFIG ||= { production: { api_key: ENV["API_KEY"]  }  }

BestBeer::Application.config.api_key = APP_CONFIG[Rails.env]['api_key']
