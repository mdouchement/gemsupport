module Gemsupport
  module DeepClone
    refine Object do
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

    refine Hash do
      def deep_clone(is_root: true)
        each_with_object({}) do |(k, v), hsh|
          hsh[k.deep_clone(is_root: false)] = v.deep_clone(is_root: false)
        end
      end
    end

    refine Array do
      def deep_clone(is_root: true)
        map { |e| e.deep_clone(is_root: false) }
      end
    end
  end
end
