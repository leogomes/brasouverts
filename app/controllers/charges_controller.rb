class ChargesController < ApplicationController

  layout 'brasouverts'

  # finds the associated foyer before runnign any method
  before_filter :find_foyer

  # GET /charges
  # GET /charges.xml
  def index
    @charges = @foyer.charges

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charges }
    end
  end

  # GET /charges/1
  # GET /charges/1.xml
  def show
    @revenu = @foyer.charges.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @revenu }
    end
  end

  # GET /charges/new
  # GET /charges/new.xml
  def new
    @revenu = @foyer.charges.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @revenu }
    end
  end

  # GET /charges/1/edit
  def edit
    @revenu = @foyer.charges.find(params[:id])
  end

  # POST /charges
  # POST /charges.xml
  def create
    @revenu = @foyer.charges.build(params[:revenu])

    respond_to do |format|
      if @revenu.save
        flash[:notice] = 'Charge a bien été rajoutée.'
        format.html { redirect_to foyer_url(@foyer) }
        format.xml  { render :xml => @revenu, :status => :created, :location => @revenu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @revenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charges/1
  # PUT /charges/1.xml
  def update
    @revenu = @foyer.charges.find(params[:id])

    respond_to do |format|
      if @revenu.update_attributes(params[:revenu])
        flash[:notice] = 'Charge a bien été mise à jour.'
        format.html { redirect_to edit_foyer_url(@foyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @revenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.xml
  def destroy
    @revenu = @foyer.charges.find(params[:id])
    @revenu.destroy

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
