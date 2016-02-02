class NullSite
  def method_missing(*args, &block)
    self
  end
end
