require 'csv'

PATH = '/Users/mariamolinar/THP/the_gossip_project_sinatra/'

class Gossip
attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end 

  def save
    CSV.open(PATH + "db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read(PATH + "db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    gossip = self.all[id]
    if gossip.nil?
      puts "This is empty or not valid"
    else
      gossip
    end
  end
end
