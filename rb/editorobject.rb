class EditorObject

  attr_reader :type, :origin

  def initialize(type,origin)
    @type = type
    @origin = origin
  end
end
