class StartupsController < ApplicationController
  
  def index
    if params[:search].nil? || params[:search].blank?
      raw_list = AngellistApi.get_tag_startups(9217, {:page => params[:page], :per_page => 50, :order => "popularity"})
      @startups = raw_list.startups
    else
      @search_text = params[:search]
      search = AngellistApi.search(@search_text, {type: "Startup"})
      items = []
      search.each do |item| 
        items << item.id
      end
      @startups = AngellistApi.get_startups(items)
    end
    @startups.define_singleton_method(:total_pages) do
      return raw_list ? raw_list.last_page : 1
    end
    @startups.define_singleton_method(:current_page) do
      return raw_list ? raw_list.page : 1
    end
  end
  
  def show
    @startup = AngellistApi.get_startup(params[:id])
  end
  
  def create
    @startup = Startup.new(params[:startup])
    if @startup.save
      @created = true
    else
      @created = false
    end
  end
  
  def update
    @startup = Startup.find_by_company_id(params[:startup][:company_id])
    if @startup.update_attributes(params[:startup])
      @created = true
    else
      @created = false
    end
    
  end
  
  def destroy
    
  end
  
  
end
