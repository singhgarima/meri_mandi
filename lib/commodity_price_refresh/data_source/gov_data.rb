require_relative './xml_data_source'
class GovData < XMlDataSource
  def url
    @@url ||= 'http://data.gov.in/sites/default/files/Date-Wise-Prices-all-Commodity.xml'			
  end
  
  def field_mapping
    @@field_mapping ||= [ '//table', {
        state: 'state',
        district: 'district',
        market: 'market',
        commodity: 'commodity',
        variety: 'variety',
        arrival_date: 'arrival_date',
        min_price: 'min_x0020_price',
        max_price: 'max_x0020_price',
        mode_price: 'modal_x0020_price'
      }
    ]
  end
end