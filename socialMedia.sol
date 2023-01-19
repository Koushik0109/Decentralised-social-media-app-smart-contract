

pragma solidity ^0.5.0;

contract SocialMedia {

    // Track balances of users
    mapping (address => uint) public userBalances;

    // Track content posted by users
    mapping (uint => Content) public content;
    uint contentIndex;

    // Struct to track user content
    struct Content {
        address owner;
        string message;
        uint timestamp;
    }

    // Event to signal successful content post
    event ContentPosted (
        address indexed _from,
        string _message
    );

    // Function to post content
    function postContent (string memory _message) public {
        // Create new content
        Content memory newContent;
        newContent.owner = msg.sender;
        newContent.message = _message;
        newContent.timestamp = now;

        // Add content to mapping
        content[contentIndex] = newContent;
        contentIndex++;

        // Reward user for posting content
        userBalances[msg.sender] += 10;

        // Signal successful content post
        emit ContentPosted(msg.sender, _message);
    }

    // Function to view user balance
    function viewBalance() public view returns (uint) {
        return userBalances[msg.sender];
    }
}