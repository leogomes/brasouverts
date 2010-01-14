class FoyersController < ApplicationController
  layout 'brasouverts'

  # GET /foyers
  # GET /foyers.xml

  def index

    search = ""

    if params[:foyer] != nil
      search = params[:foyer][:chef_nom]
    end

    @foyers = Foyer.find(:all, :conditions => ['chef_nom LIKE ?', "%#{search}%"], :order => "chef_nom ASC")
    respond_to do |format|
      format.html {
#        if @foyers.size == 1
#          redirect_to(@foyers[0])
#        end

        # index.html.erb
      }
      format.js   # index.js.erb
      format.xml  { render :xml => @foyers }
    end
  end

  #  def index
  #    @foyers = Foyer.all
  #
  #    respond_to do |format|
  #      format.html # index.html.erb
  #      format.xml  { render :xml => @foyers }
  #    end
  #  end

  # GET /foyers/1
  # GET /foyers/1.xml
  def show
    @foyer = Foyer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @foyer }
    end
  end

  # GET /foyers/new
  # GET /foyers/new.xml
  def new
    @foyer = Foyer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @foyer }
    end
  end

  # GET /foyers/1/edit
  def edit
    @foyer = Foyer.find(params[:id])
  end

  # POST /foyers
  # POST /foyers.xml
  def create
    @foyer = Foyer.new(params[:foyer])

    respond_to do |format|
      if @foyer.save
        flash[:notice] = 'Le foyer a bien été enregistré.'
        format.html { redirect_to(@foyer) }
        format.xml  { render :xml => @foyer, :status => :created, :location => @foyer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @foyer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /foyers/1
  # PUT /foyers/1.xml
  def update
    @foyer = Foyer.find(params[:id])

    respond_to do |format|
      if @foyer.update_attributes(params[:foyer])
        flash[:notice] = 'Le foyer a bien été mis à jour.'
        format.html { redirect_to(@foyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @foyer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /foyers/1
  # DELETE /foyers/1.xml
  def destroy
    @foyer = Foyer.find(params[:id])
    @foyer.destroy

    respond_to do |format|
      format.html { redirect_to(foyers_url) }
      format.xml  { head :ok }
    end
  end
end
