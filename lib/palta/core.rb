module Palta

  # Generic Palta error to be thrown on module specific errors.
  # It should not shadow any system error (i.e. ECONNREFUSED)
  class PaltaError < StandardError
  end

end
