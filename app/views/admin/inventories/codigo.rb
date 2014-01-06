# require 'Rmagick'
require 'RMagick'
require 'barby/outputter/rmagick_outputter'
require 'barby/barcode/code_128' 
# # require 'barby/barcode/code_39'
# require 'barby/outputter/png_outputter'
# require 'barby/outputter/prawn_outputter'

require 'chunky_png'
# require 'barby', :require => ['barby', 'barby/outputter/chunky_png_outputter']
 require 'barby'
require 'barby/outputter/chunky_png_outputter'
# module Barby
#   class CustomRmagickOutputter < RmagickOutputter
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

# module Barby
#   class InvoicePdf < Prawn::Document
#   order = 7
#     # def initialize(order, view)
#     #     super({
#     #         :top_margin => 70,
#     #         :page_size => 'A4',
#     #         :font_size => 10,
#     #         :text  => 8
#     #         })

#     #     @order = order
#     #     @view = view
#     #     order_number
#     #     barcode
#     # end

#     # def order_number
#     #     text "Order #{@order}"
#     # end

#     # def barcode
#         # barcode = Barby::Code39.new ('3123123123')
#         # barcode.annotate_pdf(self)
#     # end
#   end
# end