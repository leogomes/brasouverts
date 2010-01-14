class MembresController < ApplicationController

  layout 'brasouverts'

  # finds the associated foyer before runnign any method
  before_filter :find_foyer

  # GET /membres
  # GET /membres.xml
  def index
    @membres = @foyer.membres

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @membres }
    end
  end

  # GET /membres/1
  # GET /membres/1.xml
  def show
    @membre = @foyer.membres.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @membre }
    end
  end

  # GET /membres/new
  # GET /membres/new.xml
  def new
    @membre = @foyer.membres.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @membre }
    end
  end

  # GET /membres/1/edit
  def edit
    @membre = @foyer.membres.find(params[:id])
  end

  # POST /membres
  # POST /membres.xml
  def create
    @membre = @foyer.membres.build(params[:membre])

    respond_to do |format|
      if @membre.save
        flash[:notice] = 'Membre a bien été rajouté.'
        format.html { redirect_to foyer_url(@foyer) }
        format.xml  { render :xml => @membre, :status => :created, :location => @membre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @membre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /membres/1
  # PUT /membres/1.xml
  def update
    @membre = @foyer.membres.find(params[:id])

    respond_to do |format|
      if @membre.update_attributes(params[:membre])
        flash[:notice] = 'Membre a bien été mis à jour.'
        format.html { redirect_to edit_foyer_url(@foyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /membres/1
  # DELETE /membres/1.xml
  def destroy
    @membre = @foyer.membres.find(params[:id])
    @membre.destroy

    respond_to do |format|
      format.html { redirect_to foyer_url(@foyer) }
      format.xml  { head :ok }
    end
  end

  # First thing to do is to find the associated foyer
  def find_foyer
    @foyer = Foyer.find(params[:foyer_id])
  end
end
