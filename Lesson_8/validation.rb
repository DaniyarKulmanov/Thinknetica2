module Validation
  attr_reader :validations

  def validate(name, type, options = nil, message = nil)
    @validations ||= {}
    @validations[name] ||= []
    @validations[name] << { type: type, options: options, alert: message }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    @validations.each do |variable, validations|
      value = instance_variable_get("@#{variable}")
      validations.each do |validation|
        send(validation[:type], value, validation[:options], validation[:alert])
      end
    end
  end

private

  def presence(value, _options = nil, alert = nil)
    error_message = alert.nil? ? 'Value empty' : alert
    raise error_message if value.nil? || value.to_s.strip.empty?
  end

  def format(value, option, alert = nil)
    error_message = alert.nil? ? 'Invalid format' : alert
    raise error_message if option.class != Regexp || value !~ option
  end

  def type(value, option, alert = nil)
    error_message = alert.nil? ? 'Invalid type' : alert
    raise error_message if value.class == option
  end

  def length(value, option, alert = nil)
    error_message = alert.nil? ? 'Invalid length =' : alert
    variable = value.class != Integer ? value.delete('-').length : value
    raise "#{error_message} #{option}" if variable > option
  end
end
