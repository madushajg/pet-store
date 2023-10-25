import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "notification",
    id: "notification-d90d2fa6-66f6-4ce1-93fb-c7ae106da21b"
}
service / on new http:Listener(9090) {
    @display {
        label: "user",
        id: "user-e6486cc7-fdae-465d-95f9-3ca24e566608"
    }
    http:Client userClient = check new ("");

    @display {
        label: "order",
        id: "order-282b69f9-dc32-4a77-9175-8ee4b0ec11c8"
    }
    http:Client orderClient = check new ("");

    function init() returns error? {
        self.userClient = check new ("");
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
