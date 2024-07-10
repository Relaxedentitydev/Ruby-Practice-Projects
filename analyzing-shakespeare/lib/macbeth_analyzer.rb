require "net/http"
require "rexml/document"
require "speech"

# URL of the XML file
url = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

# Download and parse the XML file
xml_content = URI.open(url).read
doc = Nokogiri::XML(xml_content)

# Initialize the hash map
speaker_count = Hash.new(0)

# Iterate over each <SPEAKER> tag and update the hash map
doc.xpath('//SPEAKER').each do |speech|
  speaker_element  = speech.at_xpath('SPEAKER')
  if speaker_element
    speaker = speaker_element.text.strip
    lines = speech.xpath('LINE')
    # Check if lines is not nil before proceeding
    if lines.any?
      # Count the number of <LINE> tags for this speaker within this speech
      line_count = lines.count

      # Update the hash map with the line count for the speaker
      speaker_count[speaker] += line_count
    end
  end
end

puts "\nResult:"
speaker_count.each do |speaker, lines|
  puts "#{speaker}: #{lines} lines"
end
