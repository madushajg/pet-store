import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "shoppingcart",
    id: "shoppingcart-ddd439f7-210b-4ab1-82b9-44ba532c4009"
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

    @display {
        label: "product",
        id: "product-f3b70fe8-8a95-4664-b908-416ee136cd20"
    }
    http:Client productClient = check new ("");

    function init() returns error? {
        self.userClient = check new ("");
        self.orderClient = check new ("");
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
