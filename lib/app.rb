

require 'bundler/setup'
Bundler.require(:default)

module AssetpackDemo
  VERSION = '0.0.1'
  
  class App < Sinatra::Base
    use Rack::MethodOverride
    set :public_folder, "public"
    
    set :root, File.dirname(__FILE__)
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

    get '/' do
      erb :'hello'
    end
    
    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
