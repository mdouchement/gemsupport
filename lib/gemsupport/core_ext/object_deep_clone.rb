Object.class_eval do
  def deep_clone(is_root: true)
    clone.tap do |deep_cloning_obj|
      deep_cloning_obj.instance_variables.each do |var|
        val = deep_cloning_obj.instance_variable_get(var)
        deep_cloning_obj.instance_variable_set(var, val.deep_clone(is_root: false))
      end
    end
  rescue TypeError
    return self unless is_root
    raise
  end
end
