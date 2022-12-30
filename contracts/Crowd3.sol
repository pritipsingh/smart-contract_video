// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Crowd3 {
    struct Post {
        address owner;
        string description;
    }
    mapping (uint256 => Post) public posts;
    uint256 public postCount = 0;
    
    function createPost(address _owner , string memory _description ) public returns (uint256) {
     Post storage post = posts[postCount];
        post.owner = _owner;
        post.description = _description;
        
        postCount++;

        return postCount - 1;
    }

    function getPost() public view returns (Post[] memory) {
        Post[] memory post = new Post[](postCount);
        for (uint256 i = 0; i < postCount; i++) {
            post[i] = posts[i];
        }
        return post;
    }

    function getPostCount() public view returns (uint256) {
        return postCount;
    }
}