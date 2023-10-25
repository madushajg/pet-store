import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9095`.
@display {
    label: "Inventory",
    id: "Inventory-4cbc7a29-232e-4276-af5f-4cc47fd8aa77"
}
service / on new http:Listener(9095) {

    resource function get allItems() returns string[] {
        log:printInfo(string `allItems invoked`);
        return ["Item 1", "Item 2", "Item 3"];
    }
}
