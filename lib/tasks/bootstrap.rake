namespace :bootstrap do
  task staging: [:environment] do |_args|
    HTTP.post("https://0713-67-4-145-209.ngrok.io/webhooks/apps", json: { app_id: `hostname`.chomp })
  end
end
