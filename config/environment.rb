# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Artspot::Application.initialize!

Paperclip.options[:image_magick_path] = "/usr/local/bin"
Paperclip.options[:command_path] = "/usr/local/bin"