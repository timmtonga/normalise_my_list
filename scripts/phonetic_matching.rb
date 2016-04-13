def start
	terms = []

	CSV.foreach("#{Rails.root}/data/final_list.csv") do |row|

		CSV.open("#{Rails.root}/output/phonetic_matching_#{Time.now}.csv", "wb") do |csv|
	
			concept = row[0].squish!
			
			w = Rxnconso.where("soundex LIKE ?","#{Text::Metaphone.metaphone(concept)}%").pluck(:STR, :RXAUI,:RXCUI)

			if !w.blank?	
				item = concept
					if !row[4].blank?
       			item += " #{row[4].squish}"
			   	end
				 	if !row[2].blank?
				   	item += " #{row[2].squish}"
				 	end

				w.each do |term|
					if term.downcase == w[0].downcase
						csv << [item, w[1], w[2], w[0]]
					end
				end
			end
		end 
	end
end

start
