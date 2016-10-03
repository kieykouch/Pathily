class StaticPageController < ApplicationController  

  before_filter :authenticate_user!, only: [:setting]

  def home
      @results = []
      @results += IndeedAPI.search_jobs(q: "Accountant").results
      print @results.length
  end
  
  def thankyoupage
	end

  def setting
  end
  
  def help  

  end
  
  def about
      @users = User.order(:email)
      @jobalerts = JobAlert.all
      respond_to do |format|
        format.html
        format.xlsx {render xlsx: 'download',filename: "Users.xlsx"}
      end
  end
  
  def jobs
    
  	@search_query = params[:search]
    search_query_location = params[:city]
    mylink = params[:searchLink]

  if mylink.present?

    firstquote =  mylink.index('"')    
    substring =  mylink[firstquote+1..-3]

    @search_query  = substring
    params[:search] = substring  
    
  end 

  value = 1
  if params[:page].present?
    value = params[:page].to_i
  end


	if @search_query.present?
      @jobs = IndeedAPI.search_jobs(q: @search_query, l: search_query_location, limit: 15) #sort: params[:sort], radius:params[:radius], jt:params[:jt], fromage:params[:fromage]
      @results =[]
      if @jobs.total_results > 15
        
        @results += Array.new((value-1)*15, "1")
        @results += IndeedAPI.search_jobs(q: @search_query, l: search_query_location, limit: 15, start: 25*value+1).results          
        @results += Array.new(225-(value-1)*15, "1")

      end
    else
    	# Search accountant straight
      @jobs = []
      @results = []
      @search_query = "Accountant"
      @results += IndeedAPI.search_jobs(q: @search_query, limit: 15).results
    end

    puts "1111111"
    @count_all_job = @results.length
    @results = Kaminari.paginate_array(@results).page(params[:page]).per(15)
	
  end
  
	protected

	def search_params
    	params.require(:jobs).permit(:search, :city, :radius, :sort, :jt, :fromage, :searchLink)
	end


	# class StackExchange1
	#   include HTTParty
	#   base_uri 'api.indeed.com'

	#   def initialize(thequery, location)
	#     @options = { query: 
	#     	{publisher: '4141097115526597', 
	#     	q: thequery, 
	#     	l: location,
	#     	format: 'json',
	#     	v: '2',
	#     	st: '1',
	#     	limit: '50' ,
	#     	userip: '1.2.3.4',
	#     	useragent: 'Mozilla/%2F4.0%28Firefox%29'
	#     	} }
	#   end

	#   def request
	#     self.class.get("/ads/apisearch", @options)
	#   end  
	# end


end