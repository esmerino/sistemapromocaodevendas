class VisitaController < ApplicationController
  # GET /visita
  # GET /visita.json
  before_filter :authenticate_user!, :except => [:create, :consulta]
  
  layout 'app'
  def consulta
    render :json => Visitum.find(:all, :conditions =>["date(data_hora_inicio) BETWEEN ? AND ? ", params[:datainicio],params[:datafim]])
  end
  def index
    @visita = Visitum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visita }
    end
  end

  # GET /visita/1
  # GET /visita/1.json
  def show
    @visitum = Visitum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visitum }
    end
  end



  # GET /visita/new
  # GET /visita/new.json
  # def new
  #   @visitum = Visitum.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @visitum }
  #   end
  # end

  # GET /visita/1/edit
  # def edit
  #   @visitum = Visitum.find(params[:id])
  # end

  # POST /visita
  # POST /visita.json
  def create
    @visitum = Visitum.new(params[:visitum])

    # respond_to do |format|
      if @visitum.save
        render :json => @visitum.id.as_json
      else
        p @visitum.errors
        render :json => "false".as_json
      end
    # end
  end

  # PUT /visita/1
  # PUT /visita/1.json
  # def update
  #   @visitum = Visitum.find(params[:id])

  #   respond_to do |format|
  #     if @visitum.update_attributes(params[:visitum])
  #       format.html { redirect_to @visitum, notice: 'Visitum was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @visitum.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /visita/1
  # DELETE /visita/1.json
  # def destroy
  #   @visitum = Visitum.find(params[:id])
  #   @visitum.destroy

  #   respond_to do |format|
  #     format.html { redirect_to visita_url }
  #     format.json { head :no_content }
  #   end
  # end
end
