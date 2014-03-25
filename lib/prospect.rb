# <prospect>
#     <requestdate>2000-03-30T15:30:20-08:0</requestdate>
#     <vehicle>
#         <year>2008</year>
#         <make>Make</make>
#         <model>Model</model>
#     </vehicle>
#     <customer>
#         <contact>
#             <name part="first">First</name>
#             <name part="last">Last</name>
#             <phone>323-223-3322</phone>
#             <email>emailaddress</email>
#         </contact>
#     </customer>
#     <vendor>
#         <contact>
#             <name part="full">Dealer Name</name>
#         </contact>
#     </vendor>
# </prospect>
module ADF
  class Prospect
    attr_accessor :request_date, :customer_first, :customer_last, :customer_phone,
      :customer_email 
    def initialize(request_date)
      @request_date = request_date
    end

    def set_customer(first, last, phone, email)
      @customer_first = first
      @customer_last = last
      @customer_phone = phone
      @customer_email = email
    end
  end
end
