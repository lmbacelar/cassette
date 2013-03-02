class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @instrument }
    end
  end
   
  def new
    @instrument = Instrument.new
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = Instrument.new(params[:instrument])
    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: "#{Instrument.model_name.human} #{t 'flash.notice.create'}" }
        format.json { render json: @instrument, status: :created, location: @instrument }
      else
        format.html { render action: "new" }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @instrument = Instrument.find(params[:id])

    respond_to do |format|
      if @instrument.update_attributes(params[:instrument])
        format.html { redirect_to @instrument, notice: "#{Instrument.model_name.human} #{t 'flash.notice.update'}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    respond_to do |format|
      format.html { redirect_to instruments_url, notice: "#{Instrument.model_name.human} #{t 'flash.notice.destroy'}" }
      format.json { head :no_content }
    end
  end
end
