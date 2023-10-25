import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "authentication",
    id: "authentication-ea2a398e-0ec9-4880-a167-46d10d3cbd4c"
}
service / on new http:Listener(9090) {

    @display {
        label: "user",
        id: "user-e6486cc7-fdae-465d-95f9-3ca24e566608"
    }
    http:Client userClient = check new ("");

    function init() returns error? {
        self.userClient = check new ("");
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
