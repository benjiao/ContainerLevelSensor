$fn = $preview ? 24 : 120;
include <./YAPP_Box/YAPPgenerator_v3.scad>

pcbLength     = 80;
pcbWidth      = 44;
pcbThickness  =  2;
lidWallHeight  = 15;
baseWallHeight = 15;

ridgeHeight = 6;
ridgeSlack = 0.4;

standoffDiameter=6;
standoffPinDiameter=3;
standoffHoleSlack=0.2;
standoffHeight = 6;


cutoutsBase = 
[
    [45, 17.5, 0, 0, 1.5, yappCircle, yappCoordPCB, yappCenter],
    [23, 1, 12.5, 11, 2, yappRoundedRect, yappCoordPCB],
    [40, 1, 10, 11, 2, yappRoundedRect, yappCoordPCB]
];  
cutoutsLid =
[
    [45, 17.5, 0, 0, 1.5, yappCircle, yappCoordPCB, yappCenter]
];
cutoutsFront = 
[
    [4.4, 0, 16.5, 9, 3, yappRoundedRect]
];
snapJoins   =   
[
    // [20, 8, yappLeft, yappRight],
    [pcbLength/2, 12, yappLeft, yappRight]
];

labelsPlane = 
[
    [ 78, 47, -90, 1, yappBase, "Liberation Mono:style=bold", 4.4, "LEVEL SENSOR"],
    [ 70, 47, -90, 1, yappBase, "Liberation Mono:style=bold", 4, "Do not wet!"],
    [ 65, 47, -90, 1, yappBase, "Liberation Mono:style=bold", 3.5, "NOT waterproof"],
    [ 34, 35, -90, 1, yappBase, "Liberation Mono:style=bold", 5, "POWER",],
    [ 28, 35, -90, 1, yappBase, "Liberation Mono:style=bold", 3.5, "KEEP AWAKE"],
    [ 18, 47, -90, 1, yappBase, "Liberation Mono:style=bold", 3, "To reprogram OTA,"],
    [ 14, 47, -90, 1, yappBase, "Liberation Mono:style=bold", 3, "enable keep_awake"],
    [ 10, 47, -90, 1, yappBase, "Liberation Mono:style=bold", 3, "then restart unit"]
];

showPCB = false;
YAPPgenerate();