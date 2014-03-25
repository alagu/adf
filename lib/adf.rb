require 'builder'
$:.unshift File.dirname(__FILE__)
puts $LOAD_PATH
require 'prospect.rb'
# Sample ADF XML from Wikipedia
# <?xml version="1.0" encoding="UTF-8"?>
# <?adf version="1.0"?>
# <adf>
#     <prospect>
#         <requestdate>2000-03-30T15:30:20-08:0</requestdate>
#         <vehicle>
#             <year>2008</year>
#             <make>Make</make>
#             <model>Model</model>
#         </vehicle>
#         <customer>
#             <contact>
#                 <name part="first">First</name>
#                 <name part="last">Last</name>
#                 <phone>323-223-3322</phone>
#                 <email>emailaddress</email>
#             </contact>
#         </customer>
#         <vendor>
#             <contact>
#                 <name part="full">Dealer Name</name>
#             </contact>
#         </vendor>
#     </prospect>
# </adf>
module ADF
end

module ADF
  class ADFDoc
    def initialize
      @prospects = []
    end

    def add_prospect(prospect)
      if not prospect.nil?
        @prospects.push prospect
      end
    end

    def to_xml
      xml = Builder::XmlMarkup.new( :indent => 2 )
      xml.instruct! :xml, :encoding => "UTF-8"
      xml.instruct! :adf, :version => "1.0"
      @prospects.each do |prospect|
        xml.prospect do |p|
          p.request_date prospect.request_date
          p.customer do |customer|
            customer.contact do |contact|
              contact.name(prospect.customer_first, "part" => "first")
              contact.name(prospect.customer_last, "part" => "last")
              contact.phone(prospect.customer_phone)
              contact.email(prospect.customer_email)
            end
          end
        end
      end

      return xml
    end
  end
end
