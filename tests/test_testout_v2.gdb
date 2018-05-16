(gdb) file test
(gdb) py sys.path.insert(0, '..')
(gdb) py import gdbprint
load gdbprint
(gdb) py import gdbprint_c
load gdbprint_c 0.1.1
(gdb) break 76
(gdb) run
Breakpoint: file test.c, line 76.

Breakpoint 1, main at test.c:76

(gdb) p_s verbose 2
(gdb) p_s w 0
(gdb) p_v tNode_head .((*next))
"tNode_head" = (tNode *) <0xHEX> { ptr =  {
    "Name" = (char [30]) <0xHEX> { str_len:1 [0:29] = "1" + \0 },
    "Addr" = (char [50]) <0xHEX> { str_len:0 [0:49] = "" + \0 },
    "next" = (struct tNode *) <0xHEX>
} }
(gdb) p_v tNode_head <list> [-->next].((*next))
"tNode_head" = (tNode *) <0xHEX> { ptr =  {
    [0] = (struct tNode) <0xHEX> {
        "Name" = (char [30]) <0xHEX> { str_len:1 [0:29] = "1" + \0 },
        "Addr" = (char [50]) <0xHEX> { str_len:0 [0:49] = "" + \0 },
        "next" = (struct tNode *) <0xHEX>
    },
    [1] = (struct tNode *) <0xHEX> { ptr =  {
        "Name" = (char [30]) <0xHEX> { str_len:1 [0:29] = "2" + \0 },
        "Addr" = (char [50]) <0xHEX> { str_len:0 [0:49] = "" + \0 },
        "next" = (struct tNode *) <0x0>
    } },
    [2] = <0x0>,
} }
(gdb) p_v tNode_head <list> [0:1 -->next].((*next))
"tNode_head" = (tNode *) <0xHEX> { ptr =  {
    [0] = (struct tNode) <0xHEX> {
        "Name" = (char [30]) <0xHEX> { str_len:1 [0:29] = "1" + \0 },
        "Addr" = (char [50]) <0xHEX> { str_len:0 [0:49] = "" + \0 },
        "next" = (struct tNode *) <0xHEX>
    },
    [1] = (struct tNode *) <0xHEX> { ptr =  {
        "Name" = (char [30]) <0xHEX> { str_len:1 [0:29] = "2" + \0 },
        "Addr" = (char [50]) <0xHEX> { str_len:0 [0:49] = "" + \0 },
        "next" = (struct tNode *) <0x0>
    } },
} }
(gdb) p_v msghead.tqh_first <list> [ --> next.tqe_next ] .((!next))
"msghead" = (msg_head *) <0xHEX> { ptr =  {
    "tqh_first" = (struct msg *) <0xHEX> { ptr =  {
        [0] = (struct msg) <0xHEX> {
            "id" = (long int) 1,
            "name" = (char [20]) <0xHEX> { str_len:1 [0:19] = "1" + \0 }
        },
        [1] = (struct msg *) <0xHEX> { ptr =  {
            "id" = (long int) 2,
            "name" = (char [20]) <0xHEX> { str_len:1 [0:19] = "2" + \0 }
        } },
        [2] = <0x0>,
    } },
} }
(gdb) p_v msghead.tqh_first <list> [ --> next.tqe_next ] .((*next))
"msghead" = (msg_head *) <0xHEX> { ptr =  {
    "tqh_first" = (struct msg *) <0xHEX> { ptr =  {
        [0] = (struct msg) <0xHEX> {
            "next" = (struct {...}) <0xHEX> {
                "tqe_next" = (struct msg *) <0xHEX>,
                "tqe_prev" = (struct msg **) <0xHEX>
            },
            "id" = (long int) 1,
            "name" = (char [20]) <0xHEX> { str_len:1 [0:19] = "1" + \0 }
        },
        [1] = (struct msg *) <0xHEX> { ptr =  {
            "next" = (struct {...}) <0xHEX> {
                "tqe_next" = (struct msg *) <0x0>,
                "tqe_prev" = (struct msg **) <0xHEX>
            },
            "id" = (long int) 2,
            "name" = (char [20]) <0xHEX> { str_len:1 [0:19] = "2" + \0 }
        } },
        [2] = <0x0>,
    } },
} }
