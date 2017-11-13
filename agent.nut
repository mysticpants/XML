@include "PrettyPrinter.nut"
@include "XML.class.nut"

local response = XML(@{include("sqs_receivemessage.nut")});

local name = response.find(["ReceiveMessageResponse", "ReceiveMessageResult", "Message", "Attribute[3]", "Name"]);
local value = response.find(["ReceiveMessageResponse", "ReceiveMessageResult", "Message", "Attribute[3]", "Value"]);
print(name + ": " + value);

/*
local attribute3 = response.find(["ReceiveMessageResponse", "ReceiveMessageResult", "Message", "Attribute[3]"]);
local name = attribute3.find(["Name"]).getValue();
local value = attribute3.find(["Value"]).getValue();
print(name + ": " + value);
*/
