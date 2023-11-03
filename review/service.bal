import ballerina/http;
import ballerina/log;


service / on new http:Listener(9494) {

    resource function get allReviews() returns string[] {
        log:printInfo(string `allReviews invoked`);
        return ["Review 1", "Review 2", "Review 3"];
    }
}
