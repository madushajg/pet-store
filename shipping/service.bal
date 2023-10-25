import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "shipping",
    id: "shipping-0c9d4a7b-5f88-42eb-86e5-9b75ad75c20e"
}
service / on new http:Listener(9090) {

    @display {
        label: "order",
        id: "order-282b69f9-dc32-4a77-9175-8ee4b0ec11c8"
    }
    http:Client orderClient = check new ("");

    function init() returns error? {
        self.orderClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
