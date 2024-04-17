// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    //address public jobAdvertContractAddress;  // Store JobAdvert contract address
    event NFTMinted(uint256 tokenId, address indexed owner, string tokenURI, bytes32 ipfsHash);

    uint256 public totalTokens;

    // Creating a counter for the token IDs
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Mapping to store the hash associated with each NFT
    mapping(uint256 => bytes32) public nftHashes;

    // Mapping to store the existence of each token
    mapping(uint256 => bool) private _tokenExists;

    constructor() ERC721("JobApplicationNFT", "JOBAPP") {
        //jobAdvertContractAddress = _jobAdvertContractAddress;
    }
    
    function mint(address _to, string calldata _uri) external returns (uint256){ 
        require(bytes(_uri).length > 0, "URI cannot be empty"); 
        
        _tokenIds.increment();
        uint256 newId = _tokenIds.current();
        _mint(_to, newId); // Assign ownership of the NFT with the current tokenId to the address provided in _to
                        
        _setTokenURI(newId, _uri); // Associates the _uri with the tokenId.
        _tokenExists[newId] = true;
        
        // Calculate the hash of the tokenURI and store it
        bytes32 ipfsHash = generateIPFSHash(_uri);
        nftHashes[newId] = ipfsHash;
        
        emit NFTMinted(newId, _to, _uri, ipfsHash); 
        totalTokens++;
        return newId;
    }

    function burn(uint256 tokenId) public {
        require(tokenExists(tokenId), "Token does not exist");
        _burn(tokenId);
    }

    function tokenByIndex(uint256 index) external view returns (uint256) {
        require(index < _tokenIds.current(), "Index out of bounds");
        return index + 1; // Assuming token IDs start from 1
    }

    function totalSupply() public view returns(uint256){
        return totalTokens;
    }
    // Function to retrieve the block hash of a specific token ID
    function getBlockHashForToken(uint256 tokenId) external view returns (bytes32) {
        require(tokenExists(tokenId), "Token does not exist");
        return blockhash(tokenId);
    }

    // Function to verify if the provided hash matches the hash stored for an NFT
    function verifyNFTHash(uint256 tokenId, bytes32 providedHash) external view returns (bool) {
        require(tokenExists(tokenId), "Token does not exist");
        return nftHashes[tokenId] == providedHash;
    }

    // Function to check if a token exists
    function tokenExists(uint256 tokenId) public view returns (bool) {
        return _tokenExists[tokenId];
    }

    // Function to generate the hash of an IPFS link
    function generateIPFSHash(string memory ipfsLink) public pure returns (bytes32) {
        bytes memory ipfsBytes = bytes(ipfsLink);
        return keccak256(ipfsBytes);
    }
}
