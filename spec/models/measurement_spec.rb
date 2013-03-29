require 'spec_helper'

describe Measurement do
  it 'returns #timelined measurements' do
    expect(Measurement.timelined.to_sql).to eq Measurement.order('timestamp DESC').to_sql
  end
end
