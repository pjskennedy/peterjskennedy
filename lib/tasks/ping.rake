require 'net/http'

namespace :ping do
  desc "Updating heroku apps"
  task :do => :environment do
    Net::HTTP.get(URI.parse('http://www.labmate.ca/'))
    Net::HTTP.get(URI.parse('http://www.peterjskennedy.com'))
    Net::HTTP.get(URI.parse('http://www.currentsessions.com/'))
    puts 'Taking Data!'
    puts '--> ' + Time.now.asctime  
  end
end
