const fs = require('fs');
const assert = require('chai').assert;
const expect = require('chai').expect;
const sourceFile = fs.readFileSync('tests/javascript/code.js', 'utf-8');
const jsdom = require('mocha-jsdom')
jsdom({ src: sourceFile, url: "http://localhost" })

describe('#ascendingSum', function () {
    it('should return an array of the sorted partial sums for positive numbers', function () {
        expect(ascendingSum([1,2,3,4])).to.deep.equal([1,3,6,10]);
    })

   it('should also work for negative numbers', function () {
        expect(ascendingSum([0,-1,110,2])).to.deep.equal([-1,-1,1,111]);
   }) 

   it('should allow for non-integer values', function () {
       expect(ascendingSum([1.1,5.45,2.3,-2.3])).to.deep.equal([-2.3, -1.2, 1,1, 6.55])
   })

})
