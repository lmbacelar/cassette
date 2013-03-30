CSV.generate do |csv|
  csv << ["ID", "Name", "Description", "URL"]
  @instruments.each do |instrument|
    csv << [
      instrument.id,
      instrument.name,
      instrument.description,
      instrument_url(instrument)
    ]
  end
end
