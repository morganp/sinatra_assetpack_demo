

require 'bundler/setup'
Bundler.require(:default)

#Dir[File.dirname(__FILE__) + '/lib/models/*.rb'].each {|file| require file }

module AssetpackDemo
  VERSION = '0.0.1'
  
  class App < Sinatra::Base
    #register Sinatra::Session
    use Rack::MethodOverride
    set :public_folder, "public"
    set :root, File.dirname(__FILE__)
    root = File.dirname(__FILE__)
    register Sinatra::AssetPack

    # Development mode 
    #<link rel='stylesheet' href='/css/screen_layout.unique_id.css' media='screen' />
    #<link rel='stylesheet' href='/css/screen_colors.unique_id.css' media='screen' />

    # Production mode 
    #<link rel='stylesheet' href='/css/screens.unique_id.css' media='screen' />

    assets {
      serve '/css',    from: "assets/css" # lib/assets/css
      css :screen, '/css/screen.css', [
        '/css/screen_layout.css',
        '/css/screen_colors.css'
      ]
    }

    #Configure Modules ran when starting/restarting Server
    configure :development do
      set :analytics_ena, false
    end

    configure :test do
    end

    configure :production do
      set :analytics_ena, true
    end


    #Ran on Server Error
    error do
      e = request.env['sinatra.error']
      puts e.to_s
      puts e.backtrace.join("
")
      "Application error"
    end

    #Some session setup
    set :session_fail, '/login'


    get '/' do
      erb :'hello'
    end
    
    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
