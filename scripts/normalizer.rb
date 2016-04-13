def start
  terms = []
  CSV.foreach("#{Rails.root}/data/final_list.csv") do |row|
     entry = "#{row[0].squish}"
     if !row[4].blank?
       entry += " #{row[4].squish}"
     end
     if !row[2].blank?
       entry += " #{row[2].squish}"
     end
     terms << entry
  end


  CSV.open("#{Rails.root}/output/#{Date.today}-drug-list.csv", "wb") do |csv|
    terms.uniq.each  do |item|
        csv << [item]
    end
  end

end

start
