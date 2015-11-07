ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class DataRecorder < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'links/sing_in'
  end

  post '/user' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:confirmation_password])
    if user.save
      session[:user_id] = user.id
      redirect :'links/new'
    else
      flash.now[:notice] = "Confirmation password and password are different"
      erb :'links/sing_in'
    end
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title],
                       url: params[:url])
    # p link.errors
    (params[:tag]).split.each do |tag|
      tag = Tag.new(name:tag)
      link.tags << tag
    end
    link.save
    redirect :links
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/tags' do
    session[:searched_tag] = params[:tag_searched]
    tag = Tag.all(name: session[:searched_tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
