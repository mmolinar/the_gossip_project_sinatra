require 'csv'
require 'pry'

PATH = '/Users/mariamolinar/THP/the_gossip_project_sinatra/'

class Gossip
  def save
    CSV.open(PATH + "db/gossip.csv", "ab") do |csv|
      csv << ["Mon super auteur", "Ma super description"]
    end
  end
end
binding.pry
