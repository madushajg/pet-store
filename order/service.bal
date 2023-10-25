import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9091`.
@display {
    label: "order",
    id: "order-282b69f9-dc32-4a77-9175-8ee4b0ec11c8"
}
service / on new http:Listener(9091) {
    @display {
        label: "notification",
        id: "notification-d90d2fa6-66f6-4ce1-93fb-c7ae106da21b"
    }
    http:Client notificationClient;

    @display {
        label: "user",
        id: "user-e6486cc7-fdae-465d-95f9-3ca24e566608"
    }
    http:Client userClient;

    @display {
        label: "product",
        id: "product-f3b70fe8-8a95-4664-b908-416ee136cd20"
    }
    http:Client productClient;

    function init() returns error? {
        self.notificationClient = check new ("http://order-management-2330531075:9093");
        self.userClient = check new ("http://order-management-2330531075:9093");
        self.productClient = check new ("http://order-management-2330531075:9093");
    }
    resource function post placeOrder(string userId, string itemId, int quantity) returns json|error {
        log:printInfo(string `placeOrder invoked with : ${userId}, ${itemId}, ${quantity}`);
        http:Response _ = check self.userClient->/getUser(userId = userId);
        http:Response _ = check self.productClient->/getProducts();
        http:Response _ = check self.notificationClient->/notify.post(message = "Order placed");
        return {
            "orderId": "101"
        };
    }
}
