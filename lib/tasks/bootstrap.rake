namespace :bootstrap do
  task staging: [:environment] do |_args|
    HTTP.post("https://2070-67-4-145-209.ngrok.io/webhooks/apps", json: {
      app_id: ENV['HEROKU_APP_ID'],
      app_name: ENV['HEROKU_APP_NAME'],
      dyno_id: ENV['HEROKU_DYNO_ID'],
      parent_app_name: ENV['HEROKU_PARENT_APP_NAME']
    })
  end
end
