//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract voting {

    uint public balancedReceived; //Total balance received in ITH
    
    //defining events
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

bool public isVoting;

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


}

//  //Structure of Voting
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
     //Add vote 
// function addVote(address _candidate) external {
//     // Check if the voting is active
//     require(isVoting, "Voting is not active");
//     // Check if the sender has not already voted
//     require(!votes[msg.sender].hasVoted, "Voter has already voted");

//     // Record the vote
//     votes[msg.sender] = Vote({
//         receiver: _candidate,
//         timestamp: block.timestamp,
//         hasVoted: true
//     });

//     // Emit an event (if needed)
//     emit AddVote(msg.sender, _candidate);
    




