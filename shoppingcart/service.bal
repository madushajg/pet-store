import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9093`.
@display {
    label: "shoppingcart",
    id: "shoppingcart-ddd439f7-210b-4ab1-82b9-44ba532c4009"
}
service / on new http:Listener(9093) {
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
        self.userClient = check new ("http://order-management-2330531075:9093");
        self.orderClient = check new ("http://order-management-2330531075:9093");
    }

    resource function get getCartItems() returns string[]|error {
        log:printInfo(string `getCartItems invoked`);
        http:Response _ = check self.orderClient->/placeOrder.post(userId = "1", itemId = "1", quantity = 1, message = "");
        http:Response _ = check self.userClient->/getUser(userId = "1");
        return ["item1", "item2"];
    }
}
