require 'sinatra/base'


class App < Sinatra::Base

    @@coffee = 0
    @@tea = 0
    @@water = 0

  configure do |variable|
    enable :logging
    enable :method_overide
  end


  before do
    logger.info "Request Headers: #{headers}"
    logger.warn "Params: #{params}"
  end

  after do
    logger.info "Response Headers: #{response.headers}"
  end


  get('/') do
    @coffee = @@coffee
    @tea = @@tea
    @water = @@water
    render(:erb, :index, :layout => :template)
  end

  post('/drinks/:id') do
    case params[:id]
      when "coffee"
        @@coffee += 1
      when "tea"
        @@tea += 1
      when "water"
        @@water += 1
    end
    redirect to('/')
  end



end #class
