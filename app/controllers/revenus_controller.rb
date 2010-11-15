class RevenusController < ApplicationController

  layout 'brasouverts'

  # finds the associated foyer before runnign any method
  before_filter :find_foyer

  # GET /revenus
  # GET /revenus.xml
  def index
    @revenus = @foyer.revenus

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @revenus }
    end
  end

  # GET /revenus/1
  # GET /revenus/1.xml
  def show
    @revenu = @foyer.revenus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @revenu }
    end
  end

  # GET /revenus/new
  # GET /revenus/new.xml
  def new
    @revenu = @foyer.revenus.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @revenu }
    end
  end

  # GET /revenus/1/edit
  def edit
    @revenu = @foyer.revenus.find(params[:id])
  end

  # POST /revenus
  # POST /revenus.xml
  def create
    @revenu = @foyer.revenus.build(params[:revenu])

    respond_to do |format|
      if @revenu.save
        flash[:notice] = 'Revenu a bien été rajouté.'
        format.html { redirect_to foyer_revenus_url(@foyer) }
        format.xml  { render :xml => @revenu, :status => :created, :location => @revenu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @revenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /revenus/1
  # PUT /revenus/1.xml
  def update
    @revenu = @foyer.revenus.find(params[:id])

    respond_to do |format|
      if @revenu.update_attributes(params[:revenu])
        flash[:notice] = 'Revenu a bien été mis à jour.'
        format.html { redirect_to foyer_revenus_url(@foyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @revenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /revenus/1
  # DELETE /revenus/1.xml
  def destroy
    @revenu = @foyer.revenus.find(params[:id])
    @revenu.destroy

    respond_to do |format|
      format.html { redirect_to foyer_revenus_url(@foyer) }
      format.xml  { head :ok }
    end
  end

  # First thing to do is to find the associated foyer
  def find_foyer
    @foyer = Foyer.find(params[:foyer_id])
  end

end
