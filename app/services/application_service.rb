class ApplicationService
  Result = Struct.new(:success?, :error, :value)
  
  def self.call(*args)
    new(*args).call
  end
end