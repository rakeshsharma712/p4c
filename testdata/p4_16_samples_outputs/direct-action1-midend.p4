control c(inout bit<16> y) {
    bit<32> x_0;
    bit<32> arg;
    @name("a") action a() {
        arg = x_0;
        y = (bit<16>)arg;
    }
    table tbl_a() {
        actions = {
            a();
        }
        const default_action = a();
    }
    apply {
        tbl_a.apply();
    }
}

control proto(inout bit<16> y);
package top(proto _p);
top(c()) main;