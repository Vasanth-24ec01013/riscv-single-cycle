#! /c/Source/iverilog-install/bin/vvp
:ivl_version "12.0 (devel)" "(s20150603-1539-g2693dd32b)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "C:\iverilog\lib\ivl\system.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_sys.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_textio.vpi";
:vpi_module "C:\iverilog\lib\ivl\v2005_math.vpi";
:vpi_module "C:\iverilog\lib\ivl\va_math.vpi";
S_00000267411fb480 .scope module, "immediate_generator_tb" "immediate_generator_tb" 2 1;
 .timescale 0 0;
v0000026741124c70_0 .net "immediate", 31 0, v00000267411fbcf0_0;  1 drivers
v0000026741124d10_0 .var "instruction", 31 0;
S_00000267411fb610 .scope module, "uut" "immediate_generator" 2 6, 3 1 0, S_00000267411fb480;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "instruction";
    .port_info 1 /OUTPUT 32 "immediate";
v00000267411fbcf0_0 .var "immediate", 31 0;
v0000026741124bd0_0 .net "instruction", 31 0, v0000026741124d10_0;  1 drivers
E_00000267411fa560 .event anyedge, v0000026741124bd0_0;
    .scope S_00000267411fb610;
T_0 ;
    %wait E_00000267411fa560;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 7, 0, 2;
    %dup/vec4;
    %pushi/vec4 19, 0, 7;
    %cmp/u;
    %jmp/1 T_0.0, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 7;
    %cmp/u;
    %jmp/1 T_0.1, 6;
    %dup/vec4;
    %pushi/vec4 35, 0, 7;
    %cmp/u;
    %jmp/1 T_0.2, 6;
    %dup/vec4;
    %pushi/vec4 99, 0, 7;
    %cmp/u;
    %jmp/1 T_0.3, 6;
    %dup/vec4;
    %pushi/vec4 111, 0, 7;
    %cmp/u;
    %jmp/1 T_0.4, 6;
    %dup/vec4;
    %pushi/vec4 103, 0, 7;
    %cmp/u;
    %jmp/1 T_0.5, 6;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.0 ;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %replicate 20;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 12, 20, 6;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.1 ;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %replicate 20;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 12, 20, 6;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.2 ;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %replicate 20;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 7, 25, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 5, 7, 4;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.3 ;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %replicate 19;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 7, 4;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 6, 25, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 4, 8, 5;
    %concat/vec4; draw_concat_vec4
    %concati/vec4 0, 0, 1;
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.4 ;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %replicate 11;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 8, 12, 5;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 20, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v0000026741124bd0_0;
    %parti/s 10, 21, 6;
    %concat/vec4; draw_concat_vec4
    %concati/vec4 0, 0, 1;
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.5 ;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 1, 31, 6;
    %replicate 20;
    %load/vec4 v0000026741124bd0_0;
    %parti/s 12, 20, 6;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v00000267411fbcf0_0, 0, 32;
    %jmp T_0.7;
T_0.7 ;
    %pop/vec4 1;
    %jmp T_0;
    .thread T_0, $push;
    .scope S_00000267411fb480;
T_1 ;
    %vpi_call 2 13 "$dumpfile", "waves/immediate_generator.vcd" {0 0 0};
    %vpi_call 2 14 "$dumpvars", 32'sb00000000000000000000000000000000, S_00000267411fb480 {0 0 0};
    %vpi_call 2 15 "$monitor", "Time: %0t | instruction: %h | immediate: %d", $time, v0000026741124d10_0, v0000026741124c70_0 {0 0 0};
    %pushi/vec4 19, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %pushi/vec4 147, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %pushi/vec4 1048851, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %pushi/vec4 2097555, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %pushi/vec4 3146259, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %pushi/vec4 4194963, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %pushi/vec4 5243667, 0, 32;
    %store/vec4 v0000026741124d10_0, 0, 32;
    %delay 10, 0;
    %vpi_call 2 31 "$finish" {0 0 0};
    %end;
    .thread T_1;
# The file index is used to find the file name in the following table.
:file_names 4;
    "N/A";
    "<interactive>";
    "tb/immediate_generator_tb.v";
    "rtl/immediate_generator.v";
