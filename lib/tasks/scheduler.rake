desc "Accept comments older than 2 days"
task accept_old: :environment do
  puts "#{Comment.accept_old} comments have been accepted!"
end