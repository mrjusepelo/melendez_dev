# require 'Rmagick'
require 'RMagick'
require 'barby/outputter/rmagick_outputter'
require 'barby/barcode/code_128' 
require 'barby/outputter/png_outputter'

module Barby
  class CustomRmagickOutputter < RmagickOutputter
    register :to_image_with_data
    def to_image_with_data
      #Make canvas  bigger
      canvas = Magick::ImageList.new
      canvas.new_image(full_width , full_height + 10)
      canvas << to_image
      canvas = canvas.flatten_images
      #Make the text
      text = Magick::Draw.new
      text.font_family = 'helvetica'
      text.pointsize = 14
      text.gravity = Magick::SouthGravity
      text.annotate(canvas , 0,0,0,0, barcode.data)
      canvas
    end
  end
end