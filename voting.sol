pragma solidity ^0.6.9;

contract voting {
    //Structure of Voting

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

    constructor() public {
        isVoting = false;
    }

    function startVoting() external returns (bool) {
        isVoting = true;
        emit StartVoting(ms.sender);
        return true;
    }

    function stopVoting() external returns (bool) {
        isVoting = false;
        emit stopVoting(msg.sender);
        return true;
    }

    function addVote(address receiver) external returns (bool) {
        votes[msg.sender].receiver = receiver;
        votes[msg.sender].timestamp = now;

        emit AddVote(
            msg.sender,
            votes[msg.sender].receiver,
            votes[msg.sender].timestamp
        );
        return true;
    }

    function removeVote() external returns(bool){
        delete votes[msg.sender];
        
        emit RemoveVote(msg.sender);
        return true;

    }
    
    function getVote(address voterAddress) external view returns(address candidateAddress){
        return votes[voterAddress].receiver;

    }
    
    
}
