module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, options = nil, message = nil)
      @validations ||= {}
      @validations[name] ||= []
      @validations[name] << { type: type, options: options, alert: message }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue
      false
    end

    def validate!
      self.class.validations.each do |variable, validations|
        value = instance_variable_get("@#{variable}")
        validations.each do |validation|
          send("validate_#{validation[:type]}", value, validation[:options], validation[:alert])
        end
      end
    end

  private

    def validate_presence(value, _options = nil, alert = nil)
      error_message = alert.nil? ? 'Value empty' : alert
      raise error_message if value.nil? || value.to_s.strip.empty?
    end

    def validate_format(value, option, alert = nil)
      error_message = alert.nil? ? 'Invalid format' : alert
      raise error_message if option.class != Regexp || value !~ option
    end

    def validate_type(value, option, alert = nil)
      error_message = alert.nil? ? 'Invalid type' : alert
      raise error_message if value.class == option
    end

    def validate_length(value, option, alert = nil)
      error_message = alert.nil? ? 'Invalid length =' : alert
      variable = value.class != Integer ? value.delete('-').length : value
      raise "#{error_message} #{option}" if variable > option
    end
  end
end
