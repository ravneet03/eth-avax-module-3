// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract token is ERC20 {

    address private owner;
    constructor() ERC20("SLOY", "SLY") {
        owner = msg.sender;
       _mint(owner, 100 * 10**uint(decimals()));
    }

    modifier auntheticate(){
        require(owner == msg.sender );
        _;
     }

    function mint (address receiver,uint256 amount) public payable auntheticate {
        _mint(receiver,amount);
    }

    function burn(address receiver,uint256 amount) public {
        _burn(receiver,amount);
    }



}
