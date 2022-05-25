namespace :bootstrap do
  task staging: [:environment] do |_args|
    repo = File.read(Rails.root.join("app.json"))
    json = JSON.parse(repo)
    HTTP.post("http://localhost:3000/webhooks/apps", json: {
      app_id: ENV['HEROKU_APP_ID'],
      app_name: ENV['HEROKU_APP_NAME'],
      dyno_id: ENV['HEROKU_DYNO_ID'],
      parent_app_name: ENV['HEROKU_PARENT_APP_NAME'],
      repo_url: json['repository']
    })
  end
end
