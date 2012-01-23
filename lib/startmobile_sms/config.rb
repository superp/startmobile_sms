# encoding: utf-8
module StartmobileSms
  class Config < Hash
    # Creates an accessor that simply sets and reads a key in the hash:
    #
    # class Config < Hash
    #   hash_accessor :routes, :secret_key, :service_number, :project_name
    # end
    #
    # config = Config.new
    # config.routes = '/posts/message'
    # config[:routes] #=> '/posts/message'
    #
    def self.hash_accessor(*names) #:nodoc:
      names.each do |name|
        class_eval <<-METHOD, __FILE__, __LINE__ + 1
          def #{name}
            self[:#{name}]
          end

          def #{name}=(value)
            self[:#{name}] = value
          end
        METHOD
      end
    end
    
    hash_accessor :login, :password, :post_url, :out_number
    
    def initialize(other = {})
      merge!(other)
      
      self[:login] ||= 'login'
      self[:password] ||= 'password'
      self[:out_number] ||= 'INFO'
      self[:post_url] ||= 'http://bulk.startmobile.com.ua/clients.php'
    end
  end
end
