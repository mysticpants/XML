class XMLTestCase extends ImpTestCase {

    function setUp() {

    }

    function testXML() {
        return Promise(function(resolve, reject) {

            try {
                local response = XML(@{include("sqs_receivemessage.nut")});

                local attribute3 = response.find(["ReceiveMessageResponse", "ReceiveMessageResult", "Message", "Attribute[3]"]);
                local name = attribute3.find(["Name"]).getValue();
                local value = attribute3.find(["Value"]).getValue();

                assertEqual("ApproximateReceiveCount", name, "Incorrect value from XML");
                assertEqual("5", value, "Incorrect value from XML");

                resolve();
            } catch(e) {
                reject(e);
            }

        }.bindenv(this));
    }

}
