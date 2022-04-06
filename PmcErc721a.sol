// SPDX-License-Identifier: MIT

import "erc721a/contracts/ERC721A.sol";

pragma solidity ^0.8.0;
/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Enumerable is IERC721 {
    /**
     * @dev Returns the total amount of tokens stored by the contract.
     */
    // function totalSupply() external view returns (uint256);

    /**
     * @dev Returns a token ID owned by `owner` at a given `index` of its token list.
     * Use along with {balanceOf} to enumerate all of ``owner``'s tokens.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256 tokenId);

    /**
     * @dev Returns a token ID at a given `index` of all the tokens stored by the contract.
     * Use along with {totalSupply} to enumerate all tokens.
     */
    function tokenByIndex(uint256 index) external view returns (uint256);
}


/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
// contract ERC721 is Context, ERC165, IERC721, IERC721Metadata {
// contract ERC721 is ERC721A {

//     using Address for address;
//     using Strings for uint256;

//     // Token name
//     string private _name;

//     // Token symbol
//     string private _symbol;

//     // Mapping from token ID to owner address
//     mapping(uint256 => address) private _owners;

//     // Mapping owner address to token count
//     mapping(address => uint256) private _balances;

//     // Mapping from token ID to approved address
//     mapping(uint256 => address) private _tokenApprovals;

//     // Mapping from owner to operator approvals
//     mapping(address => mapping(address => bool)) private _operatorApprovals;

//     // constructor() ERC721A("Azuki", "AZUKI") {}
//     constructor(string memory name_, string memory symbol_) ERC721A(name_, symbol_) {
//         _name = name_;
//         _symbol = symbol_;
//     }


//     /**
//      * @dev See {IERC165-supportsInterface}.
//      */
//     // function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
//     function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721A) returns (bool) {
//         return
//             interfaceId == type(IERC721).interfaceId ||
//             interfaceId == type(IERC721Metadata).interfaceId ||
//             super.supportsInterface(interfaceId);
//     }

//     // /**
//     //  * @dev See {IERC721Metadata-name}.
//     //  */
//     // function name() public view virtual override returns (string memory) {
//     //     return _name;
//     // }

//     // /**
//     //  * @dev See {IERC721Metadata-symbol}.
//     //  */
//     // function symbol() public view virtual override returns (string memory) {
//     //     return _symbol;
//     // }

//     // /**
//     //  * @dev See {IERC721Metadata-tokenURI}.
//     //  */
//     // function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
//     //     require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

//     //     string memory baseURI = _baseURI();
//     //     return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
//     // }

//     // /**
//     //  * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
//     //  * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
//     //  * by default, can be overriden in child contracts.
//     //  */
//     // function _baseURI() internal view virtual  returns (string memory) {
//     //     return "";
//     // }

//     // /**
//     //  * @dev See {IERC721-approve}.
//     //  */
//     // function approve(address to, uint256 tokenId) public virtual override {
//     //     address owner = ERC721.ownerOf(tokenId);
//     //     require(to != owner, "ERC721: approval to current owner");

//     //     require(
//     //         _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
//     //         "ERC721: approve caller is not owner nor approved for all"
//     //     );

//     //     _approve(to, tokenId);
//     // }

//     // /**
//     //  * @dev See {IERC721-getApproved}.
//     //  */
//     // function getApproved(uint256 tokenId) public view virtual override returns (address) {
//     //     require(_exists(tokenId), "ERC721: approved query for nonexistent token");

//     //     return _tokenApprovals[tokenId];
//     // }

//     // /**
//     //  * @dev See {IERC721-setApprovalForAll}.
//     //  */
//     // function setApprovalForAll(address operator, bool approved) public virtual override {
//     //     require(operator != _msgSender(), "ERC721: approve to caller");

//     //     _operatorApprovals[_msgSender()][operator] = approved;
//     //     emit ApprovalForAll(_msgSender(), operator, approved);
//     // }

