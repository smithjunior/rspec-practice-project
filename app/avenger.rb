class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(vingador)
    list.push(vingador)
  end
end