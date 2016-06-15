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

  	search_query = params[:search]
    search_query_location = params[:city]
    
    #response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    puts "2222222123"
	#puts response.body
	
# 	url = 'http://api.indeed.com/ads/apisearch?publisher=4141097115526597&q=java&l=austin%2C+tx&sort=&radius=&st=&jt=&start=&limit=1000&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2
# &format=json'

	#http://www.indeed.com/jobs?as_and=java&as_phr=&as_any=&as_not=&as_ttl=&as_cmp=&jt=all&st=&salary=&radius=25&l=Berkeley%2C+CA&fromage=any&limit=10&sort=&psf=advsrch
	
	# response = HTTParty.get(url)
	# data = response.body
	# result = JSON.parse(data)
	#puts response.body

	# stack_exchange = StackExchange1.new("Econ", "New York")
	# response = stack_exchange.request.body
	# puts response

	#jobs = IndeedAPI.search_jobs(:q => 'taxi', :l => "sf", :limit => 50)
	#puts jobs.results

	if search_query.present?
	  IndeedAPI.publisher_id = "1548702512499814"
      @jobs = IndeedAPI.search_jobs(q: search_query, l: search_query_location)
      @results =[]
      if @jobs.total_results > 25
        start = 1
        10.times do
          IndeedAPI.search_jobs(q: search_query, l: search_query_location, start: start).results. each do |result|
            @results << result
            start +=25
          end
        end
      end
    else
      @jobs =[]
      @results = []
    end
    @results = Kaminari.paginate_array(@results).page(params[:page]).per(10)
	
  end
  
	protected

	def search_params
    	params.require(:jobs).permit(:search, :city)
	end



	# Or wrap things up in your own class
	class StackExchange
	  include HTTParty
	  base_uri 'api.stackexchange.com'

	  def initialize(service, page)
	    @options = { query: {site: service, page: page} }
	  end

	  def questions
	    self.class.get("/2.2/questions", @options)
	  end

	  def users
	    self.class.get("/2.2/users", @options)
	  end
	end

	class StackExchange1
	  include HTTParty
	  base_uri 'api.indeed.com'

	  def initialize(thequery, location)
	    @options = { query: 
	    	{publisher: '4141097115526597', 
	    	q: thequery, 
	    	l: location,
	    	format: 'json',
	    	v: '2',
	    	st: '1',
	    	limit: '50' ,
	    	userip: '1.2.3.4',
	    	useragent: 'Mozilla/%2F4.0%28Firefox%29'
	    	} }
	  end

	  def request
	    self.class.get("/ads/apisearch", @options)
	  end  
	end


end