//     // /**
//     //  * @dev See {IERC721-isApprovedForAll}.
//     //  */
//     // function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
//     //     return _operatorApprovals[owner][operator];
//     // }

//     // ERC721Aを採用する
//     // /**
//     //  * @dev See {IERC721-transferFrom}.
//     //  */
//     // function transferFrom(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId
//     // ) public virtual override {
//     //     //solhint-disable-next-line max-line-length
//     //     require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");

//     //     _transfer(from, to, tokenId);
//     // }

//     // /**
//     //  * @dev See {IERC721-safeTransferFrom}.
//     //  */
//     // function safeTransferFrom(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId
//     // ) public virtual override {
//     //     safeTransferFrom(from, to, tokenId, "");
//     // }

//     // ERC721A のものを採用
//     // /**
//     //  * @dev See {IERC721-safeTransferFrom}.
//     //  */
//     // function safeTransferFrom(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId,
//     //     bytes memory _data
//     // ) public virtual override {
//     //     require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
//     //     _safeTransfer(from, to, tokenId, _data);
//     // }

//     // /**
//     //  * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
//     //  * are aware of the ERC721 protocol to prevent tokens from being forever locked.
//     //  *
//     //  * `_data` is additional data, it has no specified format and it is sent in call to `to`.
//     //  *
//     //  * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
//     //  * implement alternative mechanisms to perform token transfer, such as signature-based.
//     //  *
//     //  * Requirements:
//     //  *
//     //  * - `from` cannot be the zero address.
//     //  * - `to` cannot be the zero address.
//     //  * - `tokenId` token must exist and be owned by `from`.
//     //  * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
//     //  *
//     //  * Emits a {Transfer} event.
//     //  */
//     // function _safeTransfer(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId,
//     //     bytes memory _data
//     // ) internal virtual {
//     //     _transfer(from, to, tokenId);
//     //     require(_checkOnERC721Received(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
//     // }

//     // /**
//     //  * @dev Returns whether `tokenId` exists.
//     //  *
//     //  * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
//     //  *
//     //  * Tokens start existing when they are minted (`_mint`),
//     //  * and stop existing when they are burned (`_burn`).
//     //  */
//     // function _exists(uint256 tokenId) internal view virtual override returns (bool) {
//     //     return _owners[tokenId] != address(0);
//     // }

//     // // 事前チェックで使っている
//     // /**
//     //  * @dev Returns whether `spender` is allowed to manage `tokenId`.
//     //  *
//     //  * Requirements:
//     //  *
//     //  * - `tokenId` must exist.
//     //  */
//     // function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool) {
//     //     require(_exists(tokenId), "ERC721: operator query for nonexistent token");
//     //     address owner = ERC721A.ownerOf(tokenId);
//     //     return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
//     // }

//     // /**
//     //  * @dev Safely mints `tokenId` and transfers it to `to`.
//     //  *
//     //  * Requirements:
//     //  *
//     //  * - `tokenId` must not exist.
//     //  * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
//     //  *
//     //  * Emits a {Transfer} event.
//     //  */
//     // function _safeMint(address to, uint256 tokenId) internal virtual override {
//     //     _safeMint(to, tokenId, "");
//     // }


//     // _safeMintは ERC721A を採用する
//     // /**
//     //  * @dev Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
//     //  * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
//     //  */
//     // function _safeMint(
//     //     address to,
//     //     uint256 tokenId,
//     //     bytes memory _data
//     // ) internal virtual {
//     //     _mint(to, tokenId);
//     //     require(
//     //         _checkOnERC721Received(address(0), to, tokenId, _data),
//     //         "ERC721: transfer to non ERC721Receiver implementer"
//     //     );
//     // }


