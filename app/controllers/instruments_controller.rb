class InstrumentsController < ApplicationController
  respond_to :html
  respond_to :json, :xml, except: [:new, :edit]
  respond_to :csv, :xls, :js, only: :index

  helper_method :sort_column, :sort_direction

  def index
    @instruments = Instrument.text_search(params[:search])
                             .page(params[:page]).per(per_page)
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

  def per_page
    %w{csv xls}.include?(params[:format]) ? nil : 10
  end
end
