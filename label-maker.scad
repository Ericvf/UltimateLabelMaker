$fn = 64;

text_str1 = "ULTIMATE";
text_str2 = "LABELMAKER";
text_str3 = "";

font_name = "Enter Sansman";
text_size = 20;

plate_h = 2;
text_h  = 2;
border  = 4;
bar     = 3;
scaler  = 0.5;

line_spacing = 24;


// -------------------------
// Text modules
// -------------------------

module my_text1() {
    text(text_str1,
         font = font_name,
         size = text_size,
         halign = "center",
         valign = "center");
}

module my_text2() {
    text(text_str2,
         font = font_name,
         size = text_size,
         halign = "center",
         valign = "center");
}

module my_text3() {
    text(text_str3,
         font = font_name,
         size = text_size,
         halign = "center",
         valign = "center");
}


// -------------------------
// Position each line
// -------------------------

module line1() {
    translate([0, line_spacing, 0])
        my_text1();
}

module line2() {
    translate([0, 0, 0])
        my_text2();
}

module line3() {
    translate([0, -line_spacing, 0])
        my_text3();
}


// -------------------------
// Back plate
// -------------------------
color("black")
scale([scaler, scaler, scaler])
    union() {

        // Separate outline for line 1
        linear_extrude(height = plate_h)
            offset(r = border)
                line1();

        // Separate outline for line 2
        linear_extrude(height = plate_h)
            offset(r = border)
                line2();

        // Separate outline for line 3
        linear_extrude(height = plate_h)
            offset(r = border)
                line3();


        // Separate hull/bar for line 1
        linear_extrude(height = plate_h)
            hull()
                offset(r = bar)
                    line1();

        // Separate hull/bar for line 2
        linear_extrude(height = plate_h)
            hull()
                offset(r = bar)
                    line2();

        // Separate hull/bar for line 3
        linear_extrude(height = plate_h)
            hull()
                offset(r = bar)
                    line3();
    }


// -------------------------
// Raised text
// -------------------------
color("white")
scale([scaler, scaler, scaler])
    translate([0, 0, plate_h])
        union() {

            linear_extrude(height = text_h)
                line1();

            linear_extrude(height = text_h)
                line2();

            linear_extrude(height = text_h)
                line3();
        }