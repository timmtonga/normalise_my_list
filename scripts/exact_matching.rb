def start
	terms = []

	CSV.foreach("#{Rails.root}/data/meml_2009_final.csv") do |row|
		terms << row[0].squish
	end
	count = 0
	total = terms.length

	CSV.open("#{Rails.root}/output/exact_matching_#{Time.now.strftime('%Y%d%b%H%M')}.csv", "wb") do |csv|

		(terms || []).each  do |item|

			w = Rxnconso.where("STR = ?",item)
			if !w.blank?
				csv << [item, w.collect{|x| x.RXAUI}, w.collect{|x| x.STR}]
			end

			count += 1
			puts "#{count} out of #{total}"
		end
	end
end

start
