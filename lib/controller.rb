require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
        erb :new_gossip
    end

  	get '/gossips/:id/' do
      erb :show
    end

    get '/gossips/:id/edit/' do
      erb :edit
    end

  	post '/gossips/new/' do
  		Gossip.new(params["gossip_author"], params["gossip_content"]).save
  		redirect '/'
  	end

    post '/gossips/:id/edit/' do
      Gossip.replace(params['id'].to_i,params["gossip_author"], params["gossip_content"])
      redirect '/'
    end
end
