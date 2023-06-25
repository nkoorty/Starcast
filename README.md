# Starcast

## Description
Introducing StarCast, a voting dApp powered by a custom solidity smart contract, deployed on Astar. This dApp offers a seamless and highly secure voting system designed for formal settings, such as council votes and other significant decision-making processes.

StarCast leverages the transperancy and integrity advantages of the blockchain, ensuring that every formal voting event is conducted with the utmost fairness. Governed by the robust smart contract, the entire process guarantees trust and accuracy, providing a reliable platform for critical decision-making.

With StarCast, formal voting processes become streamlined and efficient. Participants receive exclusive one-time QR codes as an invite to vote, fortifying the system's security and safeguarding the sanctity of each vote. The user-friendly interface ensures a smooth and intuitive experience, empowering participants to engage actively in the decision-making process.

Experience the power of StarCast for formal use cases, where every vote matters. Revolutionize the way crucial decisions are made with this esteemed app, maintaining the dignity and integrity that formal settings demand.
### Technologies Used
- Swift
- Express JS Backend
- Solidity smart contract

## Smart Contract
Found at: https://shibuya.subscan.io/account/0x3107bc73e554428ADc0773a9Ff659420416d8BFa?tab=transaction

The SimpleVoting smart contract enables secure voting on the Ethereum blockchain. Participants can cast their votes for "Yes" or "No" options, which are tracked by the yesVotes and noVotes variables.

### Functions

#### vote
The vote function allows participants to submit their vote. It ensures that each participant can only vote once and emits the VoteCast event to notify external systems about the vote cast.

#### getVotes
The getVotes function provides a read-only view of the current vote counts. Participants can access the values of yesVotes and noVotes to obtain the current vote tally.

This smart contract promotes transparency and integrity in the voting process, enabling secure expression of preferences and easy access to the vote results.

For more details, refer to the source code SimpleVoting.sol.

### How to Run
npm install -i
(installing body-parser, ethers, express)

node server.js

## Images

<img src=https://github.com/nkoorty/Starcast/assets/80065244/1c03e1c8-be8e-4a66-ab68-a1503d171c53? width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/707ef642-a521-4dd6-9811-6b50e2290fb5 width=20% height=20%>
