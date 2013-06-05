module Proviso
  module Helpers
    def debug_mode?
      ENV['PROVISO_DEBUG'].nil? ? false : true
    end
  end
end
