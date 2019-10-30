module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      variable = "@#{name}".to_sym
      variable_history = "@#{name}_history".to_sym

      define_method("#{name}_history") do
        instance_variable_get(variable_history) || []
      end

      define_method(name) do
        instance_variable_get(variable)
      end

      define_method("#{name}=".to_sym) do |var_value|
        history = send("#{name}_history")
        history.push var_value
        instance_variable_set(variable, var_value)
        instance_variable_set(variable_history, history)
      end
    end
  end
end

class Example
  extend Accessors

  attr_accessor_with_history :m, :bo, :cc
end
