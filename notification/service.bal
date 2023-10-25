import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9094`.
@display {
    label: "notification",
    id: "notification-d90d2fa6-66f6-4ce1-93fb-c7ae106da21b"
}
service / on new http:Listener(9094) {
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
    resource function post notify(string message) returns string|error {
        log:printInfo(string `getCartItems invoked`);
        http:Response _ = check self.orderClient->/placeOrder.post(userId = "1", itemId = "1", quantity = 1, message = "");
        http:Response _ = check self.userClient->/getUser(userId = "1");
        return "success";
    }
}
