class ComposableFrame < Frame
	
	def anotate pins_down
    return get_next.anotate pins_down if no_more_rolls?
    super pins_down
  end

  def no_more_rolls?
    strike? || full?
  end

  def get_next
  	@next = ComposableFrame.new if @next.nil?
    return @next
  end

  def as_frames
  	collection = Array.new
  	collection.push(self)
  	collection = collection + @next.as_frames unless @next.nil?
  	collection
  end

end