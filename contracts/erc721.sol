// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
import "./IERC721Receiver.sol";
contract ERC721 {
    //My Awesome NFTs
    string public name;
    //MAN
    string public symbol;
//counter for assigning new token ids (starts from 0 or 1)
    uint256 public nextTokenIdToMint;
    //address of the contract owner
    address public contractOwner;

// tokenid -> owner address
    mapping(uint256 => address) internal _owners;
    // owner address -> balance
    mapping(address => uint256) internal _balances;
    // token id -> approved address
    mapping(uint256 => address) internal _tokenApprovals;

// owner addres -> operator true/false
mapping(address => mapping(address => bool)) internal _operatorApprovals;
// tokenid -> meta data of token (URI)
mapping(uint256 => string) _tokenUris;


    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        nextTokenIdToMint = 0;
        contractOwner = msg.sender;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        require(_owner != address(0), "Owner cannot be zero address");
        return _balances[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns (address) {
        address owner = _owners[_tokenId];
        require(owner != address(0), "Token does not exist");
        return owner;
    }

    //internal functions



}