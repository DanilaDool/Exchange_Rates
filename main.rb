require 'uri'
require 'net/http'
require 'rexml/document'
require 'cgi'

URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

response = Net::HTTP.get_response(URI.parse(URL))

doc = REXML::Document.new(response.body)

doc.each_element('//Valute[@ID="R01235" or @ID="R01239" or @ID= "R01720"]') do |currency_tag|
  name = currency_tag.get_text('Name')
  value = currency_tag.get_text('Value')

  puts "Курс: #{name} #{value}.руб"
end