//     // _mint も ERC721Aを採用した方がベター
//     // /**
//     //  * @dev Mints `tokenId` and transfers it to `to`.
//     //  *
//     //  * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
//     //  *
//     //  * Requirements:
//     //  *
//     //  * - `tokenId` must not exist.
//     //  * - `to` cannot be the zero address.
//     //  *
//     //  * Emits a {Transfer} event.
//     //  */
//     // function _mint(address to, uint256 tokenId) internal virtual {
//     //     require(to != address(0), "ERC721: mint to the zero address");
//     //     require(!_exists(tokenId), "ERC721: token already minted");

//     //     _beforeTokenTransfer(address(0), to, tokenId);

//     //     _balances[to] += 1;
//     //     _owners[tokenId] = to;

//     //     emit Transfer(address(0), to, tokenId);
//     // }

//     // /**
//     //  * @dev Destroys `tokenId`.
//     //  * The approval is cleared when the token is burned.
//     //  *
//     //  * Requirements:
//     //  *
//     //  * - `tokenId` must exist.
//     //  *
//     //  * Emits a {Transfer} event.
//     //  */
//     // function _burn(uint256 tokenId) internal virtual override {
//     //     address owner = ERC721A.ownerOf(tokenId);

//     //     _beforeTokenTransfer(owner, address(0), tokenId);

//     //     // Clear approvals
//     //     _approve(address(0), tokenId);

//     //     _balances[owner] -= 1;
//     //     delete _owners[tokenId];

//     //     emit Transfer(owner, address(0), tokenId);
//     // }


//     // _transfer は ERC721Aを採用
//     // /**
//     //  * @dev Transfers `tokenId` from `from` to `to`.
//     //  *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
//     //  *
//     //  * Requirements:
//     //  *
//     //  * - `to` cannot be the zero address.
//     //  * - `tokenId` token must be owned by `from`.
//     //  *
//     //  * Emits a {Transfer} event.
//     //  */
//     // function _transfer(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId
//     // ) internal virtual {
//     //     require(ERC721.ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
//     //     require(to != address(0), "ERC721: transfer to the zero address");

//     //     _beforeTokenTransfer(from, to, tokenId);

//     //     // Clear approvals from the previous owner
//     //     _approve(address(0), tokenId);

//     //     _balances[from] -= 1;
//     //     _balances[to] += 1;
//     //     _owners[tokenId] = to;

//     //     emit Transfer(from, to, tokenId);
//     // }

//     // /**
//     //  * @dev Approve `to` to operate on `tokenId`
//     //  *
//     //  * Emits a {Approval} event.
//     //  */
//     // function _approve(address to, uint256 tokenId) internal virtual {
//     //     _tokenApprovals[tokenId] = to;
//     //     emit Approval(ERC721A.ownerOf(tokenId), to, tokenId);
//     // }


//     // // 事前のチェックで使っている
//     // /**
//     //  * @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
//     //  * The call is not executed if the target address is not a contract.
//     //  *
//     //  * @param from address representing the previous owner of the given token ID
//     //  * @param to target address that will receive the tokens
//     //  * @param tokenId uint256 ID of the token to be transferred
//     //  * @param _data bytes optional data to send along with the call
//     //  * @return bool whether the call correctly returned the expected magic value
//     //  */
//     // function _checkOnERC721Received(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId,
//     //     bytes memory _data
//     // ) private returns (bool) {
//     //     if (to.isContract()) {
//     //         try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {
//     //             return retval == IERC721Receiver.onERC721Received.selector;
//     //         } catch (bytes memory reason) {
//     //             if (reason.length == 0) {
//     //                 revert("ERC721: transfer to non ERC721Receiver implementer");
//     //             } else {
//     //                 assembly {
//     //                     revert(add(32, reason), mload(reason))
//     //                 }
//     //             }
//     //         }
//     //     } else {
//     //         return true;
//     //     }
//     // }


