import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Inventory",
    id: "Inventory-4cbc7a29-232e-4276-af5f-4cc47fd8aa77"
}
service / on new http:Listener(9090) {

    @display {
        label: "product",
        id: "product-f3b70fe8-8a95-4664-b908-416ee136cd20"
    }
    http:Client productClient = check new ("");

    function init() returns error? {
        self.productClient = check new ("");
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
