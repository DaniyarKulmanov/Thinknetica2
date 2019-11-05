module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var = "@#{name}".to_sym
      changelog = "@#{name}_history".to_sym

      define_method("#{name}_history") do
        instance_variable_get(changelog) || []
      end

      define_method(name) do
        instance_variable_get(var)
      end

      define_method("#{name}=".to_sym) do |value|
        old = send("#{name}_history")
        old.push value
        instance_variable_set(var, value)
        instance_variable_set(changelog, old)
      end
    end
  end

  def strong_accessor(*names)
    type = names.last || {}
    names.each do |name|
      var = "@#{name}".to_sym
      define_method("#{name}") { instance_variable_get(var) }

      define_method("#{name}=") do |value|
        if value.class.to_s != type[:class]
          message = "Invalid value type, should be #{type[:class]}"
          raise TypeError, message
        else
          instance_variable_set(var, value)
        end
      end
    end
  end
end
