module Validation
  attr_reader :validations

  def validate(name, type, *options)
    @validations ||= {}
    @validations[name] ||= []
    @validations[name] << { type: type, options: options }
  end

  def validate!
    @validations.each do |variable, validations|
      value = instance_variable_get("@#{variable}")
      validations.each do |validation|
        send(validation[:type], value, validation[:options])
        puts validation[:options]
      end
    end
  end

  def valid?
    validate!
    true
  rescue
    false
  end

private

  def presence(value, _options = nil)
    raise 'Value empty' if value.nil? || value.to_s.strip.empty?
  end

  def format(value, option)
    puts option
    raise 'Invalid format' if option.class != Regexp || value !~ option
  end

  def type(value, option)
    raise 'Invalid type' if value.class == option
  end
end

class Example
  include Validation

  FORMAT = /^([а-я]|\d){3}-*([а-я]|\d){2}$/i

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def check
    validate :name, :presence
    validate :name, :format, FORMAT
    validate :name, :type, String
    validate!
  end
end
