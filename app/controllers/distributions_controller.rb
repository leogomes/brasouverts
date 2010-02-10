class DistributionsController < ApplicationController

  layout 'brasouverts'

  # finds the associated foyer before runnign any method
  before_filter :find_foyer, :except => ['search']
#  before_filter :find_element, :except => ['search', 'new']

  def search
    #    simply render the search.html page
    #    put all this in the index action and remove the mapping from the routes.rb
    # => for the search by date, put it in the model
    if params[:date]
      date = params[:date]
      str_date = date[:year] + '-'  + date[:month] + '-' + date[:day]
      @distributions = Distribution.search(str_date)
      render 'byDate'
    end
  end

  # GET /foyer/:id/distributions
  # GET /foyer/:id/distributions.xml
  def index
    @distributions = @foyer.distributions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @distributions }
    end
  end

  # GET /distributions/1
  # GET /distributions/1.xml
  def show
    @distribution = @foyer.distributions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @distribution }
    end
  end

  # GET /distributions/new
  # GET /distributions/new.xml
  def new
    @distribution = @foyer.distributions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @distribution }
    end
  end

  # GET /distributions/1/edit
  def edit
    @distribution = @foyer.distributions.find(params[:id])
  end

  # POST /distributions
  # POST /distributions.xml
  def create
    
    @distribution = @foyer.distributions.build(params[:distribution])

    respond_to do |format|
      if @distribution.save
        flash[:notice] = 'Distribution a bien été crée.'
        format.html { redirect_to foyer_distributions_url(@foyer) }
        format.xml  { render :xml => @distribution, :status => :created, :location => @distribution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /distributions/1
  # PUT /distributions/1.xml
  def update
    @distribution = Distribution.find(params[:id])

    respond_to do |format|
      if @distribution.update_attributes(params[:distribution])
        flash[:notice] = 'Distribution a bien été mise à jour.'
        format.html { redirect_to foyer_distributions_url(@foyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /distributions/1
  # DELETE /distributions/1.xml
  def destroy
    flash[:notice] = 'Distribution a bien été suprimée.'
    @distribution = Distribution.find(params[:id])
    @distribution.destroy

    respond_to do |format|
      format.html { redirect_to foyer_distributions_url(@foyer) }
      format.xml  { head :ok }
    end
  end

  # First thing to do is to find the associated foyer
  private
  def find_foyer
    @foyer = Foyer.find(params[:foyer_id])
    logger.info "Foyer found"
    logger.info @foyer.chef_nom
  end

#  private
#  def find_element
#    logger.info "Element id:"
#    logger.info params['element_id']
#    @element = Element.find(params['element_id'])
#  end

end
