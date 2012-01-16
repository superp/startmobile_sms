module StartmobileSms
  autoload :Config,   'startmobile_sms/config'
  autoload :Message,  'startmobile_sms/message'
  
  mattr_accessor :config
  @@config = Config.new

  # Class methods
  
  def self.setup(&block)
    yield config
  end
  
  def self.send(options={})
    Message.send(options)
  end
  
  def self.check(message_id)
    Message.check(message_id)
  end
end
