def start

  terms = []
  CSV.foreach("#{Rails.root}/data/meml_2015.csv") do |row|
    terms << row
  end

  CSV.open("#{Rails.root}/data/meml_2015_final.csv", "wb") do |csv|
    (terms.uniq || []).each do |term|
      csv << term
    end
  end

end

start