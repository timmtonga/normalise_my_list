def start

	items = Rxnconso.all

	(items || []).each do |item|
		item.soundex =Text::Metaphone.metaphone(item.STR) 
		item.save
	end
end

start
