class ReservesController < ApplicationController
  before_filter :validateAuth, :except => :index

  # GET /reserves
  # GET /reserves.json
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
    @reserf = Reserve.find(params[:id])
  end

  # POST /reserves
  # POST /reserves.json
  def create
    if params[:reserve][:material_ids]
      @materiales= params[:reserve][:material_ids].map{|k, v| k}
    else
      @materiales = []
    end
    @reserf = Reserve.new(params[:reserf])
    @materiales.each do |m|
      @i=Material.find(m)
      
      @reserf.materials <<@i
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
        format.html { redirect_to @reserf, :notice => 'Reserve was successfully created.' }
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
    if params[:reserve][:material_ids]
      @materiales= params[:reserve][:material_ids].map{|k, v| k}
    else
      @materiales = []
    end
    @reserf = Reserve.new(params[:reserf])
    @materiales.each do |m|
      @i=Material.find(m)
      @reserf.materials <<@i
    end
    @users=User.all
    @users.each do |t|
      if (session[:userdata]==t.nombre)
        @user=t
      end  
    end
    @reserf.user=@user

    respond_to do |format|
      if @reserf.update_attributes(params[:reserf])
        format.html { redirect_to @reserf, :notice => 'Reserve was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @reserf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reserves/1
  # DELETE /reserves/1.json
  def destroy
    @reserf = Reserve.find(params[:id])
    @reserf.destroy

    respond_to do |format|
      format.html { redirect_to reserves_url }
      format.json { head :no_content }
    end
  end
end
