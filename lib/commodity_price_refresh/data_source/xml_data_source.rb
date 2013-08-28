class XMlDataSource
  def initialize
    @doc = Nokogiri::HTML(open(url))
  end
  
  def parse_data
    parse(@doc, field_mapping[0], field_mapping[1])
  end
  
  private 
  def parse(parent, parent_element, mapping)
    data = []
    parent.xpath(parent_element).each do |node|
      val = {}
      mapping.each do |k, v|
        val[k] = if v.is_a?(Array)
                    parse(node, v[0], v[1])
                  else
                    node.xpath(v).text
                  end
      end
      data << val if val.size > 0
    end
    data
  end
end