class StaticPageController < ApplicationController

  

  def home

    
  end
  
  def help

  puts "88888888877880887983728788878787087878787870878788708"
	puts params[:search]
	puts params[:city]
	puts "88888888877880887983728788878787087878787870878788701"
 

  end
  
  def about
    
  end
  
  def jobs

  	@search_query = params[:search]
    search_query_location = params[:city]

	if @search_query.present?
	  IndeedAPI.publisher_id = "1548702512499814"
      @jobs = IndeedAPI.search_jobs(q: @search_query, l: search_query_location, limit: 25) #sort: params[:sort], radius:params[:radius], jt:params[:jt], fromage:params[:fromage]
      @results =[]
      if @jobs.total_results > 25
        start = 1
        10.times do
          IndeedAPI.search_jobs(q: @search_query, l: search_query_location, limit: 25, start: start).results. each do |result|
          	#:limit = 25
            @results << result
            start +=25
          end
        end
      end
    else
    	# Search accountant straight
      @jobs = []
      @results = []
      @search_query = "Accountant"
      IndeedAPI.search_jobs(q: @search_query, limit: 25).results. each do |result|
      	@results << result
      end
      
    end

    puts "1111111"
    @count_all_job = @results.length
    @results = Kaminari.paginate_array(@results).page(params[:page]).per(25)
	
  end
  
	protected

	def search_params
    	params.require(:jobs).permit(:search, :city, :radius, :sort, :jt, :fromage)
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