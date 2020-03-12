// Type
//type="big";
//type="medium";
type="small";

module svglogo(x=8,y=9,z=10) {
    color("blue")
        linear_extrude(height=x)
            import(file = "svg/nrec-bottom.svg", center = false, dpi = 96);
    color("steelblue")
        linear_extrude(height=y)
            import(file = "svg/nrec-top.svg", center = false, dpi = 96);
    color("white")
        linear_extrude(height=z)
            import(file = "svg/nrec-middle.svg", center = false, dpi = 96);
}

module nrec_text() {
    color("white") linear_extrude(height=10)
        text("NREC.no", size=6, font="liberation sans", halign="center", valign="center", spacing=1, $fn=16);
}

if (type == "big") {
    svglogo();
    translate([149,98,0])
        nrec_text();
}
else if (type == "medium") {
    difference() {
        scale([0.5,0.5,1])
            svglogo();
        translate([40,60,0.6])
            cube([20,10,2]);
    }
}
else if (type == "small") {
    difference() {
        scale([0.25,0.25,1])
            svglogo(4,5,6);
        translate([22,32,0.4])
            cube([8.6,3.6,2.4]);
    }
}
