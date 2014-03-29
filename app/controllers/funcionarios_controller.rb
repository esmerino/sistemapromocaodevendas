class FuncionariosController < ApplicationController
  # GET /funcionarios
  # GET /funcionarios.jso
  before_filter :authenticate_user!, :except => [:login,:listfuncionarios, :alterarsenha]
  layout 'app'
  def alterarsenha
    @id_funcionario = params["cod"]
    @senha_nova = params["senhanova"]

    @funcionario = Funcionario.find(@id_funcionario)

    if @funcionario 
      @funcionario.senha = @senha_nova
      if @funcionario.save
        p "true"
        render :json => "true"
      else
        p "false"
        render :json => "false"
      end

    else
      p "false"
      render :json => "false"
    end

  end
  def listfuncionarios
    render json: Funcionario.all.as_json
  end
  def login
    # params["funcionario[login]"];
    # params["funcionario[senha]"];
    @funcionario = Funcionario.where("login = '#{params["login"]}' and senha = '#{params["senha"]}'")

    if @funcionario.size > 0
      render :json => @funcionario[0].id.as_json
    else
      render :json => "false".as_json
    end
  end

  def reinit
    # @funcionario = Funcionario.find(params[:id]);

    # @funcionario.init_senha

    # if @funcionario.save
      render :json => "Ação realizada com sucesso".as_json
    # else
      # render :json => "Ocorreu uma falha, tente novamente".as_json
    # end

  end

  def index
    @funcionarios = Funcionario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcionarios }
    end
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/new
  # GET /funcionarios/new.json
  def new
    @funcionario = Funcionario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(params[:funcionario])

    @funcionario.senha = "padrao"

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully created.' }
        format.json { render json: @funcionario, status: :created, location: @funcionario }
      else
        format.html { render action: "new" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funcionarios/1
  # PUT /funcionarios/1.json
  def update
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      if @funcionario.update_attributes(params[:funcionario])
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy

    respond_to do |format|
      format.html { redirect_to funcionarios_url }
      format.json { head :no_content }
    end
  end
end
