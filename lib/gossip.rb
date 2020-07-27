require 'CSV'

class Gossip
	attr_accessor :gossip_author, :gossip_content

	def initialize (gossip_author, gossip_content)
		@gossip_author = gossip_author
		@gossip_content = gossip_content
	end

	def save
	  CSV.open("./db/gossip.csv", "ab") do |csv|
	    csv << [gossip_author, gossip_content]
	  end
	end

	def self.all
	  all_gossips = []
	  CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips
	end

	def self.find(id)
		table = CSV.read("./db/gossip.csv")
		return table[id]
	end

	# def self.replace(id, gossip_author, gossip_content)
	# 	table = CSV.read("./db/gossip.csv")
	# 	table[id] = [gossip_author, gossip_content]
	# 	end

	# 	CSV.open("./db/gossip.csv", "w") do |csv| 
	# 		table.each do |row|
	# 			csv << row
	# 		end
	# 	end
	# end
end
