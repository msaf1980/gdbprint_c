import gdb
from gdbprint.gdbutils import *
from gdbprint.gdbprinters import *
from gdbprint.utils import *
from gdbprint.define import longx

def dereference(value):
    if value is None or value.address == 0:
        return value
    elif value.type.code == gdb.TYPE_CODE_PTR:
        return value.dereference()
    else:
        return value

# C-like linked list (based on pointers with next iterator)
class LinkedListPrinter(DebugPrinter):
    typename = "list"

    @staticmethod
    def display_hint():
        return  DisplayType.LIST

    def __init__ (self, value,  type, **kwargs):
        DebugPrinter.__init__(self,  value,  type)
        self.next_ptr = [ '__next__' ]
        #print(args)
        if kwargs.get('next'):
            self.next_ptr = kwargs['next'].split(".")
    	#print("\n" + str(self.next_ptr) + "\n")
        self.seek_first()

    def seek_first(self):
        #self.head = dereference(self.value)
        self.head = self.value
        self.node = self.head
        self.pos = 0

    def next(self):
        #print (self.base)
        #print (self.head_addr)
        if self.node.type.code == gdb.TYPE_CODE_PTR:
            #address = self.node.dereference().address
            address = longx(self.node)
        else:
            address = self.node.address
        #print(str(self.node))
        #print(str(address))
        if address == 0:
            raise StopIteration
        #print(str(self.node) +" " + str(self.node.address))
        val = self.node
        pos = self.pos
        v = self.node
        for n_p in self.next_ptr:
            v = v[n_p]
        self.node = v

        self.pos += 1
        return (pos, val)
        
    def get_pos(self):
        return self.pos

misctypes_printers = [
    LinkedListPrinter , 
]

def register():
    for p in misctypes_printers:
        #print(p)
        register_printer(p)
