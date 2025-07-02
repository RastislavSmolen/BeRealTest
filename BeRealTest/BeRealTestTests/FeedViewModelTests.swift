//
//  BeRealTestTests.swift
//  BeRealTestTests
//
//  Created by Ras Smolen on 02/07/2025.
//

import XCTest
@testable import BeRealTest

final class FeedViewModelTests: XCTestCase {

    var viewModel: FeedViewModel!

    override func setUp() {
        super.setUp()
        viewModel = FeedViewModel()
        // On init, loadMorePosts is called — posts will load after 1 sec delay
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialState() {
        // Immediately after init, posts should be empty and isLoading true (because load started)
        XCTAssertTrue(viewModel.posts.isEmpty, "Posts should be empty initially")
        XCTAssertTrue(viewModel.isLoading, "isLoading should be true immediately after init")
    }

    func testLoadMorePostsAddsPosts() {
        let expectation = XCTestExpectation(description: "Posts load after delay")

        // Wait for 1.2 seconds to allow async loadMorePosts completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            XCTAssertEqual(self.viewModel.posts.count, 10, "Should load 10 posts")
            XCTAssertFalse(self.viewModel.isLoading, "isLoading should be false after loading")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testIsLoadingPreventsMultipleLoads() {
        XCTAssertTrue(viewModel.isLoading, "isLoading should be true initially due to loading")

        // Try to call loadMorePosts again immediately, posts count should stay the same until first load finishes
        let initialCount = viewModel.posts.count
        viewModel.loadMorePosts()

        // Wait for the load to complete
        let expectation = XCTestExpectation(description: "Wait for loading to complete")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            // After first load, posts count should be pageSize (10)
            XCTAssertEqual(self.viewModel.posts.count, initialCount + 10, "Posts count should increase by pageSize")
            XCTAssertFalse(self.viewModel.isLoading, "isLoading should be false after loading")

            // Now, calling loadMorePosts again should add another 10 posts
            self.viewModel.loadMorePosts()
            XCTAssertTrue(self.viewModel.isLoading, "isLoading should be true after calling loadMorePosts again")

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                XCTAssertEqual(self.viewModel.posts.count, initialCount + 20, "Posts count should increase by another pageSize")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 3.0)
    }
}