//     // // 事前のチェックで使っている
//     // /**
//     //  * @dev Hook that is called before any token transfer. This includes minting
//     //  * and burning.
//     //  *
//     //  * Calling conditions:
//     //  *
//     //  * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
//     //  * transferred to `to`.
//     //  * - When `from` is zero, `tokenId` will be minted for `to`.
//     //  * - When `to` is zero, ``from``'s `tokenId` will be burned.
//     //  * - `from` and `to` are never both zero.
//     //  *
//     //  * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
//     //  */
//     // function _beforeTokenTransfer(
//     //     address from,
//     //     address to,
//     //     uint256 tokenId
//     // ) internal virtual {}

// }

// File: @openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol



// pragma solidity ^0.8.0;



/**
 * @dev This implements an optional extension of {ERC721} defined in the EIP that adds
 * enumerability of all the token ids in the contract as well as all token ids owned by each
 * account.
 */
// abstract contract ERC721Enumerable is ERC721, IERC721Enumerable {
abstract contract ERC721Enumerable is ERC721A, IERC721Enumerable {
    
    // Mapping from owner to list of owned token IDs
    mapping(address => mapping(uint256 => uint256)) private _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // Array with all token ids, used for enumeration
    uint256[] private _allTokens;

    // Mapping from token id to position in the allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(IERC165, ERC721A) returns (bool) {
        return interfaceId == type(IERC721Enumerable).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721Enumerable-tokenOfOwnerByIndex}.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721A.balanceOf(owner), "ERC721Enumerable: owner index out of bounds");
        return _ownedTokens[owner][index];
    }

    // /**
    //  * @dev See {IERC721Enumerable-totalSupply}.
    //  */
    // // function totalSupply() public view virtual override returns (uint256) {
    // function totalSupply() public view virtual override(ERC721A, IERC721Enumerable) returns (uint256) {
    //     return _allTokens.length;
    // }

    /**
     * @dev See {IERC721Enumerable-tokenByIndex}.
     */
    function tokenByIndex(uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721A.totalSupply(), "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }


    // // 事前のチェックで使っている
    // /**
    //  * @dev Hook that is called before any token transfer. This includes minting
    //  * and burning.
    //  *
    //  * Calling conditions:
    //  *
    //  * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
    //  * transferred to `to`.
    //  * - When `from` is zero, `tokenId` will be minted for `to`.
    //  * - When `to` is zero, ``from``'s `tokenId` will be burned.
    //  * - `from` cannot be the zero address.
    //  * - `to` cannot be the zero address.
    //  *
    //  * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
    //  */
    // function _beforeTokenTransfer(
    //     address from,
    //     address to,
    //     uint256 tokenId
    // ) internal virtual override {
    //     super._beforeTokenTransfer(from, to, tokenId);

    //     if (from == address(0)) {
    //         _addTokenToAllTokensEnumeration(tokenId);
    //     } else if (from != to) {
    //         _removeTokenFromOwnerEnumeration(from, tokenId);
    //     }
    //     if (to == address(0)) {
    //         _removeTokenFromAllTokensEnumeration(tokenId);
    //     } else if (to != from) {
    //         _addTokenToOwnerEnumeration(to, tokenId);
    //     }
    // }

    /**
     * @dev Private function to add a token to this extension's ownership-tracking data structures.
     * @param to address representing the new owner of the given token ID
     * @param tokenId uint256 ID of the token to be added to the tokens list of the given address
     */
    function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
        uint256 length = ERC721A.balanceOf(to);
        _ownedTokens[to][length] = tokenId;
        _ownedTokensIndex[tokenId] = length;
    }

    /**
     * @dev Private function to add a token to this extension's token tracking data structures.
     * @param tokenId uint256 ID of the token to be added to the tokens list
     */
    function _addTokenToAllTokensEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    /**
     * @dev Private function to remove a token from this extension's ownership-tracking data structures. Note that
     * while the token is not assigned a new owner, the `_ownedTokensIndex` mapping is _not_ updated: this allows for
     * gas optimizations e.g. when performing a transfer operation (avoiding double writes).
     * This has O(1) time complexity, but alters the order of the _ownedTokens array.
     * @param from address representing the previous owner of the given token ID
     * @param tokenId uint256 ID of the token to be removed from the tokens list of the given address
     */
    function _removeTokenFromOwnerEnumeration(address from, uint256 tokenId) private {
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = ERC721A.balanceOf(from) - 1;
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
        }

        // This also deletes the contents at the last position of the array
        delete _ownedTokensIndex[tokenId];
        delete _ownedTokens[from][lastTokenIndex];
    }

    /**
     * @dev Private function to remove a token from this extension's token tracking data structures.
     * This has O(1) time complexity, but alters the order of the _allTokens array.
     * @param tokenId uint256 ID of the token to be removed from the tokens list
     */
    function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length - 1;
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        delete _allTokensIndex[tokenId];
        _allTokens.pop();
    }
}


