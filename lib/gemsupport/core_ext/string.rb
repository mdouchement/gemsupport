String.class_eval do
  def underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end

  def camelize
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('/').map do |e|
      e.split('_').map { |w| w.capitalize }.join
    end.join('::')
  end
end
