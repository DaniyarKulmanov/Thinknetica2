module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(variable, type, options = nil, message = nil)
      # @validations ||= {}
      # @validations[name] ||= []
      # @validations[name] << { type: type, options: options, alert: message }
      @validations ||= []
      @validations << { name: variable, type: type, options: options, alert: message }
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
      self.class.validations.each do |check|
        value = instance_variable_get("@#{check[:name]}")
        send("validate_#{check[:type]}", value, check[:options], check[:alert])
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
