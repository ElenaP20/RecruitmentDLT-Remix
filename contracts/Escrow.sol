// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Advert.sol";

contract EscrowService {
    using DateUtils for uint32;

    struct Escrow {
        bytes32 blockHash;
        string ipfsCiphertext;
        uint256 activationDate;
        uint256 expiryDate; // Expiry date in Unix timestamp
    }

    mapping(bytes32 => Escrow) escrows;

    event SuccessfulSubmission(bytes32 indexed blockHash, uint256 indexed activationDate, uint256 indexed expiryDate);
    event AccessGranted(bytes32 indexed blockHash, string indexed ipfsMetadata);

    function getAddress() public view returns(address){
        return address(this);
    }

    function submitSecond(bytes32 blockHash, string memory _ipfs, uint32 _activationDate) public {
        uint256 timestamp = _activationDate.dateToTimestamp();
        uint256 expiry = timestamp + (3 * 30 days); // Expiry date is 3 months (90 days) after activation date
        escrows[blockHash] = Escrow(blockHash, _ipfs, timestamp, expiry);
        emit SuccessfulSubmission(blockHash, _activationDate, expiry);
    }

    function getBlockTimestamp(uint256 blockNumber) internal view returns (uint256) {
        require(blockNumber <= block.number, "Block number must be less than or equal to current block");
        bytes32 blockHash = blockhash(blockNumber);
        require(blockHash != bytes32(0), "Block not found"); // Ensure block exists
        return block.timestamp; // Get the timestamp of the block
    }
    
    function requestAccess(bytes32 blockHash) public returns (string memory) {
        Escrow memory escrow = escrows[blockHash];
        require(escrow.blockHash == blockHash, "No data found for the provided block hash");
        require(escrow.activationDate <= block.timestamp, "Access not yet permitted");
        require(block.timestamp <= escrow.expiryDate, "Access expired");
        emit AccessGranted(blockHash, escrow.ipfsCiphertext);
        return escrow.ipfsCiphertext;
    }
}
