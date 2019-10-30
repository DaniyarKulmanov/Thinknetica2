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
        old.push instance_variable_get(var) if instance_variable_get(changelog).nil?
        old.push value
        instance_variable_set(var, value)
        instance_variable_set(changelog, old)
      end
    end
  end
end

class Example
  extend Accessors
  attr_accessor_with_history :m, :bo, :cc
end
