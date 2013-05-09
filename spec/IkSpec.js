'use strict';
var ik;

describe("ik", function() {
    it("should return an inveresed array", function() {
        var values = ik.inverse(40, 40, -150);
        expect(values).toEqual([0, 46.40646300080387, 7.0917369011589875, 37.180570970188505]);
    });
});
