class MaterialsController < ApplicationController
  # GET /materials
  # GET /materials.json
  def index
    @category= Category.find(params[:category_id])
    @materials = Material.where("category_id = ? ",@category.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @materials }
    end
  end
  def todos
    @materials = Material.all()
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @materials }
    end
  end
  # GET /materials/1
  # GET /materials/1.json
  def show
    @material = Material.find(params[:id])
    @category= Category.find(params[:category_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @material }
    end
  end

  # GET /materials/new
  # GET /materials/new.json
  def new
    @material = Material.new
    @category= Category.find(params[:category_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @material }
    end
  end

  # GET /materials/1/edit
  def edit
    @material = Material.find(params[:id])
    @category= Category.find(params[:category_id])
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(params[:material])
    @category= Category.find(params[:category_id])
    @category.materials << @material
    respond_to do |format|
      if @material.save
        format.html { redirect_to [@category,@material], :notice => 'Material was successfully created.' }
        format.json { render :json => @material, :status => :created, :location => @material }
      else
        format.html { render :action => "new" }
        format.json { render :json => @material.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /materials/1
  # PUT /materials/1.json
  def update
    @material = Material.find(params[:id])
    @category= Category.find(params[:category_id])
    
    respond_to do |format|
      if @material.update_attributes(params[:material])
        format.html { redirect_to [@category,@material], :notice => 'Material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @material.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @category= Category.find(params[:category_id])
    @material = Material.find(params[:id])
    @material.destroy

    respond_to do |format|
      format.html { redirect_to category_materials_url(@category) }
      format.json { head :no_content }
    end
  end
end
