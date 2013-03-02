class InstrumentsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @instruments = Instrument.all
    respond_with @instruments
  end

  def show
    @instrument = Instrument.find(params[:id])
    respond_with @instrument
  end
   
  def new
    @instrument = Instrument.new
    respond_with @instrument
  end

  def edit
    @instrument = Instrument.find(params[:id])
    respond_with @instrument
  end

  def create
    @instrument = Instrument.new(params[:instrument])
    flash[:notice] = "#{Instrument.model_name.human} #{t 'flash.notice.create'}" if @instrument.save
    respond_with @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    flash[:notice] = "#{Instrument.model_name.human} #{t 'flash.notice.update'}" if @instrument.update_attributes(params[:instrument])
    respond_with @instrument
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    flash[:notice] = "#{Instrument.model_name.human} #{t 'flash.notice.destroy'}"
    respond_with @instrument
  end
end
