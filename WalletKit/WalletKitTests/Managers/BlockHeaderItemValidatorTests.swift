import XCTest
import Cuckoo
import RealmSwift
@testable import WalletKit

class BlockHeaderItemValidatorTests: XCTestCase {

    private var validator: BlockHeaderItemValidator!

    override func setUp() {
        super.setUp()

        validator = BlockHeaderItemValidator()
    }

    override func tearDown() {
        validator = nil

        super.tearDown()
    }

    func testValidItem() {
        let previousBlock = BlockHeaderItem(version: 536870912, prevBlock: "000000000000837bcdb53e7a106cf0e74bab6ae8bc96481243d31bea3e6b8c92".reversedData!, merkleRoot: "8beab73ba2318e4cbdb1c65624496bc3214d6ba93204e049fb46293a41880b9a".reversedData!, timestamp: 1506023937, bits: 453021074, nonce: 2001025151)
        let item = BlockHeaderItem(version: 536870912, prevBlock: "00000000000025c23a19cc91ad8d3e33c2630ce1df594e1ae0bf0eabe30a9176".reversedData!, merkleRoot: "63241c065cf8240ac64772e064a9436c21dc4c75843e7e5df6ecf41d5ef6a1b4".reversedData!, timestamp: 1506024043, bits: 453021074, nonce: 1373615473)

        XCTAssertTrue(validator.isValid(item: item, previousBlock: previousBlock))
    }

    func testInvalidItem() {
        let previousBlock = BlockHeaderItem(version: 536870912, prevBlock: "000000000000837bcdb53e7a106cf0e74bab6ae8bc96481243d31bea3e6b8c92".reversedData!, merkleRoot: "8beab73ba2318e4cbdb1c65624496bc3214d6ba93204e049fb46293a41880b9a".reversedData!, timestamp: 1506023937, bits: 453021074, nonce: 2001025151)
        let item = BlockHeaderItem(version: 536870912, prevBlock: "00000000000000d0923442e1a8345b82f553786487293204746b2631a6858549".reversedData!, merkleRoot: "63241c065cf8240ac64772e064a9436c21dc4c75843e7e5df6ecf41d5ef6a1b4".reversedData!, timestamp: 1506024043, bits: 453021074, nonce: 1373615473)

        XCTAssertFalse(validator.isValid(item: item, previousBlock: previousBlock))
    }

}