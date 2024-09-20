const request = require("supertest");
const app = require("./index");

describe("Server", function () {
  it("should load the homepage successfully", function (done) {
    request(app).get("/").expect("Content-Type", /html/).expect(200, done);
  });
});
