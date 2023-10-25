import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9092`.
@display {
	label: "user",
	id: "user-e6486cc7-fdae-465d-95f9-3ca24e566608"
}
service / on new http:Listener(9092) {

    resource function get getUser(string userId) returns string|error {
        log:printInfo(string `getUser invoked with : ${userId}`);
        if userId is "" {
            return error("name should not be empty!");
        }
        return "userName";
    }
}
