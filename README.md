# Starcast

## Description
Introducing Starcast, an iOS-based voting dApp powered by a custom Solidity smart contract, deployed on Astar (Shibuya) Network. This dApp offers a seamless and highly secure voting system designed for formal settings, such as council votes and other significant decision-making processes.

Starcast leverages the transperancy and integrity advantages of the blockchain, ensuring that every formal voting event is conducted with the utmost fairness. Governed by the robust smart contract, the entire process guarantees trust and accuracy, providing a reliable platform for critical decision-making.

With Starcast, formal voting processes become streamlined and efficient via the Metamask and the Polkadot.js wallet logins. Keep your data secure via the straight-forward login process which further emphasises the high accessibility of our ios app. Participants receive exclusive one-time QR codes as an invite to vote, fortifying the system's security and safeguarding the sanctity of each vote. The user-friendly interface ensures a smooth and intuitive experience, empowering participants to engage actively in the decision-making process.

Experience the power of StarCast for both formal and informal use cases alike, where each vote matters. Choose where to go out to eat with your friends, or where you're going to celebrate your friends' birthday. Revolutionize the way crucial decisions are made with this esteemed app, maintaining the transparency, dignity, and integrity that formal settings demand.

### Technologies Used
- Swift (UIKit)
- JavaScript (Express.js Server) Backend
- Solidity Voting Smart contract

## Smart Contract
Found at: https://shibuya.subscan.io/account/0x3107bc73e554428ADc0773a9Ff659420416d8BFa?tab=transaction

The SimpleVoting smart contract enables secure voting on the Ethereum blockchain. Participants can cast their votes for "Yes" or "No" options, which are tracked by the yesVotes and noVotes variables.

### Functions

#### vote
The vote function allows participants to submit their vote. It ensures that each participant can only vote once and emits the VoteCast event to notify external systems about the vote cast.

#### getVotes
The getVotes function provides a read-only view of the current vote counts. Participants can access the values of yesVotes and noVotes to obtain the current vote tally.

This smart contract promotes transparency and integrity in the voting process, enabling secure expression of preferences and easy access to the vote results.

For more details, refer to the source code found at: StarcastBackend/SimpleVoting.sol.

### How to Run
Clone the repository, enter the Backend folder, and run

    npm install -i

This installs body-parser, ethers, express.js, etc. Run the server using

    node server.js

Run the iOS App by opening the `.xcodeproj` file.

## Images
<img src=https://github.com/nkoorty/Starcast/assets/80065244/db9d8eea-bae6-4d9c-8e5f-1f7cf3546eae width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/f3486e11-e9f3-4b5b-b4ea-f8d70a8b959c width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/4faeeab5-e375-4480-a311-c83b77624b68 width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/853ff609-50c8-4cb3-aa05-7d89032f95d2 width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/4062db28-8b1e-4d30-b3d7-5b9a63d0fd44 width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/2d202cd2-de00-4222-8d5d-0ebf89e0c5c3 width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/f4203677-758d-41d3-a472-52159362a882 width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/ad81be78-8255-45b8-aaf8-38800c955234 width=20% height=20%>
<img src=https://github.com/nkoorty/Starcast/assets/80065244/de89c2b5-fe26-4e48-8e08-a6cac0bf2c65 width=20% height=20%>
