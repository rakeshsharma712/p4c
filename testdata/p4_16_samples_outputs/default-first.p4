#include <core.p4>

header Header {
    bit<32> data;
}

parser p0(packet_in p, out Header h) {
    state start {
        bool b = true;
        p.extract<Header>(h);
        transition select(h.data, b) {
            (default, true): next;
            (default, default): reject;
        }
    }
    state next {
        transition accept;
    }
}

parser proto(packet_in p, out Header h);
package top(proto _p);
top(p0()) main;