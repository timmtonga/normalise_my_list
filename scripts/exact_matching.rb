def start
	terms = []

	CSV.foreach("#{Rails.root}/data/2016-04-12-drug-list.csv") do |row|

		terms << row[0].squish

	end

	
	CSV.open("#{Rails.root}/output/exact_matching_#{Time.now}.csv", "wb") do |csv|
		terms.uniq.each  do |item|

			w = Rxnconso.where("STR = ?",item)
			if !w.blank?
				csv << [item, w.collect{|x| x.RXAUI}, w.collect{|x| x.STR}]
			end
		end
		
	end 

end

start
