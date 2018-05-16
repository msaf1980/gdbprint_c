from . import c_types
from gdbprint.gdbutils import print_str

name = "gdbprint_c"
version = "0.1.1"
print_str("load %s %s\n" % (name, version))

c_types.register()
