// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Heptasea is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    mapping(uint256=>string) private uriMap;

    constructor() ERC721("Heptasea", "SEA07") {
        uriMap[0] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/0.json";
        uriMap[1] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/1.json";
        uriMap[2] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/2.json";
        uriMap[3] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/3.json";
        uriMap[4] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/4.json";
        uriMap[5] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/5.json";
        uriMap[6] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/6.json";
        uriMap[7] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/7.json";
        uriMap[8] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/8.json";
        uriMap[9] = "https://gateway.pinata.cloud/ipfs/QmXAsXawo6fu8pWQivZujJTcpDp2QHC5uPN5FLMT8zm3bU/9.json";

        for(uint i=0; i<10; i++)
            safeMint(msg.sender, uriMap[i]);
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        uriMap[tokenId] = uri;
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function setTokenURI(uint256 tokenId, string memory uri) public onlyOwner {
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns(string memory){
        return super.tokenURI(tokenId);
    }
}
