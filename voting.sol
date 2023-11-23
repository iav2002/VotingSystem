pragma solidity ^0.5.0;

contract voting{
    //Structure of Voting

    struct Vote{
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

    constructor() public{
        isVoting = false;
    }

    function startVoting() external returns(bool){
        isVoting = true;
        emit StartVoting(ms.sender);
        return true;

    }

}