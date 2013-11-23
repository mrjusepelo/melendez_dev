PDFKit.configure do |config|
 
  if ["development"].include?(Rails.env)
    #only if your are working on 32bit machine
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-i386').to_s
  else
    #if your site is hosted on heroku or any other hosting server which is 64bit
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  end
 
  config.default_options = {
    :encoding=>"UTF-8",
    :page_size=>"A4",
    :margin_top=>"0.25in",
    :margin_right=>"0.1in",
    :margin_bottom=>"0.25in",
    :margin_left=>"0.1in",
    :disable_smart_shrinking=> false
  }
end


# PDFKit.configure do |config|
#   config.default_options[:ignore_load_errors] = true
# end



# PDFKit.configure do |config|
#   # config.wkhtmltopdf = '/usr/local/rvm/gems/ruby-1.9.3-p448/bin/wkhtmltopdf'
#   config.wkhtmltopdf = `which wkhtmltopdf`.gsub(/\n/, '')
# 	config.default_options = {
# 	    :encoding=>"UTF-8",
# 	    :page_size=>"A4",
# 	    :margin_top=>"0.25in",
# 	    :margin_right=>"1in",
# 	    :margin_bottom=>"0.25in",
# 	    :margin_left=>"1in",
# 	    :disable_smart_shrinking=>false
# 	    }  
#   # config.wkhtmltopdf = { :exe_path => '/usr/local/bin/wkhtmltopdf' }
# end
# PDFKit.configure do |config|
#   config.wkhtmltopdf = 'PATH/TO/wkhtmltopdf'
# end


# PDFKit.configure do |config| 
# config.wkhtmltopdf ='/usr/local/bin/wkhtmltopdf'
# config.default_options = {
#    :encoding=>"UTF-8",
#    :page_size=>"Ledger",
#    :zoom => '1.3',
#    :disable_smart_shrinking=>false
# }
# end



# PDFKit.configure do |config|
#   config.wkhtmltopdf = `which wkhtmltopdf`.to_s.strip
#   config.default_options = {
#     :encoding=>"UTF-8",
#     :page_size=>"A4",
#     :margin_top=>"0.25in",
#     :margin_right=>"1in",
#     :margin_bottom=>"0.25in",
#     :margin_left=>"1in",
#     :disable_smart_shrinking=>false
#     }
# end



# # config/initializers/pdfkit.rb
# PDFKit.configure do |config|
#   # config.wkhtmltopdf = '/path/to/wkhtmltopdf'
#   config.wkhtmltopdf = '../config/application'
#   config.default_options = {
#     :page_size => 'Legal',
#     :print_media_type => true
#   }
#   # Use only if your external hostname is unavailable on the server.
#   config.root_url = "http://localhost" 
# end

