# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Pencil::Application.initialize!
Mime::Type.register 'application/pdf', :pdf

# barcode = Barby::Code128B.new('Nuevo Comentario  comen2')

# config.gem "rmagick", :lib => "RMagick"


