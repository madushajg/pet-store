import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "product",
    id: "product-f3b70fe8-8a95-4664-b908-416ee136cd20"
}
service / on new http:Listener(9090) {

    @display {
        label: "Inventory",
        id: "Inventory-4cbc7a29-232e-4276-af5f-4cc47fd8aa77"
    }
    http:Client inventoryClient;

    function init() returns error? {
        self.inventoryClient = check new ("http://inventory-3512217301:9095");
    }

    resource function get getProducts() returns string[]|error {
        log:printInfo("getProducts");
        string[] items = check self.inventoryClient->/allItems;
        return items;
    }

    resource function get getProduct(string id) returns string|error {
        log:printInfo(string `invoked getProduct with id: ${id}`);
        return "product 1";
    }
}
