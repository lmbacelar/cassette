class MeasurementsController < ApplicationController
  before_filter :load_instrument, except: [:destroy]

  respond_to :html, :json, :xml

  def index
    @measurements = @instrument.measurements.timelined.page(params[:page]).per(10)
    respond_with @measurements
  end

  def new
    @measurement = @instrument.measurements.new
    respond_with @measurement
  end

  def create
    @measurement = @instrument.measurements.build(params[:measurement])
    flash[:notice] = "#{Measurement.model_name.human} #{t 'flash.notice.create'}" if @measurement.save
    respond_with @measurement, location: instrument_measurements_url(@instrument)
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    instrument_id = @measurement.instrument_id
    @measurement.destroy
    flash[:notice] = "#{Measurement.model_name.human} #{t 'flash.notice.destroy'}"
    respond_with @measurement, location: instrument_measurements_url(instrument_id)
  end

  private
  def load_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end
end
