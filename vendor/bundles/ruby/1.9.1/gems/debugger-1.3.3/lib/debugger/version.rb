module Debugger
  # TODO: remove version from C ext
  send :remove_const, :VERSION if const_defined? :VERSION
  VERSION = '1.3.3'
end
