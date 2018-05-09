(gdb) file test
(gdb) py sys.path.append('..')
(gdb) py import gdbprint
(gdb) py import gdbprint_c
(gdb) break 76
(gdb) run
Breakpoint: file test.c, line 76.

Breakpoint 1, main at test.c:76

(gdb) p_s verbose 0
(gdb) p_s w 0
(gdb) p_v tNode_head .((*next))
"tNode_head" = { ptr = {
    "Name" = { [0:29] = "1" + \0 },
    "Addr" = { [0:49] = "" + \0 },
    "next" = <0xHEX>
} }
(gdb) p_v tNode_head <list> [-->next].((*next))
"tNode_head" = { ptr = {
    [0] = {
        "Name" = { [0:29] = "1" + \0 },
        "Addr" = { [0:49] = "" + \0 },
        "next" = <0xHEX>
    },
    [1] = { ptr = {
        "Name" = { [0:29] = "2" + \0 },
        "Addr" = { [0:49] = "" + \0 },
        "next" = <0x0>
    } },
    [2] = <0x0>,
} }
(gdb) p_v tNode_head <list> [0:1 -->next].((*next))
"tNode_head" = { ptr = {
    [0] = {
        "Name" = { [0:29] = "1" + \0 },
        "Addr" = { [0:49] = "" + \0 },
        "next" = <0xHEX>
    },
    [1] = { ptr = {
        "Name" = { [0:29] = "2" + \0 },
        "Addr" = { [0:49] = "" + \0 },
        "next" = <0x0>
    } },
} }
(gdb) p_v msghead.tqh_first <list> [ --> next.tqe_next ] .((!next))
"msghead" = { ptr = {
    "tqh_first" = { ptr = {
        [0] = {
            "id" = 1,
            "name" = { [0:19] = "1" + \0 }
        },
        [1] = { ptr = {
            "id" = 2,
            "name" = { [0:19] = "2" + \0 }
        } },
        [2] = <0x0>,
    } },
} }
(gdb) p_v msghead.tqh_first <list> [ --> next.tqe_next ] .((*next))
"msghead" = { ptr = {
    "tqh_first" = { ptr = {
        [0] = {
            "next" = {
                "tqe_next" = <0xHEX>,
                "tqe_prev" = <0xHEX>
            },
            "id" = 1,
            "name" = { [0:19] = "1" + \0 }
        },
        [1] = { ptr = {
            "next" = {
                "tqe_next" = <0x0>,
                "tqe_prev" = <0xHEX>
            },
            "id" = 2,
            "name" = { [0:19] = "2" + \0 }
        } },
        [2] = <0x0>,
    } },
} }
