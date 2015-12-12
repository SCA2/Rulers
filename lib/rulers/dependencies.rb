class Object
  
  attr_accessor :loaded
  self.loaded = Set.new
  
  def self.const_missing(c)
    klass = nil
    expanded = Rulers.to_underscore(c.to_s)
    unless loaded.include?(expanded)
      loaded.add expanded
      require expanded
      klass = Object.const_get(c)
    end
    klass
  end
end