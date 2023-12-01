//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract voting {

    uint public balancedReceived; //Total balance received (in Wei)
    
    //defining events
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

    //Function to add a vote to a specific address
    function addVoteTo(address payable _to) public {
        _to.transfer(getBalance());
    }

 
    //Function to submit a vote with a payment
    function getVote() public payable {
        balancedReceived += msg.value; //Update the balance received
    }

    //Retains the contract's balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }



//  //Structure of Voting
        bool public isVoting;
//     // Helper
//     struct Vote {
//         address receiver;
//         uint256 timestamp;
//         bool hasVoted;
//         // mapping address with receiver
//     }


// mapping(address => Vote) public votes;

//    function removeVote() external returns (bool) {
//         delete votes[msg.sender];

//         emit RemoveVote(msg.sender);
//         return true;
//     }

}
