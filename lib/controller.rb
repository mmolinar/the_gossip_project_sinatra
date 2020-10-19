require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
     erb :index, locals: {gossips: Gossip.all}
   end

  get '/gossips/new/' do
   erb :new_gossip
  end

  post '/gossips/new/' do
     Gossip.new(params["gossip_author"], params["gossip_content"]).save
     redirect '/'
  end

  get '/gossips/:id' do
    erb :show, locals: {potin: Gossip.find(params['id'].to_i)}
  end

  post '/gossips/edit/:id' do
    Gossip.update(params['id'].to_i).save
    redirect '/'
 end
end
