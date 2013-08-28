require 'spec_helper'

describe CommodityPrice do
  it "#parse_from_xml" do
		parent = Nokogiri::HTML(test_xml).xpath('//table').first
		cp = CommodityPrice.parse_from_xml(parent)
		cp.state.should == 'Andhra Pradesh'
	end
end

def test_xml
	"<soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema'>
	<soap:Body>
<showResponse xmlns='http://agmarknet.nic.in/'>
<showResult>
<xs:schema xmlns='' xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:msdata='urn:schemas-microsoft-com:xml-msdata' id='NewDataSet'>
<xs:element name='NewDataSet' msdata:IsDataSet='true' msdata:UseCurrentLocale='true'>
<xs:complexType>
<xs:choice minOccurs='0' maxOccurs='unbounded'>
<xs:element name='Table'>
<xs:complexType>
<xs:sequence>
<xs:element name='State' type='xs:string' minOccurs='0'/>
<xs:element name='District' type='xs:string' minOccurs='0'/>
<xs:element name='Market' type='xs:string' minOccurs='0'/>
<xs:element name='Commodity' type='xs:string' minOccurs='0'/>
<xs:element name='Variety' type='xs:string' minOccurs='0'/>
<xs:element name='Arrival_Date' type='xs:string' minOccurs='0'/>
<xs:element name='Min_x0020_Price' type='xs:double' minOccurs='0'/>
<xs:element name='Max_x0020_Price' type='xs:double' minOccurs='0'/>
<xs:element name='Modal_x0020_Price' type='xs:double' minOccurs='0'/>
</xs:sequence>
</xs:complexType>
</xs:element>
</xs:choice>
</xs:complexType>
</xs:element>
</xs:schema>
<diffgr:diffgram xmlns:msdata='urn:schemas-microsoft-com:xml-msdata' xmlns:diffgr='urn:schemas-microsoft-com:xml-diffgram-v1'>
<NewDataSet xmlns=''>
<Table diffgr:id='Table1' msdata:rowOrder='0'>
<State>Andhra Pradesh</State>
<District>Adilabad</District>
<Market>Adilabad</Market>
<Commodity>Cotton</Commodity>
<Variety>Cotton (Unginned)</Variety>
<Arrival_Date>22/08/2013</Arrival_Date>
<Min_x0020_Price>3600</Min_x0020_Price>
<Max_x0020_Price>3900</Max_x0020_Price>
<Modal_x0020_Price>3850</Modal_x0020_Price>
</Table>
	</NewDataSet>
	</diffgr:diffgram>
</showResult>
</showResponse>
</soap:Body>
</soap:Envelope>"
end
