class ReservesController < ApplicationController
  before_filter :validateAuth, :except => [:index,:view]

  # GET /reserves
  # GET /reserves.json
  def view
    
  end
  def index
    @reserves = Reserve.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @reserves }
    end
  end

  # GET /reserves/1
  # GET /reserves/1.json
  def show
    @reserf = Reserve.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @reserf }
    end
  end

  # GET /reserves/new
  # GET /reserves/new.json
  def new
    @reserf = Reserve.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reserf }
    end
  end

  # GET /reserves/1/edit
  def edit
    @mensaje = 'Despachada con exito'
    @reserf = Reserve.find(params[:id])
    if(@reserf.estado == 1)then
      @reserf.estado=2
      @reserf.save
    else
      @mensaje = 'Ya fue despachada'
    end

    respond_to do |format|
      format.html { redirect_to reserves_path, :notice => @mensaje }
      format.json { head :no_content }
    end
  end

  # POST /reserves
  # POST /reserves.json
  def create
    @mensaje='Reserve was successfully created.'
    if params[:reserve][:material_ids]
      @materiales= params[:reserve][:material_ids].map{|k, v| k}
    else
      @materiales = []
    end
    @reserf = Reserve.new()
    @reserf.estado=params[:reserve][:estado]
    @reserf.cantidad=params[:reserve][:cantidad]
    @materiales.each do |m|
      @i=Material.find(m)
      if (@i.cantidadfisica >= @reserf.cantidad)then 
        @i.cantidadfisica=@i.cantidadfisica-@reserf.cantidad
        @i.save
        @reserf.materials <<@i  
      else
        @mensaje='no hay suficiente cantidad de algun material, el material se ha eliminado de la lista'        
      end
      
    end
    @users=User.all
    @users.each do |t|
      if (session[:userdata]==t.nombre)
        @user=t
      end  
    end
    @reserf.user=@user
    respond_to do |format|
      if @reserf.save
        format.html { redirect_to @reserf, :notice => @mensaje }
        format.json { render :json => @reserf, :status => :created, :location => @reserf }
      else
        format.html { render :action => "new" }
        format.json { render :json => @reserf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reserves/1
  # PUT /reserves/1.json
  def update
    
    @mensaje = 'Despachada con exito'
    @reserf = Reserve.find(params[:id])
    if(@reserf.estado == 1)then
      @reserf.estado=2
      @reserf.save
    else
      @mensaje = 'Ya fue despachada'
    end

    respond_to do |format|
      format.html { redirect_to reserves_path, :notice => @mensaje }
      format.json { head :no_content }
    end
  end

  # DELETE /reserves/1
  # DELETE /reserves/1.json
  def destroy
    @mensaje = 'Cancelada con exito'
    @reserf = Reserve.find(params[:id])
    if(@reserf.estado == 1)then
      @reserf.materials.each do |m|
        m.cantidadfisica+=@reserf.cantidad
        m.save
      end
      @reserf.destroy
    else
      @mensaje = 'La reserva ya fue despachada, no se puede cancelar'
    end

    respond_to do |format|
      format.html { redirect_to reserves_url, :notice => @mensaje }
      format.json { head :no_content }
    end
  end
end