CSV.generate do |csv|
  csv << ["Name", "Description", "URL"]
  @instruments.each do |instrument|
    csv << [
      instrument.name,
      instrument.description,
      instrument_url(instrument)
    ]
  end
end
