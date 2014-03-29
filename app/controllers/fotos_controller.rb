class FotosController < ApplicationController
  # GET /fotos
  # GET /fotos.json
  before_filter :authenticate_user!, :except => [:create]
  layout 'app'
  def index
    @fotos = Foto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fotos }
    end
  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
    @foto = Foto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foto }
    end
  end

  # GET /fotos/new
  # GET /fotos/new.json
  def new
    @foto = Foto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foto }
    end
  end

  # GET /fotos/1/edit
  # def edit
  #   @foto = Foto.find(params[:id])
  # end

  # POST /fotos
  # POST /fotos.json
  def create
    @foto = Foto.new(params[:foto])

    # respond_to do |format|
      if @foto.save
        p 'true'
        render :json => "true".as_json
      else
        Visitum.find(@foto.visitum_id).delete
        p 'false'
        render :json => "false".as_json
      end
    # end
  end

  # # PUT /fotos/1
  # # PUT /fotos/1.json
  # def update
  #   @foto = Foto.find(params[:id])

  #   respond_to do |format|
  #     if @foto.update_attributes(params[:foto])
  #       format.html { redirect_to @foto, notice: 'Foto was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @foto.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /fotos/1
  # # DELETE /fotos/1.json
  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy

    respond_to do |format|
      format.html { redirect_to fotos_url }
      format.json { head :no_content }
    end
  end
end
