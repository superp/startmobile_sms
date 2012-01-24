require 'net/http'
require 'uri'

module StartmobileSms
  class Message
      
    attr_accessor :phone, :text, :out_number
    attr_reader :id
    
    def initialize(options={})
      @phone = options[:phone]
      @text = options[:text]
      @out_number = options[:out_number] || StartmobileSms.config.out_number
    end
    
    def xml_content
      "<?xml version='1.0' encoding='UTF-8'?><message>
        <service id='single' source='#{@out_number}'/>
        <to>#{@phone}</to>
        <body content-type='text/plain'><![CDATA[#{@text}]]></body>
      </message>"
    end
    
    def check_content(id)
      "<?xml version='1.0' encoding='UTF-8'?><request id='#{id}'>status</request>"
    end
    
    def make_post(body)
      url = URI.parse(StartmobileSms.config.post_url)
      request = Net::HTTP::Post.new(url.path)
      request.basic_auth StartmobileSms.config.login, StartmobileSms.config.password
      request.body = body
      
      result = Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }
      
      case result
        when Net::HTTPSuccess, Net::HTTPRedirection then result.body
        else false 
      end
    end
    
    def send
      response = make_post(xml_content)
      return nil unless response
      
      doc = Nokogiri::XML(response)
      @id = doc.at('.//id').content
    end
    
    def check(id=@id)
      response = make_post(check_content(id))
      return nil unless response

      doc = Nokogiri::XML(response)
      doc.at('.//state').content
    end
    
    def status
      @id.nil? ? 'You must send sms before check' : check
    end
    
    # Class methods
    
    def self.send(options)
      cms = new(options)
      cms.send
    end
    
    def self.check(id)
      new.check(id)
    end
  end
end
