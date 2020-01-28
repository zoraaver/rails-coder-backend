const fs = require('fs');
var assert = require('chai').assert;
const sourceFile = fs.readFileSync('tests/javascript/code.js', 'utf-8');
const jsdom = require('mocha-jsdom')
jsdom({ src: sourceFile, url: "http://localhost" })



describe('#helloWorld', function () {
    it('should return "HEY there!"', function () {
        assert.equal(helloWorld(), "HEY there!");
    })
})

describe('Array', function() {
    describe('#indexOf()', function() {
        it('should return -1 when the value is not present', function(){
            assert.equal(-1, [1,2,3].indexOf(4));
        });
    });
});

describe('#factorial', function () {
    it('should return 720 given input 6', function () {
        assert.equal(720, factorial(6));
    })
})

