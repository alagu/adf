ADF Gem - AutoDealer Format Gem
===============================

ADF Gem allows you to quickly create ADF XML files. Premature, just supports
Customers.


Usage and Example
-----------------
Install the gem
```
$ gem install adf
```

Require it in your project and create prospects.
```
require 'adf'
require 'date'
doc = ADF::ADFDoc.new
prospect = ADF::Prospect.new DateTime.now
prospect.set_customer("Allagappan", "Muthuraman", "240-242-5248", "allagappan@gmail.com")
doc.add_prospect prospect
puts doc.to_xml
```

Prints out
```
```
