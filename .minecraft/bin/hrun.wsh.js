var command = WScript.Arguments.Item(0);
var argument = "";
for (var i = 0; i < WScript.Arguments.Count(); ++i){
  argument += WScript.Arguments.Item(i) + " ";
}
if(command){
  var shellapp = new ActiveXObject("WScript.Shell");
  shellapp.Run(argument, 0, !0);
}