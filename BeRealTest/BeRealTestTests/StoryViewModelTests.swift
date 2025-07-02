//
//  Untitled.swift
//  BeRealTest
//
//  Created by Ras Smolen on 02/07/2025.
//

import XCTest
@testable import BeRealTest

final class StoryViewModelTests: XCTestCase {

    var viewModel: StoryViewModel!

    override func setUp() {
        super.setUp()
        viewModel = StoryViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialState() {
        // Right after init, stories should be empty and loading in progress
        XCTAssertTrue(viewModel.stories.isEmpty, "Stories should be empty initially")
        // Can't directly check isLoading (private), but we can infer by calling loadMoreStories again

        // Trying to load again immediately should do nothing because isLoading is true
        let initialCount = viewModel.stories.count
        viewModel.loadMoreStories()
        XCTAssertEqual(viewModel.stories.count, initialCount, "Should not load more stories while loading")
    }

    func testLoadMoreStoriesAddsStories() {
        let expectation = XCTestExpectation(description: "Stories load after delay")

        // Wait for the async loading (1 second delay + buffer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            XCTAssertEqual(self.viewModel.stories.count, 10, "Should load 10 stories initially")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testLoadMoreStoriesPagination() {
        let expectation = XCTestExpectation(description: "Multiple pages load correctly")

        // Wait for first page load
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            XCTAssertEqual(self.viewModel.stories.count, 10, "After first load, should have 10 stories")

            // Load second page
            self.viewModel.loadMoreStories()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                XCTAssertEqual(self.viewModel.stories.count, 20, "After second load, should have 20 stories")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 3.0)
    }
}
