require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)



require 'pdfkit'

module Pencil
  class Application < Rails::Application
    
    # config.i18n.enforce_available_locales = true
    # I18n.enforce_available_locales = true
    I18n.enforce_available_locales = false
     # or if one of your gem compete for pre-loading, use
    # I18n.config.enforce_available_locales = true



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = "America/Bogota"
    
    config.middleware.use "PDFKit::Middleware", :print_media_type => true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end

# agregado
# config.assets.initialize_on_precompile = false
# config.assets.precompile += %w[active_admin.css active_admin.js print.css]
# config.assets.precompile += %w[active_admin/print.css]


end

# require 'RMagick'
# require 'barby/outputter/rmagick_outputter'
# require 'barby/barcode/code_128'
# require 'barby/outputter/png_outputter' 

# module Barby
#   class CustomRmagickOutputter < RmagickOutputter
# # config.autoload_paths += %W(#{config.root}/extras)
   

#     register :to_image_with_data
#     def to_image_with_data
#       #Make canvas  bigger
#       canvas = Magick::ImageList.new
#       canvas.new_image(full_width , full_height + 10)
#       canvas << to_image
#       canvas = canvas.flatten_images
#       #Make the text
#       text = Magick::Draw.new
#       text.font_family = 'helvetica'
#       text.pointsize = 14
#       text.gravity = Magick::SouthGravity
#       text.annotate(canvas , 0,0,0,0, barcode.data)
#       canvas
#     end
#   end
# end