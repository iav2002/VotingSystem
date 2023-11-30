//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract voting {
    //Structure of Voting
    bool public isVoting;
    // Helper
    struct Vote {
        address receiver;
        uint256 timestamp; //

        // mapping address with receiver
    }
    mapping(address => Vote) public votes;

    //defining events

    event AddVote(address indexed voter, address receiver, uint256 timestamp);
    event RemoveVote(address voter);
    event StartVoting(address startedBy);
    event StopVoting(address stoppedBy);

    constructor() {
        isVoting = false;
    }

    function startVoting() external returns (bool) {
        isVoting = true;
        emit StartVoting(msg.sender);
        return true;
    }

    function stopVoting() external returns (bool) {
        isVoting = false;
        emit StopVoting(msg.sender);
        return true;
    }

    function addVote(address receiver) external returns (bool) {
        votes[msg.sender].receiver = receiver;
        votes[msg.sender].timestamp = block.timestamp;

        emit AddVote(
            msg.sender,
            votes[msg.sender].receiver,
            votes[msg.sender].timestamp
        );
        return true;
    }

    function removeVote() external returns (bool) {
        delete votes[msg.sender];

        emit RemoveVote(msg.sender);
        return true;
    }

    //Function to submit a vote with a payment
    function getVote() public payable {
        balancedReceived += msg.value; //Update the balance received
    }
}
