// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    mapping (address => bool) hasVoted;
    uint256 public yesVotes;
    uint256 public noVotes;

    enum VoteOption { Yes, No }

    event VoteCast(address voter, VoteOption option);

    function vote(VoteOption option) public {
        require(!hasVoted[msg.sender], "You can only vote once");

        if (option == VoteOption.Yes) {
            yesVotes += 1;
        } else {
            noVotes += 1;
        }

        hasVoted[msg.sender] = true;
        emit VoteCast(msg.sender, option);
    }

    function getVotes() public view returns (uint256 yes, uint256 no) {
        return (yesVotes, noVotes);
    }
}
