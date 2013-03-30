class InstrumentsController < ApplicationController
  respond_to :html, :json, :xml, :js

  helper_method :sort_column, :sort_direction

  def index
    @instruments = Instrument.search(params[:search])
                             .page(params[:page]).per(10)
                             .order(sort_column + ' ' + sort_direction)
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

  private
  def sort_column
    Instrument.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
    
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
