module Facebook
  CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID = CONFIG['app_id']
  APP_SECRET = CONFIG['app_secret']
  CALLBACK_URL = CONFIG['callback_url']
  SCOPE = 'user_likes, user_birthday, user_education_history, user_work_history, user_location, email, user_religion_politics, read_stream'
end