// File: @openzeppelin/contracts/access/Ownable.sol
pragma solidity ^0.8.0;
/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

pragma solidity >=0.7.0 <0.9.0;

contract PmcErc721a is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string baseURI;
  string public baseExtension = ".json";
  uint256 public cost = 0.05 ether;
  uint256 public maxSupply = 10000;
  uint256 public maxMintAmount = 20;
  bool public paused = false;
  bool public revealed = false;
  string public notRevealedUri;

//   constructor(
//     string memory _name,
//     string memory _symbol,
//     string memory _initBaseURI,
//     string memory _initNotRevealedUri
//   ) ERC721(_name, _symbol) {
//     setBaseURI(_initBaseURI);
//     setNotRevealedURI(_initNotRevealedUri);
//   }

  constructor(
    string memory _name,
    string memory _symbol,
    string memory _initBaseURI,
    string memory _initNotRevealedUri
  ) ERC721A(_name, _symbol) {
    setBaseURI(_initBaseURI);
    setNotRevealedURI(_initNotRevealedUri);
  }


  // internal
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }

  // public
  function mint(uint256 _mintAmount) public payable {
    uint256 supply = totalSupply();
    require(!paused);
    require(_mintAmount > 0);
    require(_mintAmount <= maxMintAmount);
    require(supply + _mintAmount <= maxSupply);

    if (msg.sender != owner()) {
      require(msg.value >= cost * _mintAmount);
    }

    // ERC721A 方式でミント
    _safeMint(msg.sender, _mintAmount);

    // for (uint256 i = 1; i <= _mintAmount; i++) {
    //   _safeMint(msg.sender, supply + i);
    // }
  }

  function walletOfOwner(address _owner)
    public
    view
    returns (uint256[] memory)
  {
    uint256 ownerTokenCount = balanceOf(_owner);
    uint256[] memory tokenIds = new uint256[](ownerTokenCount);
    for (uint256 i; i < ownerTokenCount; i++) {
      tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
    }
    return tokenIds;
  }

  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    // require(
    //   _exists(tokenId),
    //   "ERC721Metadata: URI query for nonexistent token"
    // );
    if (!_exists(tokenId)) revert URIQueryForNonexistentToken();


    if(revealed == false) {
        return notRevealedUri;
    }

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
        : "";
  }

  //only owner
  function setReveal(bool _reveal) public onlyOwner() {
    //   revealed = true;
    revealed = _reveal;
      
  }
  
  function setCost(uint256 _newCost) public onlyOwner() {
    cost = _newCost;
  }

  function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner() {
    maxMintAmount = _newmaxMintAmount;
  }
  
  function setNotRevealedURI(string memory _notRevealedURI) public onlyOwner {
    notRevealedUri = _notRevealedURI;
  }

  function setBaseURI(string memory _newBaseURI) public onlyOwner {
    baseURI = _newBaseURI;
  }

  function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
    baseExtension = _newBaseExtension;
  }

  function pause(bool _state) public onlyOwner {
    paused = _state;
  }
 
  function withdraw() public payable onlyOwner {
    (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(success);
  }